class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.Integer :CharID
      t.String :Name
      t.Integer :SystemID

      t.timestamps
    end
  end
end
