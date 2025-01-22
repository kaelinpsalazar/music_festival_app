require 'rails_helper'

RSpec.describe "Api::V1::Schedules", type: :request do
  describe "GET /api/v1/schedules" do
    let!(:schedules) {create_list(:schedule, 5)}
    it 'returns all schedules' do
      get "/api/v1/schedules"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json.length).to eq(5)
      expect(json.first[:title]).to eq(schedules.first.title)
      expect(json.first[:date]).to eq(schedules.first.date.to_s)
    end
  end
  describe "GET"  do
    let!(:user) { create(:user) }
    let!(:schedule) { create(:schedule, user: user) }
    let!(:show) { create(:show) }
    let!(:schedule_show) { create(:schedule_show, schedule: schedule, show: show) }
  
    it 'returns the schedule with associated shows and users' do
      get "/api/v1/users/#{user.id}/schedules/#{schedule.id}"
  
      expect(response).to have_http_status(:ok)
  
      json_response = JSON.parse(response.body, symbolize_names: true)
  
      expect(json_response[:schedule][:id]).to eq(schedule.id)
      expect(json_response[:schedule][:title]).to eq(schedule.title)
      expect(json_response[:schedule][:date]).to eq(schedule.date.to_s)
  
      expect(json_response[:shows].length).to eq(1)
      expect(json_response[:shows].first[:artist]).to eq(show.artist)
  
      expect(json_response[:user][:id]).to eq(user.id)
      expect(json_response[:user][:first_name]).to eq(user.first_name)
    end

  end

  describe 'DELETE ' do
    let!(:user) { create(:user) }
    let!(:schedule) { create(:schedule, user: user) }
    let!(:show) { create(:show) }
    let!(:schedule_show) { create(:schedule_show, schedule: schedule, show: show) }

    context 'when the show is associated with the schedule' do
      it 'removes the show from the schedule' do
        expect(schedule.shows).to include(show)
  
        delete "/api/v1/users/#{user.id}/schedules/#{schedule.id}/shows/#{show.id}"
  
        schedule.reload
  
        expect(schedule.shows).not_to include(show)
  
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Show removed from schedule')
  
        expect(ScheduleShow.find_by(schedule_id: schedule.id, show_id: show.id)).to be_nil
      end
    end
  end
end

