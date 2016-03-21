###
# User Managment Controller
###
class UsersController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def dashboard
  end
end
