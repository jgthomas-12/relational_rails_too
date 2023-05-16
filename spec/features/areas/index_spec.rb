require "rails_helper"

RSpec.describe "/areas", type: :feature do
# User Story 1
# For each area table
# As a visitor
# When I visit '/areas'
# Then I see the name of each area record in the system

  before(:each) do
    @canal_zone = Area.create!(name: "Canal Zone", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 70)
    @high_wire = Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16)
    @cactus_cliff = Area.create!(name: "Cactus Cliff", town: "Canyon City, CO", camping: true, trad: true, sport: true, parking_spaces: 0)
  end

  describe "as a visitor, when I visit the area index page" do
    it "displays all the area names" do
      visit "/areas"
      expect(page).to have_content(@canal_zone.name)
      expect(page).to have_content(@high_wire.name)
      expect(page).to have_content(@cactus_cliff.name)
    end

    # User Story 6, Parent Index sorted by Most Recently Created

    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    it "orders the area names by most recently created (first)" do

      visit "/areas"

      expect(@cactus_cliff.name).to appear_before(@high_wire.name)
      expect(@high_wire.name).to appear_before(@canal_zone.name)

      @canal_zone.update(created_at: 65.days.ago)
      @cactus_cliff.update(created_at: 16.days.ago)
      @high_wire.update(created_at: 1.days.ago)

      visit "/areas"

      expect(@high_wire.name).to appear_before(@cactus_cliff.name)
      expect(@cactus_cliff.name).to appear_before(@canal_zone.name)

    end

    # user story 8

    it "links to climbs index page" do
      visit "/areas"
      save_and_open_page
      expect(page).to have_content("Go To Climbs Index")
      click_on "Go To Climbs Index"
      expect(current_path).to eq("/climbs")
      save_and_open_page

    end


  end
end

# This spec is testing whether everything displays correctly/ is it there? is it not there? (Don't joke, you're not at that edgey point, fahkah, it's allll there)