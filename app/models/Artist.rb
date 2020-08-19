class Artist < ApplicationRecord
   has_many :songs
   has_many :genres, through: :songs
   has_many :ratings, through: :songs
   has_many :users, through: :songs

   validates :name, presence: true
    
   #returns a list of genres with no duplicates
   def unique_genres
      self.genres.uniq
   end

   #returns a count of songs by the artist in a specific genre
   def songs_per_genre(genre)
      Song.where(artist: self, genre: genre).count
   end

   #sorts genres from most songs by this artist to least
   def sort_genres
      self.unique_genres.sort_by do |genre| 
         self.songs_per_genre(genre)
      end.reverse
   end

   #average rating of all songs by this artist
   def average_rating
      rating_sum = 0
      self.ratings.each do |rating|
         rating_sum += rating.rating
      end
      if self.ratings.count == 0
         nil
      else
         avg = rating_sum.to_f/self.ratings.count.to_f
         avg.round(2)
      end
   end

   #returns a list of songs that have ratings
   def rated_songs
      self.songs.reject do |song|
         song.average_rating == nil
      end
   end
   
   #sorts songs from highest average rating to lowest (unrated songs aren't included)
   def highest_rated_songs
      self.rated_songs.sort_by do |song| 
         song.average_rating
      end.reverse
   end
end