class HomeController < ApplicationController

    def index
        # session[:userinfo] was saved earlier on Auth0Controller#callback
        @user = session[:userinfo]
        render "index"
    end
    
    def about
    end
end
