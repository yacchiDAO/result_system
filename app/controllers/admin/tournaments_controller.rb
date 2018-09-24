class Admin::TournamentsController < Admin::ApplicationController
  before_action :set_tournament, only: [:edit, :update, :destroy]

  def index
    @tournaments = Tournament.all
  end
  
  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to edit_admin_tournament_path(@tournament)
    else
      render :new
    end
  end

  def update
    if @tournament.save
      redirect_to edit_admin_tournament_path(@tournament)
    else
      render :new
    end
  end

  def destroy
    if @tournament.destroy
      redirect_to admin_tournaments_path, notice: '削除しました'
    else
      redirect_to edit_admin_tournaments_path(@tournament), error: '削除に失敗しました'
    end
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(:name, :place, :start_day, :end_day)
    end
end