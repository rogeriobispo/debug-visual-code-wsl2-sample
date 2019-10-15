FactoryBot.define do
  factory :price do
        
    trait :duration30 do  
      duration { "30" }
      unitary_price { "25.0" }
      aditional_price { "15.0" }
    end

    trait :duration60 do  
      duration { "60" }
      unitary_price { "35.0" }
      aditional_price { "20.0" }
    end
  end
end
