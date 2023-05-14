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

    it "displays the area name, area id and attributes for Canal Zone" do
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

  end
end
