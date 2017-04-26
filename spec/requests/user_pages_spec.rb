require 'rails_helper'
require 'helpers/utilities'

RSpec.describe "User Pages" do
  subject { page }

  describe "Signup page" do
    before { visit signup_path }

    it { is_expected.to have_title full_title('Signup') }
  end
end
