class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cnic, :join_date, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cnic, :join_date, :role])
  end
end
