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

    get "/signup" do 
        erb :"users/new"
    end

    post "/signup" do
    # might want to add in an ActiveRecord VALIDATION for this step!
    # user = User.find_or_create(params[:user])
        if params[:user].values.all? {|v| valid?(v) } && !User.find_by(email: params[:user][:email])
            user = User.create(params[:user])
            session[:user_id] = user.id
            redirect "/home"
        else
            #raise error here?
            redirect "/signup"
        end
    end

end