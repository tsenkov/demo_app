# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new(name: "Example User", email: "user@example.com") }
  subject { @user }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }

  it { is_expected.to be_valid}

  describe "when name is not present" do
    before { @user.name = " " }
    it { is_expected.to_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { is_expected.to_not be_valid }
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org
        frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user at foo.org example.user@foo.
        foo@bar baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end
  end
end
