# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new(name: "Example User",
                            email: "user@example.com",
                            password: "foobar",
                            password_confirmation: "foobar") }
  subject { @user }

  #Validate user
  it { is_expected.to be_valid}

  # Verify the methods are there
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }
  it { is_expected.to respond_to(:authenticate) }

  #Password validations
  describe "when password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { is_expected.to_not be_valid }
  end
  describe "return value of authentication method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { is_expected.to eq(found_user.authenticate(@user.password)) }
    end

    describe "user with invalid password" do
      let(:user_with_invalid_password) { found_user.authenticate("invalidPassword") }
      it { is_expected.to_not eq(user_with_invalid_password) }
      specify { expect(user_with_invalid_password).to be false }
    end
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { is_expected.to_not be_valid }
  end

  describe "when password & confirmation mismatch" do
    before { @user.password_confirmation = "mismatch" }
    it { is_expected.to_not be_valid }
  end

  describe "when password_confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { is_expected.to_not be_valid }
  end

  #name validations
  describe "when name is not present" do
    before { @user.name = " " }
    it { is_expected.to_not be_valid }
  end
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { is_expected.to_not be_valid }
  end

  #email validations
  describe "when email is not present" do
    before { @user.email = " " }
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

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { is_expected.to_not be_valid }
  end
end
