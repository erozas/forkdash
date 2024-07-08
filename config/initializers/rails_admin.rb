RailsAdmin.config do |config|
  config.asset_source = :importmap

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model "Address" do
    list do
      field :country
      field :city
      field :line_1
      field :line_2
      field :addressable
      field :lat
      field :lng
      field :created_at
    end
  end

  config.model "User" do
    list do
      field :avatar, :active_storage
      field :username
      field :email
      field :phone_number
      field :phone_number_verified
      field :admin
      field :created_at
    end

    create do
      field :avatar
      field :email
      field :username
      field :password
      field :phone_number
      field :admin
      field :addresses
    end

    object_label_method do
      :username
    end
  end
end
