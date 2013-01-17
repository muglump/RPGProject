class CreateCharacterAttributes < ActiveRecord::Migration
  def change
    create_table :character_attributes do |t|
      t.integer :charID
      t.integer :attrID
      t.integer :value

      t.timestamps
    end
  end
end
