class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.float :stars, default: 1
      t.text :review_text
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
