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
      actual = page.all('p').map do |area_name|
        area_name.text
      end
      expect(actual).to eq(["#{@canal_zone.name} Created At: #{@canal_zone.created_at}",
                            "#{@high_wire.name} Created At: #{@high_wire.created_at}",
                            "#{@cactus_cliff.name} Created At: #{@cactus_cliff.created_at}"])

      @canal_zone.update(created_at: 17.days.ago)
      @high_wire.update(created_at: 65.days.ago)
      @cactus_cliff.update(created_at: 2.days.ago)

      visit "/areas"
      actual = page.all('p').map do |area_name|
        area_name.text
      end
      expect(actual).to eq(["#{@high_wire.name} Created At: #{@high_wire.created_at}",
                            "#{@canal_zone.name} Created At: #{@canal_zone.created_at}",
                            "#{@cactus_cliff.name} Created At: #{@cactus_cliff.created_at}"])
    end
  end
end

# This spec is testing whether everything displays correctly/ is it there? is it not there?