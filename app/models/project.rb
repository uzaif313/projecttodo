class Project < ActiveRecord::Base
  has_many :todos
  validates :project_name,:project_desc,:project_type,presence:true
  include RailsAdminCharts


  rails_admin do
    create do
      field :project_name do
        help "Please Enter Project name"
      end
      field :project_desc do
        help "Please Enter Project Description"
      end
      field :project_type do
        help "Please Enter Project Type"
      end
    end

    edit do
      field :project_name do
        help "Please Enter Project name"
      end
      field :project_desc do
        help "Please Enter Project Description"
      end
      field :project_type do
        help "Please Enter Project Type"
      end
    end

  end
end
