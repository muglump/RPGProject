class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.Integer :userID
      t.String :name
      t.String :password

      t.timestamps
    end
  end
end
