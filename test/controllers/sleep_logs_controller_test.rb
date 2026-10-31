require "test_helper"

class SleepLogsControllerTest < ActionDispatch::IntegrationTest
  test "index shows saved sleep logs in recent history" do
    user = User.create!(nickname: "テスト", email: "history@example.com", password: "password123")
    user.sleep_logs.create!(
      sleep_date: Date.current,
      sleep_time: Time.current,
      wake_time: Time.current,
      actual_sleep_time: 450,
      sleep_quality: 2,
      condition: 2,
      sleepiness: 1,
      medicine_taken: true
    )
    sign_in user

    get root_path

    assert_response :success
    assert_select ".history-row", count: 1
    assert_select ".history-row", text: /7.5時間.*なし（スッキリ）.*ややだるい/
    assert_select ".history-row .status.taken", text: /服用あり/
  end

  test "index shows the selected calendar month in the chart" do
    user = User.create!(nickname: "テスト", email: "chart@example.com", password: "password123")
    sign_in user

    get root_path, params: { month: "1" }

    previous_month = Date.current.beginning_of_month - 1.month
    assert_response :success
    assert_select "h2", text: /先月の睡眠と気分の変化/
    assert_select "select[name='month'] option[selected]", text: "先月"
    assert_select ".chart-date-item", count: previous_month.end_of_month.day
    assert_select ".chart-area[style*='--chart-days:#{previous_month.end_of_month.day}']"
  end

  test "new form offers medicine types and saves the selected type" do
    user = User.create!(nickname: "テスト", email: "medicine-type@example.com", password: "password123")
    sign_in user

    get new_sleep_log_path

    assert_response :success
    assert_select "label[for='sleep_log_medicine_type']", text: "薬の種類"
    SleepLog::MEDICINE_TYPES.each do |medicine_type|
      assert_select "select[name='sleep_log[medicine_type]'] option", text: medicine_type
    end

    assert_difference("SleepLog.count", 1) do
      post sleep_logs_path, params: {
        sleep_log: {
          sleep_date: Date.current,
          medicine_taken: "true",
          medicine_type: "ベンゾジアゼピン系",
          actual_sleep_time: 420,
          condition: 3,
          sleepiness: 2
        }
      }
    end

    assert_equal "ベンゾジアゼピン系", user.sleep_logs.last.medicine_type
  end
end
