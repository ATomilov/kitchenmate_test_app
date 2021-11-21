module Api
  module V1
    class UsersController < ::ApplicationController
      before_action :authenticate_user!

      def show_favorite_products
        render json: ::ProductSerializer.new(current_user.favorite_products).serializable_hash
      end
    end
  end
end
