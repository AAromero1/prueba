# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                      keys: [:name, :email, :password, :password_confirmation, :profile_picture])
      devise_parameter_sanitizer.permit(:account_update, 
                                        keys: [:name, :email, :password, :password_confirmation, :current_password, 
                                               :profile_picture])
  end
end
  