class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  # include RailsAdminCharts
 #  def self.graph_data since=30.days.ago
 #   [
 #     {
 #         name: 'Completed Todo',
 #         pointInterval: point_interval = 1.day * 1000,
 #         pointStart: start_point = since.to_i * 1000,
 #         data: self.where(status: true).delta_records_since(since)
 #     },
 #     {
 #         name: 'Incomplete Todo',
 #         pointInterval: point_interval,
 #         pointStart: start_point,
 #         data: self.where(status: false).delta_records_since(since)
 #     }
 #   ]
 # end
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

 def charts
       
 end


  def impersonate
    
  end
  
end
