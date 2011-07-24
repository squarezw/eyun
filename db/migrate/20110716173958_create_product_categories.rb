class CreateProductCategories < ActiveRecord::Migration
  def self.up
    create_table :product_categories do |t|
      t.column :name, :string, :null=>false
      t.column :parent_id, :integer, :default => 0,  :null => false
      t.column :lft,       :integer
      t.column :rgt,       :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :product_categories
  end
end
