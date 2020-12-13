class UsersController < ApplicationController

  get "/signup" do 
    erb :"users/new"
  end

  post "/signup" do
    if params[:user].values.all? {|v| valid?(v) } && new_user? && valid_location?(params[:location])
        location = set_params(params[:location])
        params[:user][:location] = Location.find_or_create_by(location)
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
    @posts = @user.posts.reverse
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
    location = set_params(params[:location])
    params[:user][:location] = Location.find_or_create_by(location)
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
    @posts.destory_all
  end

  def new_user?
    !User.find_by(email: params[:user][:email])
  end

end
