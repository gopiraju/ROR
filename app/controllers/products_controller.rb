class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		Alerts.new_product(@product).deliver
  		redirect_to products_path
  	else
  		render :edit
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id]).update(product_params)
  	redirect_to products_path
  end

  def destroy
  	Product.find(params[:id]).destroy
  	redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
