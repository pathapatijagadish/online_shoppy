class Admin::ProductsController < ApplicationController
  def index
  	@products=Product.all
  end
  def new
  	@product=Product.new
  end
  def create
    #render :text=>params and return false
  	if params[:category_id].present? && params[:brand_id].present?
      category_brand = CategoryBrand.where("category_id = ? AND brand_id = ?",params[:category_id],params[:brand_id]).limit(1)
      unless category_brand.present?
        category_brand = CategoryBrand.new
        category_brand.category_id = params[:category_id]
        category_brand.brand_id = params[:brand_id]
        category_brand.save
      end
      @product = Product.new(params[:product])
      #render :text=>category_brand.id.inspect and return false
      @product.category_brand_id = CategoryBrand.last.id
      if @product.save
        flash[:notice]="product crated succefully"
        redirect_to admin_products_path
      else
        flash[:error]="product not created succefully"
        render "new"
      end
    end
  end

  def edit
  	@product=Product.find(params[:id])
    #render :text=>@product.inspect and return false
  end
  def update
  	@Product=Product.find(:params[:id])
  	if @product.update_attributes(params[:product])
  		flash[:product]="product updated succefully"
  		redirect_to admin_products_path
  	else
  		flash[:error]="product not updated"
  		render "edit"
  	end
  end
end
