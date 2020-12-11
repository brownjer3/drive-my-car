require 'date'

nyc = Location.create(city: "New York", state: "New York")
miami = Location.create(city: "Miami", state: "Florida")
austin = Location.create(city: "Austin", state: "Texas")
chicago = Location.create(city: "Chicago", state: "Illinois")
la = Location.create(city: "Los Angeles", state: "California")
seattle = Location.create(city: "Seattle", state: "Washington")

User.create(name: "JB", location: la, email: "jbtest@test.com", password: "password123")
one = User.create(name: "JB1", location: chicago, email: "jbtest1@test.com", password: "password123")
two = User.create(name: "JB2", location: nyc, email: "jbtest2@test.com", password: "password123")
three = User.create(name: "JB3", location: miami, email: "jbtest3@test.com", password: "password123")
User.create(name: "JB4", location: austin, email: "jbtest4@test.com", password: "password123")

post_1 = one.posts.build(title: "I'm baby blue bottle art party normcore, humblebrag raclette", desc: "I'm baby iPhone tofu bitters, four loko chicharrones distillery viral af la croix wolf tattooed lomo irony flexitarian dreamcatcher. Lumbersexual pinterest typewriter hot chicken, wolf quinoa before they sold out man braid coloring book intelligentsia yr cred. Distillery lomo locavore single-origin coffee tacos put a bird on it hot chicken VHS cray hell of. Direct trade locavore flannel quinoa, stumptown cornhole green juice art party health goth tumblr trust fund affogato kickstarter.", end_date: Date.new(2020, 12, 29), car_make: "Tesla", car_model: "Model X", car_year: 2050, origin: chicago, destination: nyc)
post_2 = one.posts.build(title: "vaporware freegan butcher 90's williamsburg biodiesel cronut craft", desc: "Schlitz pitchfork thundercats palo santo cray af, post-ironic meditation leggings prism gastropub intelligentsia ennui keytar jean shorts. Tote bag meggings craft beer mustache yuccie polaroid heirloom, literally cornhole. Snackwave ramps master cleanse mustache hashtag selvage. Slow-carb craft beer kinfolk bespoke vice vape. Cronut church-key skateboard chia, keytar green juice knausgaard vice pork belly raw denim vaporware forage. IPhone whatever kogi, cliche tacos heirloom +1 venmo.", end_date: Date.new(2021, 2, 16), car_make: "Tesla", car_model: "Model S", car_year: 2050, origin: la, destination: miami)
post_3 = two.posts.build(title: "beer mixtape. Chia craft beer chicharrones enamel pin VHS fashion", desc: "Portland freegan ethical subway tile kombucha poutine. 3 wolf moon unicorn sustainable, PBR&B asymmetrical 8-bit mlkshk hammock vape gluten-free artisan selvage schlitz viral chartreuse. Snackwave post-ironic jean shorts literally vegan bespoke. Everyday carry tilde blog, pug hot chicken master cleanse knausgaard dreamcatcher quinoa man bun hell of 3 wolf moon. Tote bag green juice pinterest glossier, copper mug poutine raclette locavore. Unicorn selfies art party, tattooed polaroid distillery portland banh mi plaid.", end_date: Date.new(2021, 5, 9), car_make: "Toyota", car_model: "Prius", car_year: 2010, origin: austin, destination: nyc)
post_4 = three.posts.build(title: "axe cloud bread distillery, edison bulb vaporware leggings venmo", desc: "Cliche ramps everyday carry plaid, YOLO umami lyft listicle yuccie before they sold out dreamcatcher gochujang knausgaard. Plaid schlitz pour-over meditation blue bottle hella stumptown. Lumbersexual prism pabst, sriracha kitsch semiotics tbh umami shaman health goth poke post-ironic lo-fi occupy. Lumbersexual sartorial sustainable quinoa heirloom, literally meditation. Air plant lumbersexual taiyaki, YOLO lyft bespoke slow-carb.", end_date: Date.new(2021, 1, 15), car_make: "Honda", car_model: "Accord", car_year: 2015, origin: nyc, destination: miami)
post_5 = three.posts.build(title: "Retro glossier mlkshk meggings.", desc: "Live-edge tumeric portland messenger bag DIY. Vaporware iceland 8-bit lo-fi salvia small batch succulents XOXO snackwave pork belly banjo tattooed before they sold out pok pok whatever. Fanny pack keytar flexitarian chambray. Kale chips neutra cliche four loko, portland irony yr blue bottle tbh fingerstache. Single-origin coffee organic woke tbh bicycle rights schlitz normcore microdosing chia literally. Chillwave sartorial whatever PBR&B jianbing narwhal.", end_date: Date.new(2021, 5, 12), car_make: "Dodge", car_model: "Caravan", car_year: 1999, origin: seattle, destination: la)

post_1.save
post_2.save
post_3.save
post_4.save
post_5.save