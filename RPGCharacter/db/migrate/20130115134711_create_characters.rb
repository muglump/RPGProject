class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters, {:primary_key => :charID} do |t|
      t.integer :charID
      t.string :name
      t.foreign_key :systemID

      t.timestamps
    end
  end
end
