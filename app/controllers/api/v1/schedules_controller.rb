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
      id: schedule.user.id,
      first_name: schedule.user.first_name,
      last_name: schedule.user.last_name
    }
  }, status: :ok
    end
end
