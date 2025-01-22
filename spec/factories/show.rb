FactoryBot.define do
  factory :show do
    artist { "Artist Name" }
    location { "City Venue" }
    date { Date.today }
    time { Time.now }
  end
end