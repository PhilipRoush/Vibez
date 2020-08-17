class ArtistController < ApplicationController

    def index
      @artists = Artist.all
    end
  
  end