class ReviewUtility
	attr_accessor :movie_name, :reviewer, :stars, :review_text, :movie
	
	def initialize(review_data)
		@movie_name = review_data['Movie']
		@reviewer = review_data['User']
		@stars = review_data['Stars']
		@review_text = review_data['Review']
	end

	def create!
		@movie = find_or_initialize_movie
		
		return false unless movie
		
		create_movie_review
	end

	private

	def find_or_initialize_movie
		Movie.find_or_initialize_by(name: movie_name)
	end

	def create_movie_review
		movie.reviews.create!(
      reviewer: reviewer,
      stars: stars,
      review_text: review_text
    )
	end

end
