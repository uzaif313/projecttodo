##
# Overrided Registration controller of Devise
# Custmise Devise Gem Default Proccess
##
class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :role, :email, :password)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :role, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    return rails_admin_url if resource.role == :admin
    return dashboard_url if resource.role == :user
  end

  def after_sign_up_path_for(resource)
    return rails_admin_url if resource.role == :admin
    return root_url if resource.role == :user
  end

  def after_update_path_for(resource)
    return dashboard_url if resource.role == :user
  end
end
