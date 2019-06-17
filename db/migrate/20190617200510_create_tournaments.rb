class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.boolean :active
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
