class AddSymptomNoteToSleepLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :sleep_logs, :symptom_note, :text
  end
end
