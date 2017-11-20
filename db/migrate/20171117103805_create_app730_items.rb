class CreateApp730Items < ActiveRecord::Migration[5.1]
  def change
    create_table :app730_items do |t|
      t.string :market_hash_name
      t.string :icon_url
      t.string :icon_url_large
      t.string :name_color
      t.string :internal_type
      t.string :internal_quality
      t.string :quality_color
      t.string :internal_rarity
      t.string :rarity_color
      t.string :internal_exterior
      t.string :internal_item_set
      t.string :internal_weapon
      t.string :internal_tournament
      t.string :internal_sticker_capsule
      t.string :internal_sticker_category
      t.string :internal_spray_capsule
      t.string :internal_tournament_team
      t.string :internal_pro_player
      t.string :internal_spray_color_category

      t.timestamps
    end
  end
end
