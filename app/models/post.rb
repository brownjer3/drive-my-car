class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :origin, class_name: "Location"
    belongs_to :destination, class_name: "Location"
end
