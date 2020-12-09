require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '???'
  end

  get "/" do
    erb :logged_out_home 
  end

  get "/home" do
    erb :logged_in_home
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

end
