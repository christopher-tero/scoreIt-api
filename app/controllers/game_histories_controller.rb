class GameHistoriesController < ApplicationController
  before_action :set_game_history, only: [:show, :update, :destroy]

  # GET /game_histories
  def index
    @game_histories = GameHistory.all

    render json: @game_histories
  end

  # GET /game_histories/1
  def show
    render json: @game_history
  end

  # POST /game_histories
  def create
    @game_history = GameHistory.new(game_history_params)

    if @game_history.save
      render json: @game_history, status: :created, location: @game_history
    else
      render json: @game_history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /game_histories/1
  def update
    if @game_history.update(game_history_params)
      render json: @game_history
    else
      render json: @game_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /game_histories/1
  def destroy
    @game_history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_history
      @game_history = GameHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_history_params
      params.require(:game_history).permit(:player_one, :player_two, :p_one_score, :p_two_score)
    end
end
