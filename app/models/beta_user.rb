class BetaUser < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	ROLE_OPTIONS = ["Designer/Brand", "Consumer"]


	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, 
			  uniqueness: { case_sensitive: false }, 
			  format: { with: VALID_EMAIL_REGEX }
	validates :role, presence: true

	def full_name
		"#{first_name} #{last_name}"
	end

end
