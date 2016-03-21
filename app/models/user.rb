# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos
  rails_admin do
    create do
      field :username do
        help 'Please Enter Username'
      end
      field :email do
        help 'Please Enter Email Address'
      end
      field :role, :enum do
        help 'Please Select Userrole'
        enum [:user, :admin]
      end
      field :password do
        help 'Please Enter Password'
      end
      field :password_confirmation do
        help 'Please Re-enter Password'
      end
    end

    edit do
      field :username do
        help 'Please Enter Username'
      end
      field :email do
        help 'Please Enter Email Address'
      end
      field :role, :enum do
        help 'Please Select Userrole'
        enum [:user, :admin]
      end
      field :password do
        help 'Please Enter Password'
      end
      field :password_confirmation do
        help 'Please Re-enter Password'
      end
    end
  end
end
