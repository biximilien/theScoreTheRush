json.players do
  json.array! @players do |player|
    json.id player.id
    json.player player.player
    json.team player.team
    json.position player.position
    json.rushing_attempts_per_game player.rushing_attempts_per_game
    json.rushing_attempts player.rushing_attempts
    json.total_rushing_yards player.total_rushing_yards
    json.rushing_average_yards_per_attempt player.rushing_average_yards_per_attempt
    json.rushing_yards_per_game player.rushing_yards_per_game
    json.touchdowns player.touchdowns
    json.longest_rush (player.longest_rush_has_touchdown ? [player.longest_rush, 'T'].join : player.longest_rush)
  end
end

json.meta do
  json.total_pages @players.total_pages
  json.current_page @players.current_page
  json.per_page @players_per_page
  json.count @players_count
end
