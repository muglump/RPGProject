class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes, {:primary_key => :attrID} do |t|
      t.integer :attrID
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
