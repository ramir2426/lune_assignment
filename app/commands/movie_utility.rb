class MovieUtility
	attr_accessor :name, :description, :year, :director, :location, :actor, :country
	
	def initialize(movie_data)
		@name = movie_data['Movie']
		@description = movie_data['Description']
		@year = movie_data['Year']
		@director = movie_data['Director']
		@location = movie_data['Filming location']
		@actor = movie_data['Actor']
		@country = movie_data['Country']
	end


	def create_or_update!
		movie = build_record
		movie.save!
	end

	private

	def find_or_initialize_movie
		Movie.find_or_initialize_by(name: name)
	end

	def build_record
		movie = find_or_initialize_movie

		movie.description = description
		movie.year = year
		movie.director = director

		locations = movie.locations || []
		movie.locations = locations.push(location).uniq

		actors = movie.actors || []
		movie.actors = actors.push(actor).uniq

		countries = movie.countries || []
		movie.countries = countries.push(country).uniq

		movie
	end
end
