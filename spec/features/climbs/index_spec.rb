require "rails_helper"

RSpec.describe "/climbs", type: :feature do
  # User Story 3, Child Index

  # As a visitor
  # When I visit '/climbs'
  # Then I see each Climb in the system including the Climb's attributes
  # (data from each column that is on the child table)

  before(:each) do
    @high_wire = Area.create!(name: "High Wire", town: "Golden", camping: false, trad: true, sport: true, parking_spaces: 16)
    @deuces_wild = Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: @high_wire.id)
    @peoples_choice = Climb.create!(name: "People's Choice", grade: "5.10d", trad: false, sport: true, number_bolts: 20, area_id: @high_wire.id)


    @cactus_cliff = Area.create!(name: "Cactus Cliff", town: "Canyon City, CO", camping: true, trad: true, sport: true, parking_spaces: 0)
    @the_stand = Climb.create!(name: "The Stand", grade: "5.10b/c", trad: false, sport: true, number_bolts: 7, area_id: @cactus_cliff.id)

  end
  describe 'as a visitor, when I visit the climbs index page' do

    it 'displays all the climbs attributes' do

      visit "/climbs"

      expect(page).to have_content(@deuces_wild.name)
      expect(page).to have_content("Grade: #{@deuces_wild.grade}")
      expect(page).to have_content("Trad: #{@deuces_wild.trad}")
      expect(page).to have_content("Sport: #{@deuces_wild.sport}")
      expect(page).to have_content("Number of Bolts: #{@deuces_wild.number_bolts}")
      expect(page).to have_content("Area ID: #{@deuces_wild.area_id}")

      expect(page).to have_content(@peoples_choice.name)
      expect(page).to have_content("Grade: #{@peoples_choice.grade}")
      expect(page).to have_content("Trad: #{@peoples_choice.trad}")
      expect(page).to have_content("Sport: #{@peoples_choice.sport}")
      expect(page).to have_content("Number of Bolts: #{@peoples_choice.number_bolts}")
      expect(page).to have_content("Area ID: #{@peoples_choice.area_id}")

      expect(page).to have_content(@the_stand.name)
      expect(page).to have_content("Grade: #{@the_stand.grade}")
      expect(page).to have_content("Trad: #{@the_stand.trad}")
      expect(page).to have_content("Sport: #{@the_stand.sport}")
      expect(page).to have_content("Number of Bolts: #{@the_stand.number_bolts}")
      expect(page).to have_content("Area ID: #{@the_stand.area_id}")
    end

    # user story 9

    it 'links to the areas index page' do
      visit "/climbs"
      expect(page).to have_content("Go To Areas Index")
      click_on "Go To Areas Index"
      expect(current_path).to eq("/areas")
    end
  end





end