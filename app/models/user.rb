class User < ActiveRecord::Base
    #users -> poster/reader?
    has_many :posts
end
