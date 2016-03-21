###
# Customise the Devise Session Create Method For Verify the Admin and User role
###
class SessionsController < Devise::SessionsController
  def create
    type = params.keys[2]
    @user = User.find_by_email(params[type][:email])
    if !@user.nil?
      return super if check_role(@user, type) == false
    else
      flash[:warning] = 'Incorrect email or password'
      redirect_to root_url
    end
  end

  def after_sign_in_path_for(resource)
    return rails_admin_url if resource.role == 'admin'
    return dashboard_url if resource.role == 'user'
  end

  def after_sign_out_path_for(resource)
    return new_user_session_url if resource == :user
    return new_admin_session_url if resource == :admin
  end

  def destroy
    super
  end

  def check_role(user, type)
    if !user || user.role != type
      flash[:danger] = ' Access denied.'
      redirect_to root_url
    else
      false
    end
  end
end
