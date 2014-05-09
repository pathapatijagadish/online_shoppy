class Admin::UsersController < ApplicationController
	#before_filter :check_login,:except=>[:login,:authenticate_user]
	
	# def check_login
	# 	render :text=>params and return false
	# end
	def login
   
 	end
	def authenticate_user
		#render :text=>params and return false
		redirect_to admin_users_url and return false if session[:user]
		if params[:email] and params[:password]
			@user=User.first(:select=>"id,name,email",:conditions=>["email=? AND password=?",params[:email],params[:password]])
			if @user
				flash[:notice] ="login successfully"
				session[:user] = @user
				redirect_to admin_users_url
			else
				flash[:error] = "login failed"
				render :login
			end
		else
			flash[:error] ="Invalid credentials"
			render :login
		end
	end
	def logout
		session[:user]=nil
		redirect_to root_url
		
	end
	def index
		params[:sort] ||= "ASC"
		params[:field] ||= "name"		
		@users=User.all(:order=>"#{params[:field]} #{params[:sort]}")
	end
	def new
		#render :text=>params and return false
		@user=User.new
		#render :text=>@user.inspect and return false
	end
	def create
		#render :text=>params and return false
		@user=User.new(params[:user])
		if @user.save
			flash[:notice]="Admin user created succefully"
			redirect_to admin_users_url
		else
			flash[:error]="Admin user not created"
			render :new
		end
	end
	def edit
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:notice]="Admin user Updated succefully"
			redirect_to admin_users_url
		else
			flash[:error]="Admin user not updated succefully"
			render :edit
		end
	end
	def show
		@user =User.find(params[:id])
	end
	def destroy
		@user =User.find(params[:id])
		if @user.destroy
			flash[:notice]="Admin user deleted succefully"
		else
			flash[:error]="Admin user not deleted"
		end
		redirect_to admin_users_url
	end
end
