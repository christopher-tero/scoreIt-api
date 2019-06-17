class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :update, :destroy]

  # GET /tournaments
  def index
    @tournaments = Tournament.all

    render json: @tournaments
  end

  # GET /tournaments/1
  def show
    render json: @tournament
  end

  # POST /tournaments
  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      render json: @tournament, status: :created, location: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    if @tournament.update(tournament_params)
      render json: @tournament
    else
      render json: @tournament.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tournaments/1
  def destroy
    @tournament.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tournament_params
      params.require(:tournament).permit(:name, :active, :wins, :losses)
    end
end
