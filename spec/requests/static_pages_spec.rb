require 'rails_helper'


describe "StaticPages" do
  describe "Home Page" do
    it "works! (now write some real specs)" do
      get '/static_pages/home'
      expect(response).to have_http_status(200)

    end

    describe "Help Page" do
      it "Should have content help" do

        get '/static_pages/help'
        expect(response).to have_http_status(200)
      end
    end

    describe "About Page" do
      it "Should have content about" do
        get '/static_pages/about'
        expect(response).to have_http_status(200)
                
      end
    end
  end
end
