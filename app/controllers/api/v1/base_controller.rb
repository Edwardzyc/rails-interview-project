class Api::V1::BaseController < ActionController::Base

  before_action :authenticate_request, :update_api_request_count

  private 

  def authenticate_request
    if current_tenant.nil?
      render json: {message: "API key not valid"}, status: :unauthorized
    end
  end

  def current_tenant
    @tenant = Tenant.find_by(api_key: params[:api_key])
  end

  def update_api_request_count
    Tenant.increment_counter :api_request_count, current_tenant.id
  end

end
