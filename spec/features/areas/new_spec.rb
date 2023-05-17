    # User Story 11, Parent Creation

    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.

require "rails_helper"

RSpec.describe "New Area" do
  describe "As A Visitor" do
    describe "When I visit the new artist form by clicking a link on the index" do
      it "can create a new artist" do
        visit "/areas"

        click_link "New Area"

        expect(current_path).to eq("/areas/new")

        fill_in "Name", with: "Little Eiger"
        fill_in "Town", with: "Golden, CO"
        uncheck "Camping"
        check "Trad"
        check "Sport"
        fill_in "Parking Spaces", with: 15

        click_on "Create Area"

        expect(current_path).to eq("/areas")
        expect(page).to have_content("Little Eiger")
        #could access show page with "/areas/#{Area.all.first.id}/show"?
      end
    end
  end
end
