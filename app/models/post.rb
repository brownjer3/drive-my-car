class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :origin, class_name: "Location"
    belongs_to :destination, class_name: "Location"

    #string => "Chicago, Illinois"
    
    # def origin_attributes=(string)
    #     data = {
    #         city: string.split(", ").first,
    #         state: string.split(", ").last
    #     }
    #     self.origin = Location.find_or_create_by(data)
    # end

    # def destination_attributes=(string)
    #     data = {
    #         city: string.split(", ").first,
    #         state: string.split(", ").last
    #     }
    #     self.destination = Location.find_or_create_by(data)
    # end

    def location_attributes=(hash)
        # binding.pry
        #hash = {"origin"=>"Providence, Rhode Island", "destination"=>"Richardson, Texas"}
        hash.each do |key, value|
            data = {
                city: value.split(", ").first,
                state: value.split(", ").last
            }
            self.send("#{key}=", Location.find_or_create_by(data))
        end
    end

end
