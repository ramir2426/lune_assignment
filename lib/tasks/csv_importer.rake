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
		CSV.foreach('lib/tasks/csv_files/review.csv', headers: true) do |row|
			ReviewUtility.new(row)
		end
	end

end
