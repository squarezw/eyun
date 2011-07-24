class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :name_cn, :null=>false
      t.string :name_en
      t.string :founder
      t.string :origin
      t.string :create_at
      t.string :website
      t.string :intro, :limit => 5000
      t.string :picture
      t.string :logo
      t.string :from_url
      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
