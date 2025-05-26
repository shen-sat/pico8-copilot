-- Player-specific move states

player_move_states = {
    idle = create_framed_move_state(1, {
        {x = 0, y = 0} -- frame 1
    }, true),

    right = create_framed_move_state(10, {
        {y = -3}, -- frame 1
        {y = 3},  -- frame 2
        {y = -2}, -- frame 3
        {y = 2},  -- frame 4
        {y = -1}, -- frame 5
        {y = 1}   -- frame 6
    }, false),

    left = create_simple_move_state(
        function(self)
            self.counter = self.counter + 1
            if self.counter > 30 then
                handle_next_state(self)
            elseif self.counter > 10 then
                self.x = -0.5
            else
                self.x = -2
            end
        end,
        function(self)
            self.x = 0
            self.y = 0
            self.counter = 0
        end,
        {counter = 0}
    )
}
