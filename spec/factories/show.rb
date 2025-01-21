FactoryBot.define do
  factory :show do
    artist { "Artist Name" }
    location { "City Venue" }
    date { Faker::Date.forward(days: 30) }
    time { Faker::Time.forward(days: 1, period: :evening) }
  end
end