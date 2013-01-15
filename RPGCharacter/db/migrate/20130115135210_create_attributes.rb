class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.Integer :AttrID
      t.String :Name
      t.String :Type

      t.timestamps
    end
  end
end
