class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]


   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username,:role, :email, :password) }
   end

   # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username,:role, :email, :password,:current_password) }
   end

   # The path used after sign up.
   def after_sign_in_path_for(resource)
     if resource.role == "admin"
       return  rails_admin_url
     elsif resource.role == "user"
       return dashboard_url
     end
   end

   def after_sign_up_path_for(resource)
     if resource.role == "admin"
       return  rails_admin_url
     elsif resource.role == "user"
       return root_url
     end
   end

   def after_update_path_for(resource)
      if resource.role == "user"
        return dashboard_url;
      end
   end
end
