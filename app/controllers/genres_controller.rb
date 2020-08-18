class GenresController < ApplicationController

    def index
      @genres = Genre.all
    end

    def show
      @genre = find_by_id
    end

    private
    def find_by_id
      Genre.find(params[:id])
    end
  
  end