class AddMedicineTypeToSleepLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :sleep_logs, :medicine_type, :string
  end
end
