class CreateProductsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :products_users do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
    end

    add_index :products_users, %i[user_id product_id], unique: true
  end
end
