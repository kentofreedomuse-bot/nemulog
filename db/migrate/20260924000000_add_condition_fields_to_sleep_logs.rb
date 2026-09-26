class AddConditionFieldsToSleepLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :sleep_logs, :medicine_taken, :boolean, null: false, default: false
    add_column :sleep_logs, :condition, :integer, null: false, default: 3
    add_column :sleep_logs, :sleepiness, :integer, null: false, default: 3
  end
end