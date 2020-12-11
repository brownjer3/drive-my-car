class Location < ActiveRecord::Base
    has_many :users
    has_many :origins, foreign_key: "origin_id", class_name: "Post"
    has_many :destinations, foreign_key: "destination_id", class_name: "Post"
end