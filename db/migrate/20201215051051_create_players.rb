class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :player
      t.string :team
      t.string :position, limit: 2
      t.integer :rushing_attempts
      t.decimal :rushing_attempts_per_game
      t.integer :total_rushing_yards
      t.decimal :rushing_average_yards_per_attempt
      t.decimal :rushing_yards_per_game
      t.integer :touchdowns
      t.integer :longest_rush
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
