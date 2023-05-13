require "rails_helper"

RSpec.describe "/climbs", type: :feature do
  # User Story 3, Child Index

  # As a visitor
  # When I visit '/climbs'
  # Then I see each Climb in the system including the Climb's attributes
  # (data from each column that is on the child table)
  describe 'as a visitor, when I visit the climbs index page' do
    let!(:high_wire) { Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16) }
    # @high_wire = Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16)
    let!(:deuces_wild) { Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: high_wire.id)}
    it 'displays all the climbs attributes' do
      visit "/climbs"
      expect(page).to have_content(deuces_wild.name)
      expect(page).to have_content(deuces_wild.grade)
      expect(page).to have_content(deuces_wild.trad)
      expect(page).to have_content(deuces_wild.sport)
      expect(page).to have_content(deuces_wild.number_bolts)
      # expect(page).to have_content(deuces_wild.area_id.name?)
      # need to print out the boolean/integer attribute names so the return value displays as well
      save_and_open_page

    end
  end






end