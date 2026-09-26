# テーブル設計

## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association
- has_many :sleep_logs



## sleep_logs

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| sleep_date            | date       | null: false |
| sleep_time            | datetime   | null: false |
| wake_time             | datetime   | null: false |
| actual_sleep_time     | integer    | null: false |
| sleep_quality         | integer    | null: false |

### Association
- belongs_to :user
- has_many :medications
- has_one :daily_condition



## medication_types

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| medication_name       | string     | null: false |

### Association
- has_many :medications



## medications

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| sleep_log             | references | null: false, foreign_key: true |
| medication_type       | references | null: false, foreign_key: true  |
| dosage_mg             | float      | null: false |
| taken_time            | datetime   | null: false |

### Association
- belongs_to :sleep_log
- belongs_to :medication_type



## daily_conditions
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| sleep_log          | references | null: false, foreign_key: true |
| mood_score         | integer    | null: false |
| energy_score       | integer    | null: false |
| side_effects_check | boolean    | null: false |

### Association
- belongs_to :sleep_log


t.references :user, null: false, foreign_key: true
      t.date :sleep_date, null: false
      t.datetime :sleep_time, null: false
      t.datetime :wake_time, null: false
      t.integer :actual_sleep_time, null: false
      t.integer :sleep_quality, null: false
      t.timestamps
