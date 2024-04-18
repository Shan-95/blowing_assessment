class Game < ApplicationRecord
	has_many :frames, dependent: :delete_all
	after_create :create_frames

	def create_frames
		for a in 1..10 do
			self.frames.create(frame_no: a)
		end
	end
end
