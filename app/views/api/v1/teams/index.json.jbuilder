json.teams do
  json.array! @teams do |team|
    # json.id team.id
    # json.player team.player
    json.team team.team
    # json.position team.position
    # json.rushing_attempts_per_game team.rushing_attempts_per_game
    # json.rushing_attempts team.rushing_attempts
    json.total_rushing_yards team.total_rushing_yards
    # json.rushing_average_yards_per_attempt team.rushing_average_yards_per_attempt
    # json.rushing_yards_per_game team.rushing_yards_per_game
    # json.touchdowns team.touchdowns
    json.longest_rush team.longest_rush
    # json.rushing_first_downs team.rushing_first_downs
    # json.rushing_first_down_percentage [(team.rushing_first_down_percentage * 100), '%'].join
    # json.rushing_twenty_or_more_yards_each team.rushing_twenty_or_more_yards_each
    # json.rushing_forty_or_more_yards_each team.rushing_forty_or_more_yards_each
    # json.rushing_fumbles team.rushing_fumbles
  end
end

json.meta do
  # json.total_pages @teams.total_pages
  # json.current_page @teams.current_page
  # json.per_page @teams_per_page
  # json.count @teams_count
end
