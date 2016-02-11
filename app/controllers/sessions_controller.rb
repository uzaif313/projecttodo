class SessionsController < Devise::SessionsController
  #Customise the Devise Session Create Method For Verify the Admin and User role
  def create
    type=params.keys[2]
      @user = User.find_by_email(params[type][:email])
      if @user != nil
        if !@user || @user.role!=type
          flash[:danger] = " Access denied."
            redirect_to root_url
        else
          super
        end
      else
          flash[:warning] = "Incorrect email or password"
          redirect_to root_url
      end
  end
  def after_sign_in_path_for(resource)
    if resource.role == "admin"
      return  rails_admin_url
    elsif resource.role == "user"
      # return user_url
      return dashboard_url
    end
  end

  def after_sign_out_path_for(resource)
      if resource == :user
        return new_user_session_url
      elsif resource == :admin
        return new_admin_session_url
      end
  end

  def destroy
    super
  end
end
