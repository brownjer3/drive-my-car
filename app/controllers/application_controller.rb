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

  before "*/" do
    pass if request.path_info == "/"
    route_failsafe
  end

  not_found do
    'This is nowhere to be found.'
  end

  get "/", "/home" do
    if logged_in?
      erb :logged_in_home 
    else
      erb :logged_out_home
    end
  end

  # #potential error route for any bad errors (regex)
  # get "" do
  #   erb :error
  # end

  helpers do
    def valid?(param)
        !param.strip.empty? && !param.nil?
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
    def login_check!
      if !logged_in?
        redirect "/login"
      end
    end

    def route_failsafe
      redirect "#{params[:splat].join}"
    end

end
