class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_admin!#, only: [:action]
    rescue_from ActiveRecord::RecordNotFound, with: :not_found 

    def not_found
        flash[:error] = "Not Found"
        redirect_to root_path
    end 

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])
    end

    #def authenticate_admin? 
    #    authenticate_user!
    #    redirect_to :login, #status::forbidden unless #current_user.admin?
    #end
end
