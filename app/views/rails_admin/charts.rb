module RailsAdmin
	module Config
		module Actions
			class Charts < RailsAdmin::Config::Actions::Base
				register_instance_option :visible? do
          authorized? && bindings[:object].class == User
        end
        
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        
        register_instance_option :link_icon do
          'icon-eye-open'
        end
        
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end	

        register_instance_option :controller do
  				Proc.new do
				   	 raise @object.inspect
				     # @object.charts
				  end
				end
			end		
		end
	end
end