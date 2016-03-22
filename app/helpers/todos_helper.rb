###
#  Todo Helper module for Reusing code in View
###
module TodosHelper
  def todo_status(todo)
    if todo.status?
      '<i class="glyphicon glyphicon-ok-circle"></i>'.html_safe
    else
      '<i class="glyphicon glyphicon-remove"></i>'.html_safe
    end
  end
end
