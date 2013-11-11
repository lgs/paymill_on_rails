# This migration comes from paymill_on_rails (originally 20131111132308)
class CreatePaymillOnRailsSubscriptions < ActiveRecord::Migration
  def change
    create_table :paymill_on_rails_subscriptions do |t|

      t.timestamps
    end
  end
end
