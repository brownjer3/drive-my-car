class User < ActiveRecord::Base
    has_secure_password
    #users -> poster/reader?
    has_many :posts
end
