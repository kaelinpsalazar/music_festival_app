class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_shows, dependent: :destroy
  has_many :shows, through: :schedule_shows

  validates :title, :date, :user_id, presence: true
end