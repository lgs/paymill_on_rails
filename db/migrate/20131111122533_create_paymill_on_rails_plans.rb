class CreatePaymillOnRailsPlans < ActiveRecord::Migration
  def change
    create_table :paymill_on_rails_plans do |t|

      t.string :name
      t.string :price
      t.string :paymill_id

      t.timestamps
    end
  end
end
