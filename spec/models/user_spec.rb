require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    subject do
      described_class.new(first_name: "test",last_name: "test", email: "TEST@TEST.com", password: "1234", password_confirmation: "1234")
    end
    it "user model is valid" do
      expect(subject).to be_valid
    end
    it "password and password_confirmation must be equal" do
      subject.password_confirmation = 647
      expect(subject).to be_invalid
    end
    it "email must be unique and case insensitive " do
      subject.save
      subject2 = User.new(first_name: "test2",last_name:"Lee", email: "test@test.COM", password: "3456", password_confirmation: "3456")
      expect(subject).to be_valid
      expect(subject2).to be_invalid
    end
    it "first_name is required" do
      subject.first_name = nil
      expect(subject).to be_invalid
    end
    it "email is required" do
      subject.email = nil
      expect(subject).to be_invalid
    end
    it "password is required" do
      subject.password = nil
      expect(subject).to be_invalid
    end
    it "password_confirmation is required" do
      subject.password_confirmation = nil
      expect(subject).to be_invalid
    end
    it "password length must be greater than 4" do
      subject.password = "3"
      expect(subject).to be_invalid
    end 
    it "password_confiramtion length must be greater than 4" do
      subject.password_confirmation = "3"
      expect(subject).to be_invalid
    end 
  end
  describe '.authenticate_with_credentials' do
    it "returns nil if user doesnot exist" do
      expect(User.authenticate_with_credentials("test@test.COM", "3456")).to eq(nil)
    end
    it "returns user if user exists and the password is correct" do
      @user = User.create(first_name: "test",last_name: "Lee", email: "test@test.com", password: "3456", password_confirmation: "3456")
      expect(User.authenticate_with_credentials("test@test.COM", "3456")).to eq(@user)
    end
    it "returns nil if user password is incorrect" do
      @user = User.create(first_name: "test",last_name: "Lee", email: "test@test.com", password: "3456", password_confirmation: "3456")
      expect(User.authenticate_with_credentials("test@test.COM", "12345")).to eq(nil)
    end
    it "return user even if there are trailing or leading spaces around the email" do
      @user = User.create(first_name: "test",last_name: "Lee", email: "example@domain.com", password: "12345", password_confirmation: "12345")
      expect(User.authenticate_with_credentials(" example@domain.com ", "12345")).to eq(@user)
    end
    it "return user even if email is in the wrong case" do
      @user = User.create(first_name: "test",last_name: "Lee", email: "example@domain.com", password: "12345", password_confirmation: "12345")
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "12345")).to eq(@user)
    end
  end
end
