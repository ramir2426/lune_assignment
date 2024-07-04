require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:reviewer) }
    it { should validate_numericality_of(:stars).only_integer }
    it { should validate_numericality_of(:stars).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:stars).is_less_than_or_equal_to(5) }
  end

  describe 'associations' do
    it { should belong_to(:movie).required(true) }
  end
end