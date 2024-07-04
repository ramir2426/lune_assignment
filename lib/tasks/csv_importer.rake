require 'csv'    

namespace :csv_importer do
	desc "Import movies from CSV"
	task movies: :environment do
		CSV.foreach('lib/tasks/csv_files/movies.csv', headers: true) do |row|
			movie_utility = MovieUtility.new(row)
			movie_utility.create_or_update!
		end
	end

	desc "Import movie reviews from CSV"
	task reviews: :environment do
		CSV.foreach('lib/tasks/csv_files/reviews.csv', headers: true) do |row|
			review_utility = ReviewUtility.new(row)
			review_utility.create!
		end
	end

end
