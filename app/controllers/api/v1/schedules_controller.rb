class Api::V1::SchedulesController < ApplicationController
  def index
    schedules = Schedule.all
    render json: ScheduleSerializer.format_schedules(schedules), status: :ok
  end

  def show
    user = User.find(params[:user_id])
    schedule = user.schedules.find(params[:id])

    render json: ScheduleSerializer.format_schedule_with_user_shows(schedule,user), status: :ok
  end

  def destroy
    user = User.find(params[:user_id])
    schedule = user.schedules.find_by(id: params[:schedule_id])
    if schedule.nil?
      render json: ErrorSerializer.format_errors('Schedule not found'), status: :not_found
      return
    end

    show = Show.find_by(id: params[:show_id])
    if show.nil?
      render json:ErrorSerializer.format_errors('Show not found'), status: :not_found
      return
    end

    schedule_show = schedule.schedule_shows.find_by(show_id: show.id)

    if schedule_show
      schedule_show.destroy
      schedule.reload
      render json: ErrorSerializer.format_errors("Show removed from schedule"), status: :ok
    else
      render json: ErrorSerializer.format_errors("Show not found in schedule"), status: :not_found
    end
  end
end