module Crud
  module Users
    class Create < ::Crud::BaseCrud
      option :params, proc(&:to_h)
      option :validation_contract, default: -> { ::ApiContracts::Users::CreateContract.new }

      def call
        create_user
      end

      private

      def create_user
        validation_result = validation_contract.call(params)
        if validation_result.success?
          Success(::User.create(user_attrs))
        else
          Failure(errors: validation_result.errors(full: true).to_h.values.flatten)
        end
      end

      def user_attrs
        {
          email: params[:email],
          password: params[:password],
          password_confirmation: params[:password]
        }
      end
    end
  end
end
