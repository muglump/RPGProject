class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.Integer, :UserID
      t.String, :Name
      t.String :Hash

      t.timestamps
    end
  end
end
