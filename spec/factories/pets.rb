FactoryBot.define do
  factory :pet do
    name { FFaker::Lorem.word }
    person { create(:person) }
    recomendation { FFaker::Lorem.word }
  end
end
