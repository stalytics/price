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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171117104040) do

  create_table "app730_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "market_hash_name"
    t.string "icon_url"
    t.string "icon_url_large"
    t.string "name_color"
    t.string "internal_type"
    t.string "internal_quality"
    t.string "quality_color"
    t.string "internal_rarity"
    t.string "rarity_color"
    t.string "internal_exterior"
    t.string "internal_item_set"
    t.string "internal_weapon"
    t.string "internal_tournament"
    t.string "internal_sticker_capsule"
    t.string "internal_sticker_category"
    t.string "internal_spray_capsule"
    t.string "internal_tournament_team"
    t.string "internal_pro_player"
    t.string "internal_spray_color_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app730_prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "item_id"
    t.integer "currency_id"
    t.decimal "amount", precision: 20, scale: 6
    t.integer "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.string "prefix"
    t.string "suffix"
    t.decimal "value", precision: 20, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
