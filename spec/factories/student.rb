FactoryBot.define do

  factory :student do
    name Faker::Name.unique.name
    sequence(:roll_number, 100)
    house [:red, :green, :blue, :yellow].sample
  end
end
