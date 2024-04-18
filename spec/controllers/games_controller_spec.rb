require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "POST #roll" do
    context "when game is completed" do
      it "returns a message saying game completed" do
        game = create(:game)
        post :roll, params: { user: game.user }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["message"]).to eq("Roll successful!")
      end
    end
    
    context "When strike in first chance of frame " do
      it "returns a message saying game completed" do
        game = create(:game)
        post :roll, params: { user: game.user, pins: 10 }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["message"]).to eq("Roll successful!")
      end
    end

    context "When spare in second chance of frame " do
      it "returns a message saying game completed" do
        game = create(:game)
        post :roll, params: { user: game.user, pins: 8 }
        post :roll, params: { user: game.user, pins: 2 }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)["message"]).to eq("Roll successful!")
      end
    end
  end
end