class SessionController < ApplicationController

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 
        user = User.find_by(email: params[:email]) 
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/home"
        else
            #Raise an error here?
            redirect "/login"
        end
    end 

    post "/logout" do
        session.clear
        redirect "/"
    end

end