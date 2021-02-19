class CreateCommodities < ActiveRecord::Migration[6.0]
  def change
    create_table :commodities do |t|
      t.string     :name,        null: false
      t.integer    :price
      t.integer    :quantity
      t.string     :storage_location
      t.string     :purchase_shop
      t.date       :purchase_day
      t.text       :explanation
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
