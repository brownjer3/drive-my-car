class UsersController < ApplicationController

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

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show"
  end

end
