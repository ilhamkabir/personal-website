class ApplicationController < ActionController::Base
    def user_signed_in?
        session[:userinfo].present? ? true : false
    end
    helper_method :user_signed_in?

    private
    
    def authenticate_user!
        return if user_signed_in?

        redirect_to root_path, alert: "You must be signed in"
    end
end
