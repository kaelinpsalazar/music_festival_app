class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all
    render json: schedules, status: :ok
  end

  def show
    user = User.find(params[:user_id])
    schedule = user.schedules.find(params[:id])

    render json: {
      schedule: schedule,
      shows: schedule.shows,
      user: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name
      }
    }, status: :ok
  end

  def destroy
    user = User.find(params[:user_id])
    schedule = user.schedules.find(params[:schedule_id])
    show = Show.find(params[:show_id])
  
    schedule_show = schedule.schedule_shows.find_by(show_id: show.id)
  
    if schedule_show
      Rails.logger.info "Destroying ScheduleShow: #{schedule_show.id}"
      schedule_show.destroy
  
      # Ensure the show is removed from the schedule's shows association
      schedule.reload
  
      render json: { message: "Show removed from schedule" }, status: :ok
    else
      Rails.logger.error "ScheduleShow not found for schedule_id: #{schedule.id}, show_id: #{show.id}"
      render json: { error: "Show not found in schedule" }, status: :not_found
    end
  end
end