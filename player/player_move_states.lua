-- Player-specific move states

player_move_states = {
    idle = create_move_state(1, {
        {x = 0, y = 0} -- frame 1
    }, true),

    right = create_move_state(10, {
        {y = -3}, -- frame 1
        {y = 3},  -- frame 2
        {y = -2}, -- frame 3
        {y = 2},  -- frame 4
        {y = -1}, -- frame 5
        {y = 1}   -- frame 6
    }, false)
}
