class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|

      # We assume the table is going to grow in the 10 000 of records as stated
      # in the exercice. Design decisions are based on this assumption.

      # Player (Name), should use at most 120 bytes
      #   NOTE: We add an index on this column if the postgresql version
      #         supports it. We will not be using extensions for this exercise,
      #         but in a real world scenario this could speed up the filtering
      #         queries on player names.
      t.string :player,   null: false, default: '', limit: 120
      t.index :player

      # Team is an abbreviation, 1-3 characters (3 bytes)
      t.string :team,     null: false, default: '', limit: 3

      # Position is an abbreviation, 1-2 characters (2 bytes)
      t.string :position, null: false, default: '', limit: 2

      # Rushing Attempts (2 bytes at most)
      t.integer :rushing_attempts, null: false, default: 0

      # Rushing Attempts per Game Average (10 bytes at most)
      t.decimal :rushing_attempts_per_game, precision: 5, scale: 2, null: false, default: 0.0

      # Total Rushing Yards (2 bytes at most)
      t.integer :total_rushing_yards

      # Rushing Average Yards per Attempt (10 bytes at most)
      t.decimal :rushing_average_yards_per_attempt, precision: 6, scale: 2, null: false, default: 0.0

      # Rushing Average Yards per Game (10 bytes at most)
      t.decimal :rushing_yards_per_game, precision: 6, scale: 2, null: false, default: 0.0

      # Touchdowns (2 bytes at most)
      t.integer :touchdowns

      # Longest rush (2 bytes at most)
      t.integer :longest_rush
      # combined with longest_rush in presentation layer (1 byte)
      t.boolean :longest_rush_has_touchdown

      #
      t.integer :rushing_first_downs
      t.decimal :rushing_first_down_percentage
      t.integer :rushing_twenty_or_more_yards_each
      t.integer :rushing_forty_or_more_yards_each
      t.integer :rushing_fumbles

      t.timestamps
    end
  end
end
