FactoryBot.define do
  factory :schedule do
    title { "Sample Schedule" }
    date { 1.week.from_now.to_date }
    user
  end
end