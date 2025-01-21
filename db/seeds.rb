# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create shows
# db/seeds.rb

# Create users
user_1 = User.create(first_name: 'Alice', last_name: 'Johnson', email: 'alice@example.com')
user_2 = User.create(first_name: 'Bob', last_name: 'Smith', email: 'bob@example.com')
user_3 = User.create(first_name: 'Charlie', last_name: 'Brown', email: 'charlie@example.com')

# Create shows
show_1 = Show.create(artist: 'The Rolling Stones', location: 'Main Stage', date: '2025-07-10', time: '18:00:00')
show_2 = Show.create(artist: 'Lady Gaga', location: 'Main Stage', date: '2025-07-10', time: '20:00:00')
show_3 = Show.create(artist: 'Tame Impala', location: 'Side Stage', date: '2025-07-11', time: '17:00:00')
show_4 = Show.create(artist: 'Kendrick Lamar', location: 'Main Stage', date: '2025-07-11', time: '19:00:00')
show_5 = Show.create(artist: 'Billie Eilish', location: 'Side Stage', date: '2025-07-12', time: '16:00:00')
show_6 = Show.create(artist: 'Post Malone', location: 'Main Stage', date: '2025-07-12', time: '18:00:00')

# Create schedules
schedule_1 = Schedule.create(title: 'Weekend 1 Itinerary', date: '2025-07-10', user: user_1)
schedule_2 = Schedule.create(title: 'Weekend 2 Itinerary', date: '2025-07-11', user: user_2)
schedule_3 = Schedule.create(title: 'Family Friendly', date: '2025-07-12', user: user_3)

# Assign shows to schedules
schedule_1.shows << [show_1, show_2, show_3]
schedule_2.shows << [show_4, show_5]
schedule_3.shows << [show_2, show_5, show_6]

# Create additional associations in schedule_shows table (via ActiveRecord associations)
# schedule_1.save!
# schedule_2.save!
# schedule_3.save!
