class AddUserIdToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :schedules, :user, null: false, foreign_key: true
  end
end
