###
# This Controller is Build for manage Project Todo
##
class TodosController < ApplicationController
  layout 'user'
  before_action :authenticate_user!
  def index
    @todos = Todo.joins(:project).joins(:user)
  end

  def task
    condition = { user_id: current_user.id }
    @todos = Todo.all.joins(:project).joins(:user).where(condition)
  end

  def done
    # params.inspect
    @todo = Todo.find(params[:id].to_i)
    @todo.update_attributes(status: params[:status])
    if @todo.save
      respond_to do |format|
        format.js
        format.html { render nothing: true, success: 'Update SUCCESSFUL!' }
      end
    end
  end

  def task_wait
    condition = { user_id: current_user.id, status: [false, nil] }
    @todos = Todo.joins(:project).joins(:user).where(condition)
  end
end
