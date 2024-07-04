require 'rails_helper'

RSpec.describe ReviewUtility, type: :service do
  describe '#create!' do
    let(:review_data) do
      {
        'Movie' => 'Inception',
        'User' => 'John Doe',
        'Stars' => 5,
        'Review' => 'Amazing movie!'
      }
    end

    subject { described_class.new(review_data) }

    context 'when the movie exists' do
      let!(:movie) { create(:movie, name: 'Inception') }

      it 'creates a review for the movie' do
        expect { subject.create! }.to change { movie.reviews.count }.by(1)
        review = movie.reviews.last
        expect(review.reviewer).to eq('John Doe')
        expect(review.stars).to eq(5)
        expect(review.review_text).to eq('Amazing movie!')
      end
    end
  end
end
