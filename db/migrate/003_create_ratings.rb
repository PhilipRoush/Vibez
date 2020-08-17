class CreateRatings < ActiveRecord::Migration[5.2]
    def change
      create_table :ratings do |t|
        t.integer :song_id
        t.integer :user_id
        t.integer :rating 
        
      end
    end
  end