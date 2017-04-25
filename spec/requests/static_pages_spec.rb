require 'rails_helper'


RSpec.describe "StaticPages" do
  let(:base_title) {'Sample App Title'}

  describe "Home Page" do
    it "Check title having base and not having |" do
      get '/static_pages/home'
      expect(response).to have_http_status(200)

      visit '/static_pages/home'

      expect(page).to have_title "#{base_title}"
      expect(page).not_to have_title "|"
    end

    describe "Help Page" do
      it "Should have content help" do

        get '/static_pages/help'
        expect(response).to have_http_status(200)
        visit '/static_pages/help'
        expect(page).to have_title "#{base_title}"
        expect(page).to have_title "| Help"
      end
    end

    describe "About Page" do
      it "Should have content about" do
        get '/static_pages/about'
        expect(response).to have_http_status(200)
        visit '/static_pages/about'
        expect(page).to have_title "#{base_title}"
        expect(page).to have_title "| About"
      end
    end
  end
end
