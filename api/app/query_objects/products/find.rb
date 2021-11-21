module Products
  class Find < ::BaseQueryObject
    option :category, optional: true
    option :name, optional: true
    option :sku, optional: true
    option :limit, default: -> { 1_000 }

    def call
      filtered_collection
    end

    private

    def filtered_collection
      scope = ::Product.all
      scope = filter_by_category(scope)
      scope = filter_by_name(scope)
      scope = filter_by_sku(scope)
      scope.limit(limit)
    end

    def filter_by_category(scope)
      return scope if category.blank?

      scope.by_category(category)
    end

    def filter_by_name(scope)
      return scope if name.blank?

      scope.by_name(name)
    end

    def filter_by_sku(scope)
      return scope if sku.blank?

      scope.by_sku(sku)
    end
  end
end
