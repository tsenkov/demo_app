require 'rails_helper'
require 'helpers/utilities'

RSpec.describe "StaticPages" do
  subject { page }

  describe "Home Page" do
    before { visit home_path }
    it { is_expected.to have_title full_title('')}
  end


  describe "Help Page" do
    before { visit help_path }
    it { is_expected.to have_title full_title('Help') }
  end

  describe "About Page" do
    before { visit about_path }
    it { is_expected.to have_title full_title('About') }
  end


  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
