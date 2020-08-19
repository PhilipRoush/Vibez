#artists

10.times do
    Artist.create(name: Faker::Music.unique.band)
end

10.times do
    Genre.create(name: Faker::Music.unique.genre)
end

30.times do
    Song.create(title: Faker::Music.unique.album, artist_id: rand(1..10), genre_id: rand(1..10), release_date: Faker::Date.backward, link: Faker::Internet.url)
end

10.times do
    User.create(username: Faker::Internet.unique.username, password_digest: Faker::Internet.password)
end

50.times do
    Rating.create(song_id: rand(1..30), user_id: rand(1..10), rating: rand(1..5))
end