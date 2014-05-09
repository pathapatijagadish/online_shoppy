class ApplicationController < ActionController::Base
  protect_from_forgery
  	def check_login
		if session[:user]
			return true
		else
		#render :text=>params and return false
			flash[:error]="credentials mandotory"
			redirect_to  admin_user_login_url and return
		end
	end
	# def check_login
	# 	#render :text=>params and return false
	# end
end
