-- Card-specific animation states

card_animations_states = {
    idle = create_animation_state(1, {
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
        end,-- frame 1: idle shell end,
    }, true), -- Looping idle

    selected = create_animation_state(15, {
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(0, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(16, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(32, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(48, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(64, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
        function(caller)
          rectfill(caller.x, caller.y, caller.x + caller.width - 1, caller.y + caller.height - 1, 6)
          sspr(80, 0, 16, 20, caller.x + 3, caller.y + 9)
        end,
    }, true), -- Looping right

    down = create_animation_state(4, {
        function(caller)  end,-- frame 1: down shell end,
        function(caller)  end,-- frame 2: down shell end
    }, false) -- Non-looping down
}
