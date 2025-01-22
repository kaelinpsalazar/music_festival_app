FactoryBot.define do
  factory :schedule do
    title { "Sample Schedule" }
    date { Date.today }
    user
  end
end