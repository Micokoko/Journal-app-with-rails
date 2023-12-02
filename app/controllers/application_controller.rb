class ApplicationController < ActionController::Base


    protected

  def after_sign_in_path_for(resource)
    # Customize the path based on your requirements
    if resource.is_a?(User)
      # Redirect to the categories page after a successful login
      categories_path
    else
      super
    end
    end


    def after_sign_out_path_for(resource_or_scope)
        # Redirect to the home page after signing out
        if resource_or_scope == :user
          root_path
        else
          super
        end
      end
end
