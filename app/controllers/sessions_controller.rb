class SessionController < ApplicationController

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 
        if user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
            session[:user_id] = user.id
            redirect "/home"
        else
            redirect "/login"
        end
    end 

    get "/logout" do
        session.clear
        redirect "/"
    end

end