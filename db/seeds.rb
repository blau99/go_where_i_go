# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Create users
usernames = ["alice", "bob", "carol"]
usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@uchicago.edu"
  user.password = "12341234"
  user.save
end
puts "There are now #{User.count} users in the database."

# Create restaurants
restaurant_info = [
  {
    :name => "",
    :address => "",
    :image => ""
  },
  {
    :name => "The Boarding House",
    :address => "720 N Wells St, Chicago, IL 60654",
    :image => "https://cdn0.vox-cdn.com/thumbor/fz_8sBAYSYdFgRJbUvM7x8GH0ro=/30x0:430x300/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732238/boarding_20house.0.jpg"
  },
  {
    :name => "Ruth's Chris Steak House",
    :address => "431 N Dearborn St, Chicago, IL 60654",
    :image => "https://cdn0.vox-cdn.com/thumbor/4XIu8zc9dgPhe2u2XBPc7LRlz-I=/59x0:444x289/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732252/ruths_20chris.0.jpg"
  },
  {
    :name => "Karyn's on Green",
    :address => "130 S Green St. Chicago, IL 60607",
    :image => "https://cdn0.vox-cdn.com/thumbor/HG9AYEhMm8q6UaIX3hgB5ZQ372E=/29x0:497x351/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732258/karyns.0.jpg"
  },
  {
    :name => "Bub City",
    :address => "435 N Clark St, Chicago, IL 60654",
    :image => "https://cdn0.vox-cdn.com/thumbor/wwahpRC37bh8zA8rKxwr8udiYh4=/50x0:850x600/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732260/url-7.0.jpeg"
  },
  {
    :name => "Red Door",
    :address => "2118 N Damen Ave. Chicago, IL 60647",
    :image => "https://cdn0.vox-cdn.com/thumbor/YI3LccsZcH602LmELyVyQ_eJ3zM=/243x0:776x400/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732268/red_20door.0.jpg"
  },
  {
    :name => "Mercat a la Planxa",
    :address => "638 S Michigan Ave, Chicago, IL 60605",
    :image => "https://cdn0.vox-cdn.com/thumbor/LEfDPVgx8bgRiB_PJIDUel6VmzE=/34x0:566x399/800x600/filters:format(webp)/cdn0.vox-cdn.com/uploads/chorus_image/image/38732254/mercat.0.jpg"
  }
]

Restaurant.all.each do |rest|
  rest.delete
end

restaurant_info.each do |ri|
  rest = Restaurant.new
  rest.name = ri[:name]
  rest.address = ri[:address]
  rest.image = ri[:image]
  rest.save
end
puts "There are now #{Restaurant.count} restaurants in the database."

# Create accommodations
accommodation_info = [
  {
    :name => "",
    :address => "",
    :cost_per_night => 0.0,
    :image => ""
  },
  {
    :name => "OMNI CHICAGO HOTEL",
    :address => "676 NORTH MICHIGAN AVENUE CHICAGO, ILLINOIS 60611",
    :cost_per_night => 250.0,
    :image => "https://www.omnihotels.com/-/media/images/hotels/chidtn/hotel/chidtn-omni-chicago-hotel-entrance.gif?h=660&la=en&w=1170"
  },
  {
    :name => "Kimpton Hotel Allegro",
    :address => "171 W Randolph St, Chicago, IL 60601",
    :cost_per_night => 152.0,
    :image => "https://d172vyvma702ee.cloudfront.net/system/uploads/image/asset/985/alg_ex_005-2.jpg?v=1442011024"
  },
  {
    :name => "Chicago Boutique Hotels",
    :address => "21 East Bellevue Place Chicago, IL 60611",
    :cost_per_night => 300.0,
    :image => "http://www.majestic-chicago.com/images/1.jpg"
  },
  {
    :name => "The Gwen",
    :address => "521 N Rush St, Chicago, IL 60611",
    :cost_per_night => 274.0,
    :image => "https://exp.cdn-hotels.com/hotels/1000000/560000/558100/558027/8c1f5fb0_z.jpg"
  },
  {
    :name => "Loews Chicago Hotel",
    :address => "455 North Park Drive, Streeterville, Chicago, IL 60611",
    :cost_per_night => 194.0,
    :image => "https://media-cdn.tripadvisor.com/media/photo-s/08/1d/a4/13/loews-chicago-hotel.jpg"
  },
  {
    :name => "Hilton Chicago",
    :address => "720 S Michigan Ave, Chicago, IL, 60605",
    :cost_per_night => 224.0,
    :image => "https://media-cdn.tripadvisor.com/media/photo-o/08/b5/1c/6c/lakeview-double-guest.jpg"
  }
]

Accommodation.all.each do |acc|
  acc.delete
end

accommodation_info.each do |ai|
  acc = Accommodation.new
  acc.name = ai[:name]
  acc.address = ai[:address]
  acc.cost_per_night = ai[:cost_per_night]
  acc.image = ai[:image]
  acc.save
end
puts "There are now #{Accommodation.count} accommodations in the database."


# Create point of interests
points_of_interest_info = [
  {
    :name => "",
    :address => "",
    :admission_fee => 0.0,
    :image => ""
  },
  {
    :name => "Buckingham Fountain",
    :address => "301 S Columbus Dr, Chicago, IL 60605",
    :admission_fee => 0.0,
    :image => "https://media-cdn.tripadvisor.com/media/photo-s/01/07/8c/66/chicago.jpg"
  },
  {
    :name => "Observation Decks & Towers",
    :address => "233 S Wacker Dr, Chicago, IL 60606",
    :admission_fee => 22.5,
    :image => "https://media-cdn.tripadvisor.com/media/photo-s/06/db/ba/b2/skydeck-chicago.jpg"
  },
  {
    :name => "the Navy Pier",
    :address => "600 E Grand Ave, Chicago, IL 60611",
    :admission_fee => 0.0,
    :image => "http://previews.123rf.com/images/robwilson39/robwilson391108/robwilson39110800013/10434838-CHICAGO-AUGUST-26-Chicago-s-number-one-tourist-attraction-the-Navy-Pier-in-Chicago-on-August-26-2011-Stock-Photo.jpg"
  },
  {
    :name => "Baha'i House of Worship in Chicago",
    :address => "100 Linden Ave, Wilmette, IL 60091",
    :admission_fee => 0.0,
    :image => "http://4.bp.blogspot.com/-XJfWV6uwiVk/VBIK4N0JCOI/AAAAAAAAJb8/j0gyh6S0Wa8/s1600/Chicago%2BBaha'i%2Btemple.jpg"
  },
  {
    :name => "RIVERWALK",
    :address => "E Upper Wacker Dr, Chicago, IL 60601",
    :admission_fee => 0.0,
    :image => "http://loopchicago.com/_files/images/downtown_docks.jpg"
  },
  {
    :name => "Adler Planetarium",
    :address => "1300 S Lake Shore Dr, Chicago, IL 60605",
    :admission_fee => 12.0,
    :image => "https://media.timeout.com/images/103140305/image.jpg"
  }
]

PointsOfInterest.all.each do |poi|
  poi.delete
end

points_of_interest_info.each do |pi|
  poi = PointsOfInterest.new
  poi.name = pi[:name]
  poi.address = pi[:address]
  poi.admission_fee = pi[:admission_fee]
  poi.image = pi[:image]
  poi.save
end
puts "There are now #{PointsOfInterest.count} point of interests in the database."
