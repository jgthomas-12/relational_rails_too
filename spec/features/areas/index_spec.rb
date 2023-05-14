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
  end
end

