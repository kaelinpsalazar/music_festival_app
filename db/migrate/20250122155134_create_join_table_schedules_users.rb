class CreateJoinTableSchedulesUsers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :schedules, :users do |t|
      t.index :schedule_id
      t.index :user_id
    end
  end
end
