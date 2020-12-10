ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task 'console' do 
    Pry.start
end

task 'clear_db' do
    User.destroy_all
    Post.destroy_all
end
