module ApiContracts
  module Users
    class CreateContract < ::Dry::Validation::Contract
      params do
        required(:email).filled(:string)
        required(:password).filled(:string)
      end

      rule(:email) do
        key.failure('is already taken') if ::User.where(email: value).exists?
      end
    end
  end
end
