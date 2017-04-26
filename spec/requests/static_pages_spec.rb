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
end
