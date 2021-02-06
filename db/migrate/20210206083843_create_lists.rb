class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string     :item_name,   null: false
      t.integer    :price
      t.text       :explanation
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
