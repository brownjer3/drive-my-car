class SessionController < ApplicationController
# is helpers right here? or should i use private methods?

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 
        user = User.find_by(params[:user][:email])
        if user && .authenticate([params[:user][:password])
            session[:user_id] == user.id
        else
            #Raise an error here?
            redirect "/login"
        end
        redirect "/home"
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