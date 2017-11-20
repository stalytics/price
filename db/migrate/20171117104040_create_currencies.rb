class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code
      t.string :prefix
      t.string :suffix
      t.decimal :value, precision: 20, scale: 6

      t.timestamps
    end
  end
end
