class SleepLog < ApplicationRecord
	belongs_to :user

	MEDICINE_TYPES = ["市販", "ベンゾジアゼピン系", "非ベンゾジアゼピン系", "オレキシン受容体拮抗薬", "メラトニン受容体刺激薬"].freeze

	validates :condition, inclusion: { in: 1..5 }
	validates :sleepiness, inclusion: { in: 1..5 }
	validates :medicine_type, inclusion: { in: MEDICINE_TYPES }, allow_blank: true
end
