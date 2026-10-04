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
end
