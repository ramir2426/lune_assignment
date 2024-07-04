require 'rails_helper'

RSpec.describe MovieUtility, type: :service do
  describe '#create_or_update!' do
    let(:movie_data) do
      {
        'Movie' => 'Inception',
        'Description' => 'A mind-bending thriller',
        'Year' => 2010,
        'Director' => 'Christopher Nolan',
        'Filming location' => 'Los Angeles',
        'Actor' => 'Leonardo DiCaprio',
        'Country' => 'USA'
      }
    end

    subject { described_class.new(movie_data) }

    it 'creates a new movie if it does not exist' do
      expect { subject.create_or_update! }.to change { Movie.count }.by(1)
    end

    it 'updates an existing movie if it exists' do
      movie = create(:movie, name: 'Inception')
      expect { subject.create_or_update! }.not_to change { Movie.count }
      movie.reload
      expect(movie.description).to eq('A mind-bending thriller')
      expect(movie.year).to eq(2010)
      expect(movie.director).to eq('Christopher Nolan')
      expect(movie.locations).to include('Los Angeles')
      expect(movie.actors).to include('Leonardo DiCaprio')
      expect(movie.countries).to include('USA')
    end
  end
end
