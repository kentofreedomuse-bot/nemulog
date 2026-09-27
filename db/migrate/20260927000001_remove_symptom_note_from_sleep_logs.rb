class RemoveSymptomNoteFromSleepLogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :sleep_logs, :symptom_note, :text
  end
end
