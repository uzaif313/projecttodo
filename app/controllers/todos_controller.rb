class TodosController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  def index
    @todos=Todo.joins(:project).joins(:user)
  end

  def task
    @todos=Todo.all.joins(:project).joins(:user).where(:user_id=>current_user.id )
  end

  def done

    # params.inspect
    @todo=Todo.find(params[:id].to_i)
    @todo.update_attributes(:status=>params[:status])
   if @todo.save
     puts "Todos Updated"
     respond_to do |format|
       format.js
       format.html { render :nothing => true, :success => 'Update SUCCESSFUL!' }
     end
   end
  end


  def task_wait
    # render "task-wait"
  @todos=Todo.joins(:project).joins(:user).where(:user_id => current_user.id,:status=>[false,nil])
    # render json:@todos
  end
end
