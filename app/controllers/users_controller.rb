class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_query, only: %i[search]

  def index
    @pagy, @users = pagy(User.order(:first_name))
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_users
    User.destroy_all

    if CreateUsersJob.perform_later
      respond_to do |format|
        format.html { redirect_to users_path, notice: "List of users is creating, please wait few seconds and refresh the page." }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path, status: :unprocessable_entidy, alert: "Something got wrong, please try again." }
      end
    end
  end

  def search; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:gender, :title, :first_name, :last_name, :email, :avatar)
  end

  def set_query
    @pagy, @users =
      pagy(User.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%"))
  end
end
