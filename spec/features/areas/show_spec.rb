require "rails_helper"

RSpec.describe "the area show page", type: :feature do
  # User Story 2, Parent Show
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  describe 'as a visitor, when I visit /areas/:id' do
    let!(:canal_zone) { Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70) }

    it "displays the area name, area id and attributes" do
      visit "/areas/#{canal_zone.id}"
      # localhost:3000/areas/1
      expect(page).to have_content(canal_zone.name)
      expect(page).to have_content(canal_zone.id)
      expect(page).to have_content(canal_zone.town)
      expect(page).to have_content(canal_zone.camping)
      expect(page).to have_content(canal_zone.trad)
      expect(page).to have_content(canal_zone.sport)
      expect(page).to have_content(canal_zone.parking_spaces)
      save_and_open_page

      # make another area and test it

    end

  end
end
