class CreateApp730Prices < ActiveRecord::Migration[5.1]
  def change
    create_table :app730_prices do |t|
      t.integer :item_id
      t.integer :currency_id
      t.decimal :amount, precision: 20, scale: 6
      t.integer :volume

      t.timestamps
    end
  end
end
