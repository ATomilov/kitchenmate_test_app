class ApplicationController < ActionController::API
  private

  def render_json_response(result:, status: 400)
    if result.success?
      render json: result.value!
    else
      render json: result.failure, status: status
    end
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: { message: "#{e.param.to_s.humanize} is missing" }, status: :unprocessable_entity
  end
end
