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
    require 'pry'; binding.pry
    @canal_zone = Area.create!(
                              name: "Canal Zone",
                              town: "Golden, CO",
                              camping: false,
                              trad: true,
                              sport: true,
                              parking_spaces: 70)
    @box_of_rain = Climb.create!(
                              name: "Box of Rain",
                              grade: 5.8,
                              trad: false,
                              sport: true,
                              number_bolts: 8,
                              area_id: @canal_zone.id)
    # Climb.create!(name: "Deuces Wild", grade: "5.10a", trad: false, sport: true, number_bolts: 7, area_id: high_wire.id)
  end

  it 'displays each climb and attributes associated with the area ' do
    visit "/areas/#{@canal_zone.id}/climbs"

    expect(page).to have_content(@box_of_rain.name)
  end

  # it "links to each climbs show page" from video 
end