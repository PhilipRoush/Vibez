class Song < ApplicationRecord
   belongs_to :artist
   belongs_to :genre
   has_many :ratings
   has_many :users, through: :ratings
    
   validates :title, presence: true
   validates :artist_id, presence: true
   validates :genre_id, presence: true
   validates :release_date, presence: true
   validates :link, presence: true
   validates_date :release_date, :on_or_before => lambda { Date.current }
   validates :title, uniqueness: {scope: :artist_id}

   def artist_attributes=(artist)
      self.artist = Artist.find_or_create_by(name: artist[:name])
      self.artist.update(artist)
   end

   def genre_attributes=(genre)
      self.genre = Genre.find_or_create_by(name: genre[:name])
      self.genre.update(genre)
   end

end