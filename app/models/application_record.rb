class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #for Artist and User: returns a unique array of genres that belong to this instance
  def unique_genres
    self.genres.uniq
  end

  #for Genre and User: returns a unique array of artists that belong to this instance
  def unique_artists
    self.artists.uniq
  end

  #for User and Artist: sorts genres from most songs belonging to this instance to least
  def sort_genres
    self.unique_genres.sort_by do |genre| 
      self.songs_per_genre(genre)
    end.reverse
  end

  #for User and Artist: returns a list of songs that have ratings
  def rated_songs
    self.songs.reject do |song|
      song.ratings.empty?
    end
  end

  #takes in an array of numbers and returns the average, rounded to the second decimal place
  def average(array)
    sum = 0
    array.each do |i|
      sum += i
    end
    avg = sum.to_f/array.count.to_f
    avg.round(2)
  end


  #for Artist and Song (could technically work for User too but idk why we would use that): returns the average rating provided it has been rated
  def average_rating
    ratings_array = self.ratings.map do |rating|
      rating.rating
    end
    if self.ratings.count == 0
      nil
    else
      average(ratings_array)
    end
 end
end
