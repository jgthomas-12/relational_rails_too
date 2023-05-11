class AddAreasToClimbs < ActiveRecord::Migration[7.0]
  def change
    add_reference :climbs, :area, null: false, foreign_key: true
  end
end
