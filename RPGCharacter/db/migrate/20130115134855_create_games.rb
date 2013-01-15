class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.Integer :GameID
      t.Integer :SystemID

      t.timestamps
    end
  end
end
