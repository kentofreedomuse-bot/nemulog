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
password:test1121  

# 利用方法
1.アプリを起動したらユーザー新規登録画面が出るので、ユーザー登録を行う  
2.ユーザー登録後、ヘッダーから「体調を記録する」ボタンを押す  
3.薬の服用、睡眠時間等を入力し（選択式）「記録を保存する」ボタンを押す  
　⇒トップページに遷移され、記録がグラフで反映される


# アプリケーション制作背景
私自身が夜眠れないという悩みがあり、現在でも睡眠薬を服用中。  
しかし、睡眠薬を飲めば眠れるが、副作用によって日中の生活の質が下がってしまう。  
その為、睡眠薬を服用している人が、副作用や睡眠状態を記録・可視化し、日常生活や診察に役立てられるアプリを作りたいと思い制作に至った。

# 洗い出した要件 
https://docs.google.com/spreadsheets/d/1dWzJcBoU3ADSdeUtqnD1rD6e7dpdZykzdBKxp_opI7E/edit?gid=751654853#gid=75165485

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

# 使用言語
・HTML  
・CSS  
・Ruby on Rails  
・JavaScript
