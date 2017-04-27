require 'rails_helper'
require 'helpers/utilities'

RSpec.describe "User Pages" do
  subject { page }

  describe "Signup page" do
    before { visit signup_path }

    it { is_expected.to have_title full_title('Signup') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { is_expected.to have_selector('h1', text: user.name) }
    it { is_expected.to have_title(full_title(user.name)) }
  end
end
