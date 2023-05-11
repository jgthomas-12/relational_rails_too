class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :town
      t.boolean :camping
      t.boolean :trad
      t.boolean :sport
      t.integer :parking_spaces

      t.timestamps
    end
  end
end
