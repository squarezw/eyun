class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :null=>false
      t.integer :product_category_id, :null => false
      t.decimal :price, :precision => 8, :scale => 2
      t.string :stand
      t.date :released_date
      t.string :series
      t.string :effect
      t.string :intro, :limit => 5000
      t.string :tags
      t.string :picture
      t.string :from_url
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
