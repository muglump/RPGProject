class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.integer :systemId
      t.string :name
      t.integer :diesystem
      t.boolean :classBased
      t.string :genre

      t.timestamps
    end
  end
end
