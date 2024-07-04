class MoviesController < ApplicationController

	def index
		@movies= Movie.avg_stars_desc_order
	end

	def search
		@movies = Movie.by_actor(params[:actor_name])
		@movies = @movies.left_joins(:reviews).group(:id).order('AVG(reviews.stars) DESC')
	end
end
