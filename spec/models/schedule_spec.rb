require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:schedule_shows) }
  it { should have_many(:shows).through(:schedule_shows) }
end