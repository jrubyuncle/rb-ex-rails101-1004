class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :config_permitted_params, if: :devise_controller?

  protected
  def config_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
    	u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
    	u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
