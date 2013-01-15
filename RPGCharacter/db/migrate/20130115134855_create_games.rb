class CreateGames < ActiveRecord::Migration
  def change
    create_table :games, {:primary_key => :gameID} do |t|
      t.integer :gameID, :null => false, :default => ""
      t.foreign_key :systemID

      t.timestamps
    end
  end
end
