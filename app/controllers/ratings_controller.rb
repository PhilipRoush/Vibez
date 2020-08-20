class RatingsController < ApplicationController

  def index
    @ratings = Rating.all.select{ |rating| rating.user_id == @user.id}
  

  end

  def new
    if params[:song_id] && @song = Song.find_by_id(params[:song_id])   
      @rating = @song.rating.build 
    else
      @rating = Rating.new
    end
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to rating_path(@rating)
    else
      render :index
    end
  end

  def show
    @rating= find_by_id
  end

  private

  def find_by_id
    Song.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:user_id, :song_id, rating_attributes: [:title])
  end
  
  end