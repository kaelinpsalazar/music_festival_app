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
end
