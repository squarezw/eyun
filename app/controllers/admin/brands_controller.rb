class Admin::BrandsController < ApplicationController
  def index
    @brands = Brand.paginate(:per_page => 20, :page => params[:page])
  end
end
