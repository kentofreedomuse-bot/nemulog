# アプリケーション名
ねむログ

# アプリケーション概要
睡眠薬を服用している人が、副作用や睡眠状態を記録・可視化し、日常生活や診察に役立てられるアプリ

# URL
https://nemulog.onrender.com

# テスト用アカウント
BASIC認証ID:admin
BASIC認証PASSWORD:K21612261
e-mail:test@example.com
password:testnemulog

# 今後の実装予定
・入眠時間の入力欄追加
・薬の書類の入力欄追加、薬ごとのソート
・グラフの表示期間切り替え

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
| actual_sleep_time     | integer    | null: false |
| sleep_quality         | integer    | null: false |
| medicine_taken        | boolean    | null: false, default: false |
| condition             | integer    | null: false, default: 3|
| sleepiness            | integer    | null: false, default: 3|

### Association
- belongs_to :user