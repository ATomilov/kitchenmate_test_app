module Api
  module V1
    class ProductsController < ::ApplicationController
      before_action :authenticate_user!

      def index
        render json: ::ProductSerializer.new(
          ::Products::Find.new(
            **search_params.to_h.symbolize_keys
          ).call
        ).serializable_hash
      end

      def add_to_favorite
        result = ::Crud::Products::AddToFavorite.new(user: current_user, product_id: params[:id]).call
        render_json_response(result: result)
      end

      private

      def search_params
        params.permit(*%i[category name sku])
      end
    end
  end
end
