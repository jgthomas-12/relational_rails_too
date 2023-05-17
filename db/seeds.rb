# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Area.destroy_all
Climb.destroy_all

@canal_zone = Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70)
@high_wire = Area.create!(name: "High Wire", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 16)
@cactus_cliff = Area.create!(name: "Cactus Cliff", town: "Canyon City, CO", camping: true, trad: true, sport: true, parking_spaces: 0)

@box_of_rain = Climb.create!(name: "Box of Rain", grade: "5.8", trad: false, sport: true, number_bolts: 8, area_id: @canal_zone.id)
@ripple = Climb.create!(name: "Ripple", grade: 5.8, trad: false, sport: true, number_bolts: 9, area_id: @canal_zone.id)
@route_canal = Climb.create!(name: "Route Canal", grade: "5.8+", trad: true, sport: false, number_bolts: 1, area_id: @canal_zone.id )

@deuces_wild = Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: @high_wire.id)
@peoples_choice = Climb.create!(name: "People's Choice", grade: "5.10d", trad: false, sport: true, number_bolts: 20, area_id: @high_wire.id)

@the_stand = Climb.create!(name: "The Stand", grade: "5.10b/c", trad: false, sport: true, number_bolts: 7, area_id: @cactus_cliff.id)
@century_man = Climb.create!(name: "20th Century Man", grade: "5.10a/b", trad: false, sport: true, number_bolts: 7, area_id: @cactus_cliff.id)
