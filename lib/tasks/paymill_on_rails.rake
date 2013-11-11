# desc "Explaining what the task does"
# task :paymill_on_rails do
#   # Task goes here
# end

require 'paymill'

namespace :paymill_on_rails do
  desc "Import all subscription plans (Offers) from paymill"
  task :import_plans => :environment do
    
    PaymillOnRails::Plan.destroy_all
    
    offers = Paymill::Offer.all
    offers.each do |offer|
      PaymillOnRails::Plan.create paymill_id: offer.id, name: offer.name, price: offer.amount / 100.0
    end
  end
end

