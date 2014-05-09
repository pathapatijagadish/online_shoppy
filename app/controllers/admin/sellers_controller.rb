class Admin::SellersController < ApplicationController
	before_filter :check_login
	def index
		@sellers=Seller.find(:all)
	end
	def new
		@seller=Seller.new
	end
	def create
		@seller=Seller.new(params[:seller])
		# render :text=>@Seller.inspect and return false
		if @seller.save
			flash[:notice]="seller created succefully"
			redirect_to admin_sellers_url
		else
			flash[:error]="seller not created"
			render :new
		end
	end
	def edit
		@seller=Seller.find(params[:id])
	end
	def update
		@seller=Seller.find(params[:id])
		if @seller.update_attributes(params[:Seller])
			flash[:notice]="seller Updated succefully"
			redirect_to admin_sellers_url
		else
			flash[:error]="seller not updated succefully"
			render :edit
		end
	end
	def show
		@seller =Seller.find(params[:id])
	end
	def destroy
		# render :text=>@seller.inspect and return false
		@seller =Seller.find(params[:id])
		if @seller.destroy
			flash[:notice]="seller deleted succefully"
		else
			flash[:error]="seller not deleted"
		end
		redirect_to admin_sellers_url
	end
end
