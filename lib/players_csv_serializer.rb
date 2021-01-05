require 'csv'

class PlayersCSVSerializer
  # Takes an array of Player
  def initialize(players)
    @players = players
  end

  # Generates the CSV
  def get_csv
    CSV.generate do |csv|
      csv << ["player", "team", "position", "rushing_attempts", "rushing_attempts_per_game", "total_rushing_yards", "rushing_average_yards_per_attempt", "rushing_yards_per_game", "touchdowns", "longest_rush", "rushing_first_downs", "rushing_first_down_percentage", "rushing_twenty_or_more_yards_each", "rushing_forty_or_more_yards_each", "rushing_fumbles"]
      @players.each do |player|
        csv << [
          player.player,
          player.team,
          player.position,
          player.rushing_attempts,
          player.rushing_attempts_per_game,
          player.total_rushing_yards,
          player.rushing_average_yards_per_attempt,
          player.rushing_yards_per_game,
          player.touchdowns,
          (player.longest_rush_has_touchdown ? [player.longest_rush, 'T'].join : player.longest_rush),
          player.rushing_first_downs,
          player.rushing_first_down_percentage,
          player.rushing_twenty_or_more_yards_each,
          player.rushing_forty_or_more_yards_each,
          player.rushing_fumbles
        ]
      end
    end
  end
end