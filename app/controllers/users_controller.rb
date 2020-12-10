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

  get "/users/:id/edit" do
    @user = User.find(params[:id])
    authorize!
    erb :"users/edit"
  end

  patch "/users/:id" do
    @user = User.find(params[:id])
    authorize!
    @user.update(params[:user])
    redirect "users/#{@user.id}"
  end

  delete "/users/:id/delete" do
    @user = User.find(params[:id])
    authorize!
    @posts = @user.posts
    destroy_posts
    @user.destroy
    redirect "/logout"
  end

  helpers do

    def owner?
      @user == current_user
    end

    def active_posts?
      !@user.posts.empty?
    end

  end

  private
  def authorize!
    if @user != current_user
      redirect "/home"
    end
  end

  def destroy_posts
    @posts.each {|p| p.destroy}
  end

end
