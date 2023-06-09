require "rails_helper"

RSpec.describe "the area show page", type: :feature do
  # User Story 2, Parent Show
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  before(:each) do
    @canal_zone = Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70)
    @high_wire = Area.create!(name: "High Wire", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 16)

    @deuces_wild = @high_wire.climbs.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7)
    @peoples_choice = @high_wire.climbs.create!(name: "People's Choice", grade: "5.10d", trad: false, sport: true, number_bolts: 20)

    @box_of_rain = @canal_zone.climbs.create!(name: "Box of Rain", grade: "5.8", trad: false, sport: true, number_bolts: 8)
    @ripple = @canal_zone.climbs.create!(name: "Ripple", grade: 5.8, trad: false, sport: true, number_bolts: 9)
    @route_canal = @canal_zone.climbs.create!(name: "Route Canal", grade: "5.8+", trad: true, sport: false, number_bolts: 1)
  end

  describe 'as a visitor, when I visit /areas/:id' do

    it "displays the area name, area id and attributes for Canal Zone" do
      visit "/areas/#{@canal_zone.id}"
      # localhost:3000/areas/1
      expect(page).to have_content(@canal_zone.name)
      expect(page).to have_content("Area ID Numbah: #{@canal_zone.id}")
      expect(page).to have_content(@canal_zone.town)
      expect(page).to have_content("Camping: #{@canal_zone.camping}")
      expect(page).to have_content("Trad: #{@canal_zone.trad}")
      expect(page).to have_content("Sport: #{@canal_zone.sport}")
      expect(page).to have_content("Parking Spaces: #{@canal_zone.parking_spaces}")
    end

    it "displays the area name, area id and attributes for High Wire" do
      visit "/areas/#{@high_wire.id}"
      # localhost:3000/areas/1
      expect(page).to have_content(@high_wire.name)
      expect(page).to have_content("Area ID Numbah: #{@high_wire.id}")
      expect(page).to have_content(@high_wire.town)
      expect(page).to have_content("Camping: #{@high_wire.camping}")
      expect(page).to have_content("Trad: #{@high_wire.trad}")
      expect(page).to have_content("Sport: #{@high_wire.sport}")
      expect(page).to have_content("Parking Spaces: #{@high_wire.parking_spaces}")
    end

    # User Story 7, Parent Child Count

    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    # Usability

    it "displays a count of the number of children associated with the parent" do
      visit "/areas/#{@high_wire.id}"
      expect(page).to have_content("Number of Climbs: #{@high_wire.climbs.count}")

      visit "/areas/#{@canal_zone.id}"
      expect(page).to have_content("Number of Climbs: #{@canal_zone.climbs.count}")
    end

    # user story 8: the legend of climbs index links

    it "links to climbs index from any show page" do
      visit "/areas/#{@high_wire.id}"
      expect(page).to have_content("Go To Climbs Index")
      click_on "Go To Climbs Index"
      expect(current_path).to eq("/climbs")

      visit "/areas/#{@canal_zone.id}"
      expect(page).to have_content("Go To Climbs Index")
      click_on "Go To Climbs Index"
      expect(current_path).to eq("/climbs")
    end

    # user story 9

    it "links to the areas index page" do
      visit "/areas/#{@high_wire.id}"
      expect(page).to have_content("Go To Areas Index")
      click_on "Go To Areas Index"
      expect(current_path).to eq("/areas")

      visit "/areas/#{@canal_zone.id}"
      expect(page).to have_content("Go To Areas Index")
      click_on "Go To Areas Index"
      expect(current_path).to eq("/areas")
    end

    # User Story 10, Parent Child Index Link

    # As a visitor
    # When I visit a parent show page ("/parents/:id")
    # Then I see a link to take me to that parent"s `child_table_name` page ("/parents/:id/child_table_name")
    
    it "links to the climbs of the area" do
      visit "/areas/#{@canal_zone.id}"
      expect(page).to have_content("#{@canal_zone.name} Climbs")
      click_on "#{@canal_zone.name} Climbs"
      expect(current_path).to eq("/areas/#{@canal_zone.id}/climbs")

      visit "/areas/#{@high_wire.id}"
      expect(page).to have_content("#{@high_wire.name} Climbs")
      click_on "#{@high_wire.name} Climbs"
      expect(current_path).to eq("/areas/#{@high_wire.id}/climbs")
    end
  end
end
