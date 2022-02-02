class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
    def index
        users = User.all
        render json: users
      end

  def create
    user = User.create(user_params)
   if user.valid?
    token = encode_token({user_id: user.id})
       render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else
       render json: {error: "Could not create user!"}, status: :unprocessable_entity
    end
  end

  def profile
  render json: @user
  end

  private

  def user_params
    # params.require(:user).permit(:username, :password, :email)
    params.require(:user).permit(:username, :password, :email, :bankroll, :games_played, :current_shoe_hand, :perfect_strategy_correct, :count_correct, :bet_spread_correct)
  end


  end
