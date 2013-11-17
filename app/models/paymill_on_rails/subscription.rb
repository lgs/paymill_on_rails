module PaymillOnRails
  class Subscription < ActiveRecord::Base
     
    # paymill_card_token is one-time used token
    # and is not stored into DB, bu is used by 
    # Paymill::Payment.create to get payment,
    # then just payment.id is stored 
    # ( see: https://github.com/dkd/paymill-ruby )
    attr_accessor :paymill_card_token

    belongs_to :plan
    validates_presence_of :plan_id
    validates_presence_of :email

    def save_with_payment
      if valid?
        client = Paymill::Client.create email: email, description: name
        payment = Paymill::Payment.create token: paymill_card_token, client: client.id
        subscription = Paymill::Subscription.create offer: plan.paymill_id, client: client.id, payment: payment.id
  
        self.paymill_id = subscription.id
        save!
      end
    rescue Paymill::PaymillError => e
      logger.error "Paymill error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card. Please try again."
      false
    end
  end
end
