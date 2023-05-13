require "rails_helper"

RSpec.describe "the climbs show page" do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)
  describe "as a visitor, when I visit '/climbs/:id'" do
    let!(:high_wire) { Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16) }
    let!(:deuces_wild) { Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: high_wire.id)}

    it "displays the climb name, id, and attributes" do
      visit "/climbs/#{deuces_wild.id}"
      expect(page).to have_content(deuces_wild.name)
      expect(page).to have_content(deuces_wild.id)
      expect(page).to have_content(deuces_wild.grade)
      expect(page).to have_content(deuces_wild.trad)
      expect(page).to have_content(deuces_wild.sport)
      expect(page).to have_content(deuces_wild.number_bolts)
      expect(page).to have_content(deuces_wild.area_id) # name?
      save_and_open_page
    end

  end




end