class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

rails_admin do

   list do
    field :id
     field :task
     field :status
     field :project,:text do
       formatted_value do
        bindings[:view].tag(:a,href: "/admin/project/#{bindings[:object].project.id}") << bindings[:object].project.project_name
      end
    end
     field :user do
       pretty_value do
        bindings[:view].tag(:a,href: "/admin/user/#{bindings[:object].user.id}") << bindings[:object].user.username
      end
    end
     field :created_at
   end
   create do
    #  raise list.inspect
     field :user_id, :enum do
       help 'Please User Title'
       enum do
           User.where(role:"user").pluck(:username,:id)
       end
     end

      field :task do
        help "Please enter the Task"
      end
      field :project_id, :enum do
        help 'Please Project Title'
        enum do
            Project.all.pluck(:project_name,:id)
        end
      end
    end


    edit do
     #  raise list.inspect
      field :user_id, :enum do
        help 'Please Project Title'
        enum do
            User.where(role:"user").pluck(:username,:id)
        end
      end

       field :task do
         help "Please enter the Task"
       end
       field :project_id, :enum do
         help 'Please Project Title'
         enum do
             Project.all.pluck(:project_name,:id)
         end
       end
     end


end
end
