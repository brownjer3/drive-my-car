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
    redirect_if_not_logged_in
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
  end

  private
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

end
