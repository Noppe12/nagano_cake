class CreateItems < ActiveRecord::Migration[5.2]

  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_active, null: false
      t.integer :genre_id

      t.timestamps
    end
  end
  private

  def with_tax_price
    price * 1.1
  end
end
