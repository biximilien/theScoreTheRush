class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      # player's name - should use at most 120 bytes
      t.string :player,   null: false, default: '', limit: 120
      # player's team is an abbreviation, 1-3 characters (3 bytes)
      t.string :team,     null: false, default: '', limit: 3
      # player's team is an abbreviation, 1-2 characters (2 bytes)
      t.string :position, null: false, default: '', limit: 2
      t.integer :rushing_attempts, null: false, default: 0

      # Rushing Attempts per Game Average
      t.decimal :rushing_attempts_per_game, precision: 5, scale: 2, null: false, default: 0.0

      t.integer :total_rushing_yards
      t.decimal :rushing_average_yards_per_attempt
      t.decimal :rushing_yards_per_game
      t.integer :touchdowns

      # longest rush
      t.integer :longest_rush
      # combined with longest_rush in presentation layer (1 byte)
      t.boolean :longest_rush_has_touchdown

      t.integer :rushing_first_downs
      t.decimal :rushing_first_down_percentage
      t.integer :rushing_twenty_or_more_yards_each
      t.integer :rushing_forty_or_more_yards_each
      t.integer :rushing_fumbles

      t.timestamps
    end
  end
end
