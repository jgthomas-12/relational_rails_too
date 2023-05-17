    # User Story 12, Parent Update

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info

    require "rails_helper"

    RSpec.describe "Edit Area" do
      describe 'As a visitor' do
        describe 'When I visit an areas show page' do
          it 'I can update an area' do
            #create an area
            cactus_cliff = Area.create!(name: "Cactus Cliff", town: "Canyon City, CO", camping: true, trad: true, sport: true, parking_spaces: 0)
            #visit the area
            visit "/areas"
            #click "Edit" link
            click_link("Edit")

            expect(current_path).to eq("/areas/#{cactus_cliff.id}/edit")
            fill_in(:name, with: "The Greatest Place On Earth, Disney Be Damned")
            click_on "Update Area"

            expect(current_path).to eq("/areas/#{cactus_cliff.id}")
            expect(page).to have_content("The Greatest Place On Earth, Disney Be Damned")
          end
        end
      end
    end