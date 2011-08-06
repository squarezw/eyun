class AddRecommendToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :recommend, :boolean, :default=>false
  end

  def self.down
    remove_column :products, :recommend
  end
end
