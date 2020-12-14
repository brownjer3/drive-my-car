# Drive My Car
Drive My Car is an MVC application built with Ruby using ActiveRecord and Sinatra. The application aims to match users who have cars that need to be driven long distances with users who are willing to complete that trip.


Non-users can view public posts directly on the logged out homepage without an account. When signing up or creating new posts, all input fields are validated to ensure bad data isn't persisted in the DB. Once you're signed up you can browse posts (near you and all), create your own post, and edit/delete your post. Users can also edit their account details after registration. 

# Start your engines
To use Drive My Car...

* Clone this repo
* Run Bundle Install 
* Set up a .env file to locally house your session_secret for Bcrypt
* Add in seed data with Rake db:seed
  
# Hit the gas
Once you've completed the setup...

* Start the Shotgun server with the command "Shotgun"
* Open the server link inside a web browser
* Sign up for a page, or log into one of the seeded accounts
* Submit, edit, delete a post
* Edit, delete your account

# Collaborating
Pull Requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.


