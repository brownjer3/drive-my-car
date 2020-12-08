class SessionController < ApplicationController
# is helpers right here? or should i use private methods?

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 

    end

    get "logout" do
        
    end

    helpers do
        def current_user
            session[:user_id]
        end

        def logged_in?
            !!current_user
        end
    end
end