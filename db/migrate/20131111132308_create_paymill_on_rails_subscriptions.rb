class CreatePaymillOnRailsSubscriptions < ActiveRecord::Migration
  def change
    create_table :paymill_on_rails_subscriptions do |t|

      t.timestamps
    end
  end
end
