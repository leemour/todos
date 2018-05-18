require 'rails_helper'

RSpec.describe "TodoItems", type: :request do
  describe "GET /todo_items" do
    it "works! (now write some real specs)" do
      get todo_items_path
      expect(response).to have_http_status(200)
    end
  end
end
