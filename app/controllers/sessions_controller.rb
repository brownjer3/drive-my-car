class SessionController < ApplicationController

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 
        binding.pry
        if user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
            session[:user_id] = user.id
            redirect "/home"
        else
            #Raise an error here?
            redirect "/login"
        end
    end 

    get "/logout" do
        session.clear
        redirect "/"
    end

end