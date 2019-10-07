class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    # Vritually instant
    # Quartz[:functions].call('LoopNSum', 'Num' => 300000000)

    # Around 2 seconds
    # Quartz[:functions].call('LoopNString', 'Num' => 100000)

    # Around 20 seconds
    # loop_n_sum(300000000)

    # Around 16 seconds
    # loop_n_string(100000)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    def loop_n_sum(n)
      sum = 0

      n.times do |i|
        sum += i
      end

      sum
    end

    def loop_n_string(n)
      str = ""

      n.times do |i|
        str += i.to_s
      end

      str
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {})
    end
end
