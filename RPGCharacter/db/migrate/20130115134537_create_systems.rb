class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.Integer :SystemId
      t.string :Name
      t.Integer :Diesystem
      t.boolean :ClassBased
      t.string :Genre

      t.timestamps
    end
  end
end
