FactoryBot.define do
  factory :blog do
    title { "Homo Deus" }
    subtitle { "A Brief History of Tomorrow" }
    sequence(:body) { |n| "Body-#{n}" }

    trait :steven_pinker do
      title { "Enlightenment Now" } 
      subtitle { "The Case for Reason, Science, Humanism" }
      body { "blah blah" }
    end

    factory :pinker_blog, traits: [:steven_pinker]
  end
end
