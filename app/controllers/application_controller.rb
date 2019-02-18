class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # layout :layout_by_resource
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signin) do |user_params|
      user_params.permit(:username, :email)
    end
  end

  def layout_by_resource
    if devise_controller? and user_signed_in?
      'dashboard'
    else
      'application'
    end
  end
end
