require "rails_helper"

RSpec.describe "the climbs show page", type: :feature do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

  before(:each) do
    @high_wire = Area.create!(name: "High Wire", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 16)
    @deuces_wild = Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: @high_wire.id)
    @peoples_choice = Climb.create!(name: "People's Choice", grade: "5.10d", trad: false, sport: true, number_bolts: 20, area_id: @high_wire.id)
  end

  describe "as a visitor, when I visit '/climbs/:id'" do

    it "displays Deuces Wild climb name and attributes" do

      visit "/climbs/#{@deuces_wild.id}"

      expect(page).to have_content(@deuces_wild.name)
      expect(page).to have_content("Climb ID: #{@deuces_wild.id}")
      expect(page).to have_content("Grade: #{@deuces_wild.grade}")
      expect(page).to have_content("Trad: #{@deuces_wild.trad}")
      expect(page).to have_content("Sport: #{@deuces_wild.sport}")
      expect(page).to have_content("Number of Bolts: #{@deuces_wild.number_bolts}")
      expect(page).to have_content("Area ID Number: #{@deuces_wild.area_id}") # name?

    end

    it "displays peoples_choice climb name and attributes" do

      visit "/climbs/#{@peoples_choice.id}"

      expect(page).to have_content(@peoples_choice.name)
      expect(page).to have_content("Climb ID: #{@peoples_choice.id}")
      expect(page).to have_content("Grade: #{@peoples_choice.grade}")
      expect(page).to have_content("Trad: #{@peoples_choice.trad}")
      expect(page).to have_content("Sport: #{@peoples_choice.sport}")
      expect(page).to have_content("Number of Bolts: #{@peoples_choice.number_bolts}")
      expect(page).to have_content("Area ID Number: #{@peoples_choice.area_id}") # name?
    end

    it 'links to climbs index page no mattah the cloimb' do
      visit "/climbs/#{@peoples_choice.id}"
      expect(page).to have_content("Back To Climbs Index")
      click_on "Back To Climbs Index"
      expect(current_path).to eq("/climbs")

      visit "/climbs/#{@deuces_wild.id}"
      expect(page).to have_content("Back To Climbs Index")
      click_on "Back To Climbs Index"
      expect(current_path).to eq("/climbs")
    end

    # it 'displays the climb grade' do

    # end

    # it 'shows if it is a trad route' do

    # end

    # it 'shows if it is a sport route' do

    # end

    # it 'shows how many bolts it has' do

    # end

    # it 'shows the area id number' do

    # end

  end




end