class Admin::ProductsController < ApplicationController
  def index
    @products = Product.paginate(:per_page => 20, :page => params[:page])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to(admin_products_path, :notice => 'Product was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
