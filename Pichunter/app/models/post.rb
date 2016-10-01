class Post < ApplicationRecord
	acts_as_votable


	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	validates :user_id, presence: true
	validates :caption, length: {minimum: 3, maximum: 300}
	validates :image, presence: true

	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
