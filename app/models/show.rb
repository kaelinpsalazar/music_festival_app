class Show < ApplicationRecord
  has_many :schedule_shows, dependent: :destroy
  has_many :schedules, through: :schedule_shows

  validates :artist, :location, :date, :time, presence: true 
end