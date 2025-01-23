class AddImagesToShows < ActiveRecord::Migration[7.1]
  def change
    add_column :shows, :image_url, :string
    add_column :shows, :artist_image_url, :string
  end
end
