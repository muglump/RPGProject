class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :userID
      t.integer :charID
      t.integer :PermissionStatus

      t.timestamps
    end
  end
end
