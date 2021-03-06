class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #called the configured params
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protect the database
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar) }
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :avatar, :current_password) }
  end

end
