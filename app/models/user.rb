class User < ActiveRecord::Base
    has_secure_password

    has_many :posts
    belongs_to :location
end
