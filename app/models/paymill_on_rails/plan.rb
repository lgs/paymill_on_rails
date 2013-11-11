module PaymillOnRails
  class Plan < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection

    has_many :subscriptions
  end
end


