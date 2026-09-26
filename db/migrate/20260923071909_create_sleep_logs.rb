class CreateSleepLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :sleep_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.date :sleep_date, null: false
      t.datetime :sleep_time, null: false
      t.datetime :wake_time, null: false
      t.integer :actual_sleep_time, null: false
      t.integer :sleep_quality, null: false
      t.timestamps
    end
  end
end
