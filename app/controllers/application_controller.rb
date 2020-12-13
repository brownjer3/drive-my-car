require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::MultiRoute

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  before "/posts*" do
    login_check!
  end

  before "/users*" do
    login_check!
  end

  before "*/" do
    pass if request.path_info == "/"
    route_failsafe
  end

  not_found do
    erb :error
  end

  get "/", "/home" do
    if logged_in?
      @posts = Post.where(origin: current_user.location)
      @posts.concat(Post.all.select {|p| p.origin.state == current_user.location.state})
      erb :logged_in_home 
    else
      #should account for post_date or something here
      @posts = Post.where(public: true).limit(5)
      erb :logged_out_home
    end
  end

  helpers do
    def valid?(param)
        !param.strip.empty? && !param.nil?
    end

    def valid_location?(param)
      valid?(param) && param.include?(", ")
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
    end

    def display_date(date)
      date.strftime("%B %d, %Y")
    end

    def short_date(date)
      date.strftime("%D")
    end

    def owner_name(post)
      post.user == current_user ? "you" : "#{post.user.name}"
    end

    def car_type(post)
      "#{post.car_year} #{post.car_make} #{post.car_model}"
    end

    def location_options
      Location.major_cities
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
        elsif diff_days.between?(1,30)
          "#{diff} days ago"
        else
            months = now.month - post_time.month
          "#{diff} month(s) ago"
        end
      end
    end

    def set_params(location_details)
      location = {}
      location[:city] = location_details.split(", ").first
      location[:state] = location_details.split(", ").last
      location
    end
    
  end

  private
    def login_check!
      if !logged_in?
        redirect "/login"
      end
    end

    def route_failsafe
      redirect "#{params[:splat].join}"
    end


end
