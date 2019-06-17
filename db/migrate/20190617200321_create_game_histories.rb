class CreateGameHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :game_histories do |t|
      t.string :player_one
      t.string :player_two
      t.integer :p_one_score
      t.integer :p_two_score

      t.timestamps
    end
  end
end
