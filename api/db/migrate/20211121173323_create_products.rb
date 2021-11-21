class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :sku, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
