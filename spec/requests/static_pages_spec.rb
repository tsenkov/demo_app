require 'rails_helper'


RSpec.describe "StaticPages" do
  let(:base_title) {'Sample App Title'}
  subject { page }

  describe "Home Page" do
    before { visit home_path }
    it { is_expected.to have_title "#{base_title}"}
    it { is_expected.not_to have_title "|"}
  end


  describe "Help Page" do
    before { visit help_path }
    it { is_expected.to have_title "#{base_title}" }
    it { is_expected.to have_title "| Help" }
  end

  describe "About Page" do
    before { visit about_path }
    it { is_expected.to have_title "#{base_title}" }
    it { is_expected.to have_title "| About" }
  end
end
