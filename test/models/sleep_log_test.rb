require "test_helper"

class SleepLogTest < ActiveSupport::TestCase
  test "medicine type must be one of the supported options when present" do
    sleep_log = SleepLog.new(user: User.new, condition: 3, sleepiness: 3, medicine_type: "未登録の薬")

    assert_not sleep_log.valid?
    assert sleep_log.errors.of_kind?(:medicine_type, :inclusion)
  end

  test "medicine type can be left blank" do
    sleep_log = SleepLog.new(user: User.new, condition: 3, sleepiness: 3, medicine_type: "")

    assert sleep_log.valid?
  end
end
