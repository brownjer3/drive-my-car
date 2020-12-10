require 'date'

User.create(name: "JB", location: "Chicago", email: "jbtest@test.com", password: "password123")
one = User.create(name: "JB1", location: "Los Angeles", email: "jbtest1@test.com", password: "password123")
two = User.create(name: "JB2", location: "New York City", email: "jbtest2@test.com", password: "password123")
three = User.create(name: "JB3", location: "San Diego", email: "jbtest3@test.com", password: "password123")
User.create(name: "JB4", location: "Austin", email: "jbtest4@test.com", password: "password123")

post_1 = one.posts.build(title: "Test1", desc:"DESCRIPTION!!!!!", end_date: Date.new(2020, 12, 29), car_make: "Tesla", car_model: "Model X", car_year: 2050, origin: "LA", destination: "Chicago")
post_2 = one.posts.build(title: "Test2", desc:"DESCRIPTION!!!!!", end_date: Date.new(2021, 2, 16), car_make: "Tesla", car_model: "Model S", car_year: 2050, origin: "LA", destination: "NYC")
post_3 = two.posts.build(title: "Test3", desc:"DESCRIPTION!!!!!", end_date: Date.new(2021, 5, 9), car_make: "Toyota", car_model: "Prius", car_year: 2010, origin: "Austin", destination: "NYC")
post_4 = three.posts.build(title: "Test4", desc:"DESCRIPTION!!!!!", end_date: Date.new(2021, 1, 15), car_make: "Honda", car_model: "Accord", car_year: 2015, origin: "Chicago", destination: "Miami")
post_5 = three.posts.build(title: "Test5", desc:"DESCRIPTION!!!!!", end_date: Date.new(2021, 5, 12), car_make: "Dodge", car_model: "Caravan", car_year: 1999, origin: "Chicago", destination: "LA")

post_1.save
post_2.save
post_3.save
post_4.save
post_5.save