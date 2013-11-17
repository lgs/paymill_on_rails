module PaymillOnRails
  class Plan < ActiveRecord::Base
    has_many :subscriptions
  end
end


