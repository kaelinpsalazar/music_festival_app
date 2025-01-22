require 'rails_helper'

RSpec.describe Show, type: :model do
  it {should have_many(:schedule_shows)}
  it { should have_many(:schedules).through(:schedule_shows) }

  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:title) }
end