class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos
  include RailsAdminCharts

  def self.graph_data since=2.days.ago
   [
     {
         name: 'Admin Users',
         pointInterval: point_interval = 1.day * 1000,
         pointStart: start_point = since.to_i * 1000,
         data: self.where(role: 'admin').delta_records_since(since)
     },
     {
         name: 'Standard Users',
         pointInterval: point_interval,
         pointStart: start_point,
         data: self.where(role: 'user').delta_records_since(since)
     }
   ]
 end
  rails_admin do
    create do
      field :username do
        help "Please Enter Username"
      end
      field :email do
        help "Please Enter Email Address"
      end
      field :role,:enum do
        help "Please Select Userrole"
        enum  [:user,:admin]
      end
      field :password do
        help "Please Enter Password"
      end
      field :password_confirmation do
        help "Please Re-enter Password"
      end
    end

    edit do
      field :username do
        help "Please Enter Username"
      end
      field :email do
        help "Please Enter Email Address"
      end
      field :role,:enum do
        help "Please Select Userrole"
        enum  [:user,:admin]
      end
      field :password do
        help "Please Enter Password"
      end
      field :password_confirmation do
        help "Please Re-enter Password"
      end

    end
  end
end
