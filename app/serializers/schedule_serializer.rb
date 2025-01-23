class ScheduleSerializer
  def self.format_schedules(schedules)
    schedules.map do |schedule|
      {
        id: schedule.id,
        title: schedule.title,
        date: schedule.date,
        created_at: schedule.created_at,
        updated_at: schedule.updated_at
      }
    end
  end

  def self.format_schedule_with_user_shows(schedule, user)
    {
      schedule: {
        id: schedule.id,
        title: schedule.title,
        date: schedule.date,
        created_at: schedule.created_at,
        updated_at: schedule.updated_at
      },
      shows: schedule.shows.map do |show|
        {
          id: show.id,
          artist: show.artist,
          date: show.date,
          time: show.time,
          image_url: show.image_url,           
          artist_image_url: show.artist_image_url 
        }
      end,
      user: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name
      }
    }
  end
end
