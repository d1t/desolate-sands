class UserNotifier < ActionMailer::Base
	default from: "Cubey <info@cubey.co>"

	def signup(admin, beta_user)
		@admin = Admin.last
		@beta_user = BetaUser.last

		mail to: @admin.email, subject: 'New User'
	end

	def thanks(beta_user)
		@beta_user = beta_user

		mail to: beta_user.email, subject: 'Welcome to Cubey'
	end
end
