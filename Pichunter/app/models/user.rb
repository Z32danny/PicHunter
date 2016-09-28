class User < ApplicationRecord
  	acts_as_voter
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :user_name, presence: true, length: {minimum: 4, maximum: 16}
	devise :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: { medium: '152x152#'}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
