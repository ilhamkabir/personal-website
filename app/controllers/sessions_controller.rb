class SessionsController < ApplicationController
    # include Auth0Helper
    # layout 'session'

    def create
        session[:userinfo] = request.env['omniauth.auth']

        login = Login.find_by!(auth0_id: session[:userinfo]['uid'])
        login.update!(last_login: Time.zone.now)

        session[:user_id] = login.user_id
        redirect_to(session[:referer] || root_path), notice: 'Signed in'
    rescue StandardError => e
        Rails.logger.error(e)
    
        reset_session
        params[:message] = 'Login failure'
        params[:error_description] = 'Not authorized to login'
        render :failure
    end

    def failure
        reset_session
    end
      
    def destroy
        reset_session
        redirect_to root_path, notice: 'Signed out'
    end



end
