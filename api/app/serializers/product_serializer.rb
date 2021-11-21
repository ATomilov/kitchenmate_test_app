class ProductSerializer
  include JSONAPI::Serializer
  attributes(*%i[name sku category created_at])
end
