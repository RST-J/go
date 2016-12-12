class GamesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @game.user = current_user
    if @game.save 
      redirect_to @game
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:board_size, :name)
  end

end
