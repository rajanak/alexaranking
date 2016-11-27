ActiveAdmin.register User do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    action_item only: :index do
      link_to "Disable SignUp", "#"
    end

    filter :email

    index do
        selectable_column
        id_column
        column :name
        column :email
        column :created_at
        column :sign_in_count
        column "" do |user|
           link_to "login", become_user_path(user)
        end
        
        actions 
    end
    permit_params :name, :email, :password, :password_confirmation

    form do |f|
        f.inputs 'User' do
            
            f.input :name
            f.input :email
            f.input :password
            f.input :password_confirmation
        end
        f.actions
    end
end
