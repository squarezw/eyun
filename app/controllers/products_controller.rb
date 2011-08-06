class ProductsController < ApplicationController
  def index
    @products = Product.paginate(:per_page => 20, :page => params[:page])
  end
end
