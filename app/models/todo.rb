###
# Project Todo Modal for Manage Todo
###
class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  rails_admin do
    list do
      field :id
      field :task
      field :status
      field :project, :text do
        formatted_value do
          link = "/admin/project/#{bindings[:object].project.id}"
          project_name = bindings[:object].project.project_name
          bindings[:view].tag(:a, href: link) << project_name
        end
      end
      field :user do
        pretty_value do
          link = "/admin/user/#{bindings[:object].user.id}"
          bindings[:view].tag(:a, href: link) << bindings[:object].user.username
        end
      end
      field :created_at
    end

    create do
      field :user_id, :enum do
        help 'Please User Title'
        enum do
          User.where(role: 'user').pluck(:username, :id)
        end
      end
      field :task do
        help 'Please enter the Task'
      end
      field :project_id, :enum do
        help 'Please Project Title'
        enum do
          Project.all.pluck(:project_name, :id)
        end
      end
    end
    edit do
      field :user_id, :enum do
        help 'Please Project Title'
        enum do
          User.where(role: 'user').pluck(:username, :id)
        end
      end
      field :task do
        help 'Please enter the Task'
      end
      field :project_id, :enum do
        help 'Please Project Title'
        enum do
          Project.all.pluck(:project_name, :id)
        end
      end
    end
  end

  def charts
  end

  def impersonate
  end
end
