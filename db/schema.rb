# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110806051308) do

  create_table "brands", :force => true do |t|
    t.string   "name_cn",                    :null => false
    t.string   "name_en"
    t.string   "founder"
    t.string   "origin"
    t.string   "create_at"
    t.string   "website"
    t.string   "intro",      :limit => 5000
    t.string   "picture"
    t.string   "logo"
    t.string   "from_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name",                      :null => false
    t.integer  "parent_id",  :default => 0, :null => false
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                                                 :null => false
    t.integer  "product_category_id",                                                                  :null => false
    t.decimal  "price",                               :precision => 8, :scale => 2
    t.string   "stand"
    t.date     "released_date"
    t.string   "series"
    t.string   "effect"
    t.string   "intro",               :limit => 5000
    t.string   "tags"
    t.string   "picture"
    t.string   "from_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "recommend",                                                         :default => false
  end

end
