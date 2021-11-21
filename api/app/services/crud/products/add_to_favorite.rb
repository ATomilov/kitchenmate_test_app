# frozen_string_literal: true

module Crud
  module Products
    class AddToFavorite < ::Crud::BaseCrud
      option :user
      option :product_id

      def call
        add_to_favorite
      end

      private

      def add_to_favorite
        product = ::Product.find(product_id)
        user.favorite_products << product
        user.save

        Success(message: "This product was added to the user's favorite products")
      rescue ::ActiveRecord::RecordNotFound
        Failure(error: 'The product not found')
      rescue ::ActiveRecord::RecordNotUnique
        Failure(error: "The product is already been added to the user's favorites")
      end
    end
  end
end
