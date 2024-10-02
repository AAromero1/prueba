# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_account_update_params, only: [:update_profile_picture]
  
    # PUT /resource/update_profile_picture
  def update_profile_picture
    @user = current_user
    if @user.update(account_update_params)
      bypass_sign_in(@user)
      redirect_to edit_user_registration_path, notice: 'Foto de perfil actualizada.'
    else
      render :edit
    end
  end
  
    protected
  def configure_account_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  end
  
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_picture])
  end
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  
