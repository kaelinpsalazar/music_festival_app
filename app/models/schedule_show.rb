class ScheduleShow < ApplicationRecord
  belongs_to :schedule
  belongs_to :show

  validates :schedule_id, :show_id, presence: true
end
