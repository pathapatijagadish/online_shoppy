class Admin::CustomersController < ApplicationController
	#before_filter :check_login
	def index
		@customers=Customer.find(:all)
	end
	def new
		@customer=Customer.new
	end
	def create
		render :text=>params and return false
		@customer=Customer.new(params[:customer])
		if @customer.save
			flash[:notice]="customerscreated succefully"
			redirect_to admin_customers_url
		else
			flash[:error]="customers not created"
			render :new
		end
	end
	def update
		@customers=Customer.find(params[:id])
		if @customers.update_attributes(params[:customers])
			flash[:notice]="customers Updated succefully"
			redirect_to admin_customers_url
		else
			flash[:error]="customers not updated succefully"
			render :edit
		end
	end
	def show
		@customers =Customer.find(params[:id])
	end
	def destroy
		@customers =Customer.find(params[:id])
		if @customers.destroy
			flash[:notice]="customers deleted succefully"
		else
			flash[:error]="customers not deleted"
		end
		redirect_to admin_customers_url
	end
end
