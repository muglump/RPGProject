class CreateGames < ActiveRecord::Migration
  def change
    create_table :games, {:primary_key => :GameID} do |t|
      t.Integer :GameID, :null => false, :default => ""
      t.Integer :SystemID, :null => false, :default =>""

      t.timestamps
    end
  end
end
