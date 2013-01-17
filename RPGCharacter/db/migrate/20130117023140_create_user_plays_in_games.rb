class CreateUserPlaysInGames < ActiveRecord::Migration
  def change
    create_table :user_plays_in_games do |t|
      t.integer :userID
      t.integer :gameID
      t.integer :charID

      t.timestamps
    end
  end
end
