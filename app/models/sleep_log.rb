class SleepLog < ApplicationRecord
	belongs_to :user

	validates :condition, inclusion: { in: 1..5 }
	validates :sleepiness, inclusion: { in: 1..5 }
end
