class Movie < ApplicationRecord
	has_many :reviews

	validates :name, presence: true

	scope :by_actor, ->(actor) {
    where("array_to_string(actors, ',') LIKE ?", "%#{actor}%")
  }

  scope :avg_stars_desc_order, -> {
    joins(:reviews)
      .group('movies.id')
      .order('AVG(reviews.stars) DESC')
  }
end
