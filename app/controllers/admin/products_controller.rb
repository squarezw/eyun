class Admin::ProductsController < ApplicationController
  def index
    unless params[:tag].blank?
      conditions = ["tags like ?", "%#{params[:tag]}%"]
    end
    unless params[:recommended].blank?
      cond = ["recommend = true"]
    end
    
    @products = Product.where(cond).paginate(:per_page => 50, :page => params[:page], :conditions => conditions)
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
      
    else
      @error = "推荐失败!"
    end
    
    if request.xhr?
      render :update do |page|
        unless @error
          page.replace_html "recommend_#{@product.id}", '<font class=red>推荐成功!</font>'
        else
          page.replace_html "recommend_#{@product.id}", @error
        end
      end
    else
      unless @error
        redirect_to(admin_products_path(:tag => tag, :page => params[:page]))
      else
        redirect_to(admin_products_path,:notice => @error)
      end
    end
    
  end
  
  def cancel_recommend
    tag = params[:tag]

    @product = Product.find(params[:id])
    if @product.cancel_recommend
      
    else
      @error = "取消推荐失败!"
    end
    
    if request.xhr?
      render :update do |page|
        unless @error
          page.replace_html "recommend_#{@product.id}", '取消推荐成功!'
        else
          page.replace_html "recommend_#{@product.id}", @error
        end
      end
    else
      unless @error
        redirect_to(admin_products_path(:tag => tag, :page => params[:page]))
      else
        redirect_to(admin_products_path,:notice => '取消推荐失败!')
      end
    end    
    
  end
end
