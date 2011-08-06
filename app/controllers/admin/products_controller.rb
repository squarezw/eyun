class Admin::ProductsController < ApplicationController
  def index
    unless params[:tag].blank?
      conditions = ["tags like ?", "%#{params[:tag]}%"]
    end
    
    @products = Product.paginate(:per_page => 20, :page => params[:page], :conditions => conditions)
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
  
  def set_recommend
    tag = params[:tag]

    @product = Product.find(params[:id])
    if @product.set_recommend
      redirect_to(admin_products_path(:tag => tag, :page => params[:page]))
    else
      redirect_to(admin_products_path,:notice => '推荐失败!')
    end
    
  end
  
  def cancel_recommend
    tag = params[:tag]

    @product = Product.find(params[:id])
    if @product.cancel_recommend
      redirect_to(admin_products_path(:tag => tag, :page => params[:page]))
    else
      redirect_to(admin_products_path,:notice => '取消推荐失败!')
    end
    
  end
end
