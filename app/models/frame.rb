class Frame < ApplicationRecord
	belongs_to :game
	has_many :chances, dependent: :delete_all
	after_create :create_chances

	def create_chances
		if self.frame_no.to_i == 10
			for a in 1..3 do
				self.chances.create(chance_no: a)
			end
		else
			for a in 1..2 do
				self.chances.create(chance_no: a)
			end
		end
	end
end
