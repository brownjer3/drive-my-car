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



end
