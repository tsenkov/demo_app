require 'rails_helper'

RSpec.describe "Home page", type: :request do
  it "should have the content 'Sample App'" do
    visit '/static pages/home'
    page.should have content('Sample App')
  end
end
