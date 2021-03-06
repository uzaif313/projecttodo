RailsAdmin.config do |config|

  ### Popular gems integration

   config.authenticate_with do
      warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  # config.navigation_static_links = {
  #   'Logout' => '/admin/sign_out' #or whatever you used to mount RailsAdmin in your routes file
  # }
  ## == Devise ==
  #  config.authenticate_with do
  #    warden.authenticate! scope: :admin
  #  end
  #  config.current_user_method(&:current_user)
  #  config.navigation_static_links = {
  #    'Google' => 'http://www.google.com'
  #  }

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0



  config.included_models = %w[Project Todo User]
  config.excluded_models  = %w[Admin]
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration


  # config.actions do
  #   all # NB: comment out this line for RailsAdmin < 0.6.0
  # end


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    charts
    # show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
