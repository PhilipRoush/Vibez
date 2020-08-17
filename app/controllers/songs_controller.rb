class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = find_by_id
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private
  def find_by_id
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_id, :genre_id, :release_date, :link)
  end

end
