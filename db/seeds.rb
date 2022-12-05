# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Creating users..."
User.create(first_name:"Albert", last_name:"Camus", email:"albert@gmail.com", password:"123456",phone_number:"828282", address:"Prinsengracht Amsterdam", image_url:"https://www.filosofie.nl/app/uploads//2020/06/camus-filosoof.jpg")

puts "Creating useful locations..."
Location.create(name: "Police Amsterdam Zuid Buitenveldert", description: "Police station - open 24hrs", address: "15 Van Leijenberghlaan, Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam Zuid De-Pijp", description: "Police station - closed during the weekend", address: "11 President Kennedylaan, Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam Nieuw-West Zuid", description: "Police station - open 24hrs", address: "284 Meer en Vaart , Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam Nieuw-West Noord", description: "Police station - closed during the weekend", address: "179 Postjesweg, Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam Burgwallen", description: "Police station - open 24hrs", address: "35 Nieuwezijds Voorburgwal, Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam-West Overtoomsesluis", description: "Police station - closed at night", address: "785 Hoofdweg, Amsterdam", category: "Police station")
Location.create(name: "Police Oost Watergraafsmeer", description: "Police station - closed at night", address: "111 Linnaeusstraat, Amsterdam", category: "Police station")
Location.create(name: "Police Amsterdam Centrum Amstel", description: "Police station - closed at night", address: "2 IJ-tunnel, Amsterdam", category: "Police station")
Location.create(name: "VU Medical Centre ER", description: "Emergency Room - open 24hr", address: "587 Amstelveenseweg, Amsterdam", category: "Hospital")
Location.create(name: "OLVG Oost ER", description: "Emergency Room - open 24hr", address: "9 Oosterpark, Amsterdam", category: "Hospital")
Location.create(name: "OLVG West ER", description: "Emergency Room - open 24hr", address: "164 Jan Tooropstraat, Amsterdam", category: "Hospital")
Location.create(name: "Rembrandtplein", description: "Busy square with bars", address: "Rembrandtplein, Amsterdam", category: "Busy area")
