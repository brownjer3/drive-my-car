class SessionController < ApplicationController
# is helpers right here? or should i use private methods?

    get "/login" do 
        erb :"sessions/login"
    end

    post "/login" do 
        if user = User.find_by(email: params[:email]) && user.authenticate([params:password])
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