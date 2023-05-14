# Orinally put this in the model area_spec - after working with Matthew J adjusted everything to area feature index spec and this was left over

# describe 'instance methods' do
#   before(:each) do
#     @canal_zone = Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70)
#     @box_of_rain = Climb.create!(name: "Box of Rain", grade: "5.8", trad: false, sport: true, number_bolts: 8, area_id: @canal_zone.id)
#     @ripple = Climb.create!(name: "Ripple", grade: "5.8", trad: false, sport: true, number_bolts: 9, area_id: @canal_zone.id)
#     @beasto = @canal_zone.climbs.create!(name: "Beasto", grade: "5.10a", trad: false, sport: true, number_bolts: 11)
#   end

  # # User Story 6, Parent Index sorted by Most Recently Created

  # # As a visitor
  # # When I visit the parent index,
  # # I see that records are ordered by most recently created first
  # # And next to each of the records I see when it was created

  # it 'orders the records by most recently created, ascending order' do
  #   #visit the index page "/areas"
  #   #routes.rb is going to be |  put "/areas" to "areas#show"? | Make a new show method to adjust the index display?
  #   #it should automatically read each climb in created order (box_of_rain, ripple, beasto) so....
  #   # needs to be opposite of the created order (beasto, ripple, box_of_rain)
  #   # can expect(an array of created climbs in the models controller).to eq([@beasto, @ripple, @box_of_rain])
  #   # expect(@canal_zone.climbs.show).to eq([@beasto, @ripple, @box_of_rain])
  #   visit "/areas"
  #   expect(page).to have_content([@beasto, @ripple, @box_of_rain])


  #   #this needs to be in the model...how do I test it?
  #   # oh...descending order because beasto is the most recently created
  #   climb_times = @canal_zone.climbs.pluck(:created_at)
  #   climb_times.sort! #need to sort in descending order, and need to do that with active record methods not ruby methods
  # end

  # it "displays the created_at time next to each record"


# end

    ----
