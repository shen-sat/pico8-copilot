-- Player-specific move states

player_move_states = {
    idle = create_move_state(1, {
        function(self, caller)
        end
    }, true),

    right = create_move_state(10, {
        function(self, caller) caller.y -= 3 end, -- frame 1
        function(self, caller) caller.y += 3 end, -- frame 2
        function(self, caller) caller.y -= 2 end, -- frame 1
        function(self, caller) caller.y += 2 end, -- frame 2
        function(self, caller) caller.y -= 1 end, -- frame 1
        function(self, caller) caller.y += 1 end, -- frame 2
        
    }, false)
}
