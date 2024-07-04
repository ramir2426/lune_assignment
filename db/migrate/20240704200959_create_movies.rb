class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :director
      t.string :actor, array: true, default: []
      t.string :location, array: true, default: []
      t.string :country, array: true, default: []

      t.timestamps
    end
  end
end
