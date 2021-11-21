class AddSkuNameGinIndexToPtoduct < ActiveRecord::Migration[6.1]
  def up
    execute('CREATE INDEX index_products_name_gin_idx ON products USING gin(name gin_trgm_ops);')
    execute('CREATE INDEX index_products_sku_gin_idx ON products USING gin(sku gin_trgm_ops);')
  end

  def down
    execute('DROP INDEX index_products_name_gin_idx;')
    execute('DROP INDEX index_products_sku_gin_idx;')
  end
end
