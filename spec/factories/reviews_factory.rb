FactoryBot.define do
  factory :review do
    reviewer { Faker::Name.name }
    stars { Faker::Number.between(from: 1, to: 5) }
    review_text { Faker::Quote.famous_last_words }
    movie
  end
end