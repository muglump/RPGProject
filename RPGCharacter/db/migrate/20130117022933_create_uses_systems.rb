class CreateUsesSystems < ActiveRecord::Migration
  def change
    create_table :uses_systems do |t|
      t.integer :userID
      t.integer :systemId

      t.timestamps
    end
  end
end
