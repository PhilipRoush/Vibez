class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = find_by_id
  end

  def new
    @artist = Artist.new
    @genre = Genre.new
    @song = Song.new(artist: @artist, genre: @genre)
  end

  def create
    if params[:song][:artist_attributes][:name] == ""
      params[:song].delete :artist_attributes
    end
    if params[:song][:genre_attributes][:name] == ""
      params[:song].delete :genre_attributes
    end
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
    params.require(:song).permit(:title, :artist_id, :genre_id, :release_date, :link, artist_attributes: [:name], genre_attributes: [:name])
  end

end