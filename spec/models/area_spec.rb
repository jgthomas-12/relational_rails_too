require "rails_helper"

RSpec.describe Area, type: :model do
  describe "associations" do
    it {should have_many(:climbs)}
  end

  describe 'class methods' do
    # User Story 6, Parent Index sorted by Most Recently Created

    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    before(:each) do
      @canal_zone = Area.create!(name: "Canal Zone", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 70)
      @high_wire = Area.create!(name: "High Wire", town: "Golden, CO", camping: false, trad: true, sport: true, parking_spaces: 16)
      @cactus_cliff = Area.create!(name: "Cactus Cliff", town: "Canyon City, CO", camping: true, trad: true, sport: true, parking_spaces: 0)

    end
    
    describe '#sort_by_created_at' do
      it 'sorts the areas index by most recently created'do
        @canal_zone.update(created_at: 17.days.ago)
        @high_wire.update(created_at: 65.days.ago)
        @cactus_cliff.update(created_at: 2.days.ago)
        expect(Area.sort_by_created_at).to eq([@high_wire, @canal_zone, @cactus_cliff])
      end
    end
  end

end