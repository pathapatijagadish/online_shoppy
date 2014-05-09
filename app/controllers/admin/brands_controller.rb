class Admin::BrandsController < ApplicationController
  def index
  	@brands=Brand.all
  	#render :text=>@brands.inspect and return false
  end
  def new
  	@brand=Brand.new
  end
  def create
    @brand=Brand.new(params[:brand])
    if @brand.save
      flash[:notice]="brand creted succefully"
      redirect_to admin_brands_url
    else
      flash[:eroor]="brand not created"
      reder "new"
    end
  end

  def edit
    @brand=Brand.find(params[:id])
  end

  def update
    @brand=Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice]="brand update succefully"
      redirect_to admin_brands_url
    else
      flash[:eroor]="brand not updated"
      render "edit"
    end
  end

  def destroy
    @brand=Brand.find(params[:id])
    if @brand.destroy
      flash[:notice]="brand deleted succefully"
    else
      flash[:error]="brand not deleted"
    end
    redirect_to admin_brands_url
  end
end
