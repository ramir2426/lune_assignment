require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe '.by_actor' do
    before do
      @movie1 = Movie.create(
        name: "Movie One",
        year: 2000,
        director: ["Dominic Sena"],
        locations: ["Lahore", "Berlin"],
        actors: ["Nicolas Cage", "Leonardo DiCaprio"],
        countries: ["US", "UK"]
      )
      @movie2 = Movie.create(
        name: "Movie Two",
        year: 2001,
        director: ["Steven Spielberg"],
        locations: ["New York"],
        actors: ["Tom Hanks", "Will Smith"],
        countries: ["US", "UK"]
      )
      @movie3 = Movie.create(
        name: "Movie Three",
        year: 2002,
        director: ["Michael Bay"],
        locations: ["San Francisco"],
        actors: ["Nicolas Cage", "Tom Cruise"],
        countries: ["US", "UK"]
      )
      @movie4 = Movie.create(
        name: "Movie Four",
        year: 2003,
        director: ["Christopher Nolan"],
        locations: ["Chicago"],
        actors: ["Nicolas", "John Doe"],
        countries: ["US", "UK"]
      )
    end

    it 'returns movies where the actors array contains the given name' do
      results = Movie.by_actor('Nicolas')
      expect(results).to include(@movie1, @movie3, @movie4)
      expect(results).not_to include(@movie2)
    end

    it 'is case sensitive' do
      results = Movie.by_actor('nicolas')
      expect(results).to be_empty
    end

    it 'returns partial matches' do
      results = Movie.by_actor('Nic')
      expect(results).to include(@movie1, @movie3, @movie4)
      expect(results).not_to include(@movie2)
    end

    it 'handles empty results' do
      results = Movie.by_actor('Nonexistent Actor')
      expect(results).to be_empty
    end
  end

  describe ".avg_stars_desc_order" do
    let!(:movie1) { create(:movie, name: "Movie 1") }
    let!(:movie2) { create(:movie, name: "Movie 2") }
    
    before do
      create(:review, movie: movie1, stars: 4)
      create(:review, movie: movie1, stars: 5)
      create(:review, movie: movie2, stars: 3)
    end
    
    it "returns movies sorted by average stars in descending order" do
      sorted_movies = Movie.avg_stars_desc_order
      expect(sorted_movies).to eq([movie1, movie2])
    end
  end

end