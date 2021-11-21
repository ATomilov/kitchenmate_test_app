class RegistrationsController < Devise::RegistrationsController
  def create
    creation_result = ::Crud::Users::Create.new(params: sign_up_params).call
    render_json_response(result: creation_result)
  end

  private

  def sign_up_params
    params.require(:user).permit(*%i[email password])
  end
end
