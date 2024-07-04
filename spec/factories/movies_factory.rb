FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    year { Faker::Number.between(from: 2012, to: 2023) }
    director { [Faker::Name.name] }
    locations { [Faker::Address.city, Faker::Address.city] }
    actors { [Faker::Name.name, Faker::Name.name, Faker::Name.name] }
    countries { [Faker::Address.country, Faker::Address.country] }
  end
end
