
####
# Root Application Controller Which is Inherit by All the App Controllers
####
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  
  protected

  def layout_by_resource
    return 'user' if devise_controller? && resource_name == :user
  end
end
