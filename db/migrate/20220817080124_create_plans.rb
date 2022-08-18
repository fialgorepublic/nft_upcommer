class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :day_price
      t.float :week_price

      t.timestamps
    end
  end
end