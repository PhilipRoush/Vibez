class RatingsController < ApplicationController


  def new
    @rating = Rating.new(song_id: params[:id])
    @errors = flash[:errors]
  end

  def create
    @user = session[:user_id]
    binding.pry
    @rating = Rating.new(rating_params)
    @rating.user_id = @user
    @song = Song.find(@rating.song_id)
    
    if @rating.valid?
       
      @rating.save
      redirect_to song_path(@song)
      
    else
      flash[:errors] = @rating.errors.full_messages
      redirect_to new_rating_path
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
    params.require(:rating).permit(:user_id, :song_id, :rating)
  end
  
  end