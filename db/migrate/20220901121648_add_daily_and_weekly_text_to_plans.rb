class AddDailyAndWeeklyTextToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :daily_text, :string
    add_column :plans, :weekly_text, :string
  end
end
