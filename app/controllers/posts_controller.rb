class PostsController < ApplicationController

    get "/posts", "/posts/" do
      @posts = Post.all.reverse
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

      def owner_name(post)
        post.user == current_user ? "You need your" : "#{post.user.name} needs their"
      end

      def car_type(post)
        "#{post.car_year} #{post.car_make} #{post.car_model}"
      end

      def time_since_post(time)
        post_time = time.utc
        now = Time.now.utc
        diff_minutes = (now - post_time.to_time )/60
        if diff_minutes.between?(0,59)
          "#{diff_minutes.round} minutes ago"
        elsif diff_minutes.between?(60,1440)
          "#{(diff_minutes/60).round} hours ago"
        else
          diff_days = now.day - post_time.day
          if diff_days.round == 1
            "yesterday"
          elsif diff.between?(1,30)
            "#{diff} days ago"
          else
              months = now.month - post_time.month
            "#{diff} month(s) ago"
          end
        end
      end
    end

    private 
      def authorize!
        if @post.user != current_user
          redirect "/posts"
        end
      end

      # def exists?
      #   @post = Post.find(params[:id])
      #   if @post
      #     true
      #   else
      #     erb :error
      #   end
      # end

end