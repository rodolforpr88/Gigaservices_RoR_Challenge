require "rails_helper"
require "faker"

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user, :with_avatar) }
  let(:new_attributes) { { first_name: "Jane Doe" } }
  let(:valid_attributes) do
    {
      gender: Faker::Number.between(from: 0, to: 2),
      title: Faker::Number.between(from: 0, to: 3),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      avatar: { io: File.open(Rails.root.join("spec", "fixtures", "files", "model.png")), filename: "model.png" }
    }
  end

  let(:invalid_attributes) { { gender: nil, first_name: nil, last_name: nil, email: nil, avatar: nil } }

  describe "GET /index" do
    before { get :index }

    it { expect(response).to render_template(:index) }
    it { expect(response).to be_successful }
    it { expect(assigns(:users)).to include user }
  end

  describe "GET /edit" do
    context "should assigns the user" do
      before { get :edit, params: { id: user } }

      it { expect(response).to render_template(:edit) }
      it { expect(response).to be_successful }
      it { expect(assigns(:user)).to eq user }
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:old_first_name) { user.first_name }

      before { patch :update, params: { id: user, user: new_attributes } }

      it "should assigns the user" do
        expect(assigns(:user)).to eq user
      end

      it "updates the requested user" do
        expect { user.reload }.to change { user.first_name }.from(old_first_name).to("Jane Doe")
      end

      it "redirects to the user" do
        expect(user.reload).to redirect_to(user_url(user))
      end

      it "returns a notice message" do
        expect(flash[:notice]).to eq "User was successfully updated."
      end
    end

    context "with invalid parameters" do
      before { patch :update, params: { id: user, user: { first_name: nil } } }

      it "display the 'edit' template" do
        expect(response).not_to be_successful
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect { delete :destroy, params: { id: user } }.to change(User, :count).by(-1)
    end

    it "returns the successfull message" do
      delete :destroy, params: { id: user }
      expect(flash[:notice]).to eq "User was successfully destroyed."
    end

    it "redirects to the users list" do
      delete :destroy, params: { id: user }
      expect(response).to redirect_to(users_url)
    end
  end

  describe "GET /search" do
    context "should assigns the user" do
      before { get :search, params: { query: "#{user.first_name.first}" } }

      it { expect(response).to render_template(:search) }
      it { expect(response).to be_successful }
      it { expect(assigns(:users)).to eq [user] }
      it { expect(flash[:notice]).to eq "1 User(s) found" }
    end

    context "should return empty users" do
      before { get :search, params: { query: "not_valid_query" } }

      it { expect(response).to redirect_to root_path }
      it { expect(response).not_to be_successful }
      it { expect(assigns(:users)).to eq [] }
      it { expect(flash[:alert]).to eq "Nothing found for 'not_valid_query'." }
    end
  end
end
