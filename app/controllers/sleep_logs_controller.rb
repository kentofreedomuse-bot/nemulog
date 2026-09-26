class SleepLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sleep_log, only: [:edit, :update]

  def index
    @chart_dates = (6.days.ago.to_date..Date.current).to_a
    @chart_logs = current_user.sleep_logs
                              .where(sleep_date: @chart_dates)
                              .order(:created_at)
                              .index_by(&:sleep_date)
    @sleep_logs = current_user.sleep_logs.order(sleep_date: :desc)
  end

  def new
    @sleep_log = current_user.sleep_logs.build(sleep_date: requested_sleep_date, actual_sleep_time: 0, condition: 3, sleepiness: 3)
  end

  def create
    @sleep_log = current_user.sleep_logs.build(sleep_log_params)
    @sleep_log.sleep_date ||= Date.current
    @sleep_log.sleep_time ||= Time.current
    @sleep_log.wake_time ||= Time.current
    @sleep_log.actual_sleep_time ||= 0
    @sleep_log.sleep_quality ||= @sleep_log.condition

    if @sleep_log.save
      redirect_to root_path, notice: "今日の体調を記録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render :new
  end

  def update
    @sleep_log.assign_attributes(sleep_log_params)
    @sleep_log.sleep_quality = @sleep_log.condition

    if @sleep_log.save
      redirect_to root_path, notice: "記録を更新しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_sleep_log
    @sleep_log = current_user.sleep_logs.find(params[:id])
  end

  def sleep_log_params
    params.require(:sleep_log).permit(:medicine_taken, :actual_sleep_time, :condition, :sleepiness, :sleep_date)
  end

  def requested_sleep_date
    Date.iso8601(params[:date].to_s)
  rescue Date::Error, ArgumentError
    Date.current
  end
end
