module Crud
  module Users
    class BaseCrud
      extend Dry::Initializer

      def call
        raise NotImplementedError
      end

      private

      include Dry::Monads[:result]
    end
  end
end
