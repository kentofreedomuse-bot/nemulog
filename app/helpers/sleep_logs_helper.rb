module SleepLogsHelper
	def japanese_weekday(date)
		%w[日 月 火 水 木 金 土][date.wday]
	end

	def average_sleep_hours(logs)
		return nil if logs.empty?

		(logs.sum(&:actual_sleep_time).to_f / logs.size / 60).round(1)
	end

	def average_condition_label(logs)
		return "記録なし" if logs.empty?

		condition_labels[(logs.sum(&:condition).to_f / logs.size).round]
	end

	def average_sleepiness_label(logs)
		return "記録なし" if logs.empty?

		sleepiness_labels[(logs.sum(&:sleepiness).to_f / logs.size).round]
	end

	def sleepiness_label(value)
		sleepiness_labels[value.to_i]
	end

	def weekly_record_message(logs)
		case logs.size
		when 0
			["今週の記録を始めてみましょう！", "気づいたときに少しずつ記録すると、自分のパターンが見えてきます。"]
		when 7
			["今週は毎日記録できています！", "自分のパターンがしっかり見えてきましたね。"]
		else
			["今週は#{logs.size}日分の記録ができています！", "自分のペースで記録を続けていきましょう。"]
		end
	end

	private

	def condition_labels
		[nil, "かなり重い", "ややだるい", "普通", "すっきり", "とても快適"]
	end

	def sleepiness_labels
		[nil, "なし（スッキリ）", "軽度（少し感じる）", "中程度（少しぼんやり）", "やや強い（仕事に支障あり）", "強烈（耐えられない）"]
	end
end
