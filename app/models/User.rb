class User < ApplicationRecord
   has_many :ratings
   has_many :songs, through: :ratings
   has_many :artists, through: :songs
   has_many :genres, through: :songs
   
   validates :username, uniqueness: true, presence: true
    has_secure_password

    def unique_artists
        self.artists.uniq
    end

    def unique_genres
        self.genres.uniq
    end

    def songs_per_genre(genre)
        song_count = 0
        self.songs each do |song|
            if song.genre == genre
                song_count += 1
            end
        end
        song_count
    end

    def song_rating(song)
        Rating.find_by(user: self, song: song)
    end

    def artist_rating(artist)
        user_ratings = artist.songs.map do |song|
            song_rating(song)
        end
        user_ratings.delete(nil)
        ratings_sum = 0
        user_ratings.each do |rating|
            ratings_sum += rating.rating
        end
        ratings_sum.to_f/user_ratings.count.to_f
    end
end