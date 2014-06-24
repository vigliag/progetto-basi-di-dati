
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# t.string :title
#       t.integer :length
#       t.integer :year
#       t.text :description
#       t.string :country

Admin.create(email: 'admin@example.com', password: 'sushi123', password_confirmation: 'sushi123')

movies = [
    ['Spirited Away', 2001, 124, 'Japan', 'Oscar-Winner movie from Myazaki', File.new("#{Rails.root}/db/seeds/spirited_away.jpg")],
    ['Kiki\'s delivery service', 1989, 102, 'Japan', 'Very beautiful movie about leaving home and making friends', File.new("#{Rails.root}/db/seeds/kiki.jpg")]
]

movies.each do |title, year, length, country, desc, poster|
	Movie.create({title: title, year:year, description: desc, country: country, length:length, poster: poster})	
end

# t.integer :movie_id
#       t.datetime :start
#       t.integer :screen_id

Screen.create(avaiable: true, seats_string: "A1 A2 A3 B1 B2 B3 C1 C2 C3")
Screen.create(avaiable: true, seats_string: "A1 A2 A3 B1 B2 B3 C1 C2 C3 D1 D2 D3")

shows = [
      [1, DateTime.new(2014,06,30,15,20), 4, 1],
      [2, DateTime.new(2014,06,30,15,20), 8, 2],
      [1, DateTime.new(2014,06,30,18,30), 16, 1]
]

shows.each do |movie, datetime, price, screen|
	Show.create({movie_id:movie, start: datetime, price:price, screen_id:screen})
end

purchase1 = Purchase.new(name: "Gabriele Viglianisi")
purchase1.gen_secret!
purchase1.save!

purchase2 = Purchase.new(name: "Riccardo Di Lorenzo")
purchase2.secret = '1234a'
purchase2.save!

ticket1 = Ticket.create(show_id:1, seat:"C1", purchase_id:purchase1.id)
ticket2 = Ticket.create(show_id:1, seat:"C2", purchase_id:purchase1.id)
ticket3 = Ticket.create(show_id:2, seat:"B1", purchase_id:purchase2.id)