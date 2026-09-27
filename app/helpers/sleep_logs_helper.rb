module SleepLogsHelper
	def japanese_weekday(date)
		%w[日 月 火 水 木 金 土][date.wday]
	end
end
