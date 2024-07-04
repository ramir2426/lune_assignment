class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :director
      t.string :actors, array: true, default: []
      t.string :locations, array: true, default: []
      t.string :countries, array: true, default: []

      t.timestamps
    end
  end
end
