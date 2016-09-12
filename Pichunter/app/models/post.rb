class Post < ApplicationRecord
	validates :image, presence: true

	has_attached_file :image
end
