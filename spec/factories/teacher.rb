FactoryBot.define do

  factory :teacher do
    name Faker::Name.unique.name
    education [:bachelors, :masters].sample
  end
end
