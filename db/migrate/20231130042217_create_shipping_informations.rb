class CreateShippingInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_informations do |t|
      t.string :post, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building, null: true
      t.string :phone, null: false
      t.references :purchase_history, foreign_key: true, null: false
      t.timestamps
    end
  end
end
