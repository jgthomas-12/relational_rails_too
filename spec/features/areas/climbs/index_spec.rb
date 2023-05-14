require "rails_helper"

RSpec.describe "the areas climbs index", type: :feature do
  # User Story 5
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
                  # area    id         climb   index
  # Then I see each Child (climb) that is associated with that Parent (Area) with each Child's (Climb's) attributes
  # (data from each column that is on the child table)
  # ActiveRecord
  before(:each) do
    @canal_zone = Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70)
    @box_of_rain = Climb.create!(name: "Box of Rain", grade: "5.8", trad: false, sport: true, number_bolts: 8, area_id: @canal_zone.id)
    @ripple = Climb.create!(name: "Ripple", grade: "5.8", trad: false, sport: true, number_bolts: 9, area_id: @canal_zone.id)
    @beasto = @canal_zone.climbs.create!(name: "Beasto", grade: "5.10a", trad: false, sport: true, number_bolts: 11)
    visit "/areas/#{@canal_zone.id}/climbs"

    # Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: high_wire.id)
    # Couldn't get @canal_zone.climbs.create! to work. Revisit this idea.
    # Couldn't get the test_data in spec_helper to work, it was only returning the last instance object.
  end

  it 'displays each climb name associated with the area ' do
    expect(page).to have_content(@box_of_rain.name)
    expect(page).to have_content(@ripple.name)
    expect(page).to have_content(@beasto.name)
  end

  it 'displays each climb grade associated with the area ' do
    expect(page).to have_content("Grade: #{@box_of_rain.grade}")
    expect(page).to have_content("Grade: #{@ripple.grade}")
    expect(page).to have_content("Grade: #{@beasto.grade}")
  end

  it 'displays if the route is a trad route' do
    expect(page).to have_content("Trad: #{@box_of_rain.trad}")
    expect(page).to have_content("Trad: #{@ripple.trad}")
    expect(page).to have_content("Trad: #{@beasto.trad}")
  end

  it 'displays if the route is a sport route' do
    expect(page).to have_content("Sport: #{@box_of_rain.sport}")
    expect(page).to have_content("Sport: #{@ripple.sport}")
    expect(page).to have_content("Sport: #{@beasto.sport}")
  end

  it 'displays how many bolts the route has' do
    expect(page).to have_content("Number of Bolts: #{@box_of_rain.number_bolts}")
    expect(page).to have_content("Number of Bolts: #{@ripple.number_bolts}")
    expect(page).to have_content("Number of Bolts: #{@beasto.number_bolts}")
  end

  # this test page can probably be written as blocks for each instance variable
  # example: it "displays box_of_rain name and attributes: list all of them" do it again
  # OR it "displays all climb names" - 3 routes.name, it "displays climb grades" - 3 climb.grades
  # it "links to each climbs show page" from video
end