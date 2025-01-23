user_1 = User.create(first_name: 'Alice', last_name: 'Johnson', email: 'alice@example.com')
user_2 = User.create(first_name: 'Bob', last_name: 'Smith', email: 'bob@example.com')
user_3 = User.create(first_name: 'Charlie', last_name: 'Brown', email: 'charlie@example.com')

# Create shows with images
show_1 = Show.create(
  artist: 'The Rolling Stones',
  location: 'Main Stage',
  date: '2025-07-10',
  time: '2025-07-10T18:00:00',  
  image_url: '/images/Rolling_stones_logo.jpeg',
  artist_image_url: '/images/Rolling-Stones-band.webp'
)

show_2 = Show.create(
  artist: 'Lady Gaga',
  location: 'Main Stage',
  date: '2025-07-10',
  time: '2025-07-10T20:00:00',  
  image_url: '/images/lady_gaga_image.jpg',
  artist_image_url: '/images/Lady_gaga_logo.webp'
)

show_3 = Show.create(
  artist: 'Tame Impala',
  location: 'Side Stage',
  date: '2025-07-11',
  time: '2025-07-11T17:00:00',  
  image_url: '/images/tame_impala_band.jpeg',
  artist_image_url: '/images/tame_impala_logo.webp'
)

show_4 = Show.create(
  artist: 'Kendrick Lamar',
  location: 'Main Stage',
  date: '2025-07-11',
  time: '2025-07-11T19:00:00', 
  image_url: '/images/kendrick_image.jpeg',
  artist_image_url: '/images/kendrick-lamar.webp'
)

show_5 = Show.create(
  artist: 'Billie Eilish',
  location: 'Side Stage',
  date: '2025-07-12',
  time: '2025-07-12T16:00:00', 
  image_url: '/images/billie_show.jpeg',
  artist_image_url: 'https://example.com/artists/billie_eilish.jpg'
)

show_6 = Show.create(
  artist: 'Post Malone',
  location: 'Main Stage',
  date: '2025-07-12',
  time: '2025-07-12T18:00:00',  
  image_url: '/images/post-malone-2019.avif',
  artist_image_url: '/images/post_logo.jpeg'
)


schedule_1 = Schedule.create(
  title: 'Louder Than Life: Day 1',
  date: '2025-07-10',
  user: user_1,
  image_url:'public/images/istockphoto-1291592209-612x612.jpg' 
)

schedule_2 = Schedule.create(
  title: 'Louder Than Life: Day 2',
  date: '2025-07-11',
  user: user_2,
  image_url: 'public/images/download.jpeg'
)

schedule_3 = Schedule.create(
  title: 'Louder Than Life: Day 2',
  date: '2025-07-12',
  user: user_3,
  image_url: '/images/family-friendly.webp'
)

schedule_1.shows << [show_1, show_2, show_3]
schedule_2.shows << [show_4, show_5, show_1]
schedule_3.shows << [show_2, show_5, show_6]