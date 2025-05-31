-- Card-specific animation states

card_animations_states = {
    idle = create_animation_state(3, {
        function(x, y)  end,-- frame 1: idle shell end,
        function(x, y)  end,-- frame 2: idle shell end
    }, true), -- Looping idle

    right = create_animation_state(5, {
        function(x, y)  end,-- frame 1: right shell end,
        function(x, y)  end,-- frame 2: right shell end
    }, true), -- Looping right

    down = create_animation_state(4, {
        function(x, y)  end,-- frame 1: down shell end,
        function(x, y)  end,-- frame 2: down shell end
    }, false) -- Non-looping down
}
