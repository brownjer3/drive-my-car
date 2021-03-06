class PostsController < ApplicationController

    get "/posts" do
      @posts = sort_by_recent(Post.all)
      erb :"/posts/index"
    end
  
    get "/posts/new" do
      erb :"/posts/new" 
    end

    post "/posts" do
      if params[:post].values.all? {|v| valid?(v)} && valid_location?(params[:origin]) && valid_location?(params[:destination])
        origin = set_params(params[:origin])
        destination = set_params(params[:destination])
        params[:post][:origin] = Location.find_or_create_by(origin)
        params[:post][:destination] = Location.find_or_create_by(destination)
        post = current_user.posts.build(params[:post])
        post.save
        redirect "/posts/#{post.id}"
      else
        redirect "/posts/new"
      end
    end
  
    get "/posts/:id" do
      @post = Post.find(params[:id])
      erb :"/posts/show"
    end
  
    get "/posts/:id/edit" do
      @post = Post.find(params[:id])
      authorize!
      erb :"/posts/edit"
    end
  
    patch "/posts/:id" do
      @post = Post.find(params[:id])
      authorize!
      origin = set_params(params[:origin])
      destination = set_params(params[:destination])
      params[:post][:origin] = Location.find_or_create_by(origin)
      params[:post][:destination] = Location.find_or_create_by(destination)
      @post.update(params[:post])
      redirect "/posts/#{@post.id}"
    end
  
    delete "/posts/:id/delete" do
      @post = Post.find(params[:id])
      authorize!
      @post.destroy
      redirect "/posts"
    end

    helpers do
      def owner?
        @post.user == current_user
      end
    end

    private 
      def authorize!
        if @post.user != current_user
          redirect "/posts"
        end
      end

end