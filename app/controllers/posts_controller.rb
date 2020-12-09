class PostsController < ApplicationController

    get "/posts" do
      @posts = Post.all
      erb :"/posts/index"
    end
  
    # GET: /posts/new
    get "/posts/new" do
      erb :"/posts/new"
    end

    post "/posts" do
      post = current_user.posts.build(params[:post])
      post.save
      redirect "/posts/#{post.id}"
    end
  
    # GET: /posts/5
    get "/posts/:id" do
      @post = Post.find(params[:id])
      erb :"/posts/show"
    end
  
    get "/posts/:id/edit" do
      @post = Post.find(params[:id])
      erb :"/posts/edit"
    end
  
    patch "/posts/:id" do
      @post = Post.find(params[:id])
      @post.update(params[:post])
      redirect "/posts/#{@post.id}"
    end
  
    # DELETE: /posts/5/delete
    delete "/posts/:id/delete" do
      redirect "/posts"
    end

    private 
      def redirect_if_unauthorized
        if @post.user != current_user
          redirect "/posts"
        end
      end

      # def display_date
      #   self.strftime(%D)
      # end

end