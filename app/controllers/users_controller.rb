class UsersController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  before_action :authenticate_admin!
  
  def dashboard
  end

  def impersonate_user
  end
  # def new
  # end
  # def edit
  #   #code
  # end
  # def destroy
  # end
end
