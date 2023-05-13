require "rails_helper"

RSpec.describe "/areas", type: :feature do
# User Story 1
# For each area table
# As a visitor
# When I visit '/areas'
# Then I see the name of each area record in the system
  describe "as a visitor, when I visit the area index page" do
    let!(:canal_zone) { Area.create!(name: "Canal Zone", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 70) }
    let!(:high_wire) { Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16) }
    it "displays all the area names" do
      # canal_zone = Area.create(name: "Canal Zone", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 70)

      visit "/areas"
      # save_and_open_page
      expect(page).to have_content(canal_zone.name)
      expect(page).to have_content(high_wire.name)
    end
  end
end

