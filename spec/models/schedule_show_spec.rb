require 'rails_helper'

RSpec.describe ScheduleShow, type: :model do
  it { should belong_to(:schedule) }
  it { should belong_to(:show) }
end