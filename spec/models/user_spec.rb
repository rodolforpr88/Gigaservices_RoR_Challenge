require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user, :with_avatar) }
  let(:invalid_user) { User.new }

  describe "validations" do
    context "should return valid" do
      it { expect(user).to be_valid }
    end

    context "presence" do
      it "should return error message" do
        expect(invalid_user).to be_invalid
        expect(invalid_user.errors.count).to be 7
        expect(invalid_user.errors.full_messages).to eq [
                                                          "Gender can't be blank",
                                                          "Title can't be blank",
                                                          "First name can't be blank",
                                                          "Last name can't be blank",
                                                          "Email can't be blank",
                                                          "Avatar can't be blank",
                                                          "Email is invalid"
                                                        ]
      end
    end

    context "email format" do
      before do
        user.email = "invalid_format"
        user.valid?
      end

      it "should return invalid format for email" do
        expect(user).to be_invalid
        expect(user.errors.count).to eq 1
        expect(user.errors.full_messages).to eq ["Email is invalid"]
      end
    end
  end

  context "#full_name" do
    it "should return the full name with the title" do
      expect(user.full_name).to eq "#{user.title} #{user.first_name} #{user.last_name}".titleize
    end
  end
end
