class Product < ApplicationRecord
  scope :by_category, ->(category) { where(category: category) }
  scope :by_name, ->(name) { where('name ILIKE :keyword', keyword: "%#{name}%") }
  scope :by_sku, ->(sku) { where('sku ILIKE :keyword', keyword: "%#{sku}%") }
end
