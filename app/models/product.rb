class Product < ActiveRecord::Base
  belongs_to :product_category
  
  def set_recommend
    self.recommend = true
    self.save
  end
  
  def cancel_recommend
    self.recommend = false
    self.save
  end
end
