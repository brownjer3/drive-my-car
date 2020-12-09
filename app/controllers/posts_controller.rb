class PostsController < ApplicationController

    get "/posts" do
      @posts = Post.all
      erb :"/posts/index"
    end
  
    get "/posts/new" do
      erb :"/posts/new"
    end

    post "/posts" do
      post = current_user.posts.build(params[:post])
      post.save
      redirect "/posts/#{post.id}"
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

      # def display_date
      #   self.strftime(%D)
      # end

end