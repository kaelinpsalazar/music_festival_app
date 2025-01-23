class AddImageToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :image_url, :string
  end
end
