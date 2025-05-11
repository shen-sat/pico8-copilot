-- Removed include statement for shared.lua

-- Player-specific animation states

player_animations = {
    left = create_animation_state(10, true, {
        function(x, y) circfill(x, y, 5, 8) end, -- Draw circle
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 9) end, -- Draw square
        function(x, y) rectfill(x-5, y-2, x+5, y+2, 10) end -- Draw rectangle
    }),

    idle = create_animation_state(3, true, {
        function(x, y) print("I", x, y, 7) end, -- Print "I"
        function(x, y) print("am", x, y, 7) end, -- Print "am"
        function(x, y) print("idle", x, y, 7) end -- Print "idle"
    }),

    right = create_animation_state(5, false, {
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 8) end, -- Frame 1: Red square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 9) end, -- Frame 2: Orange square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 10) end, -- Frame 3: Yellow square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 11) end, -- Frame 4: Green square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 12) end, -- Frame 5: Blue square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 13) end, -- Frame 6: Indigo square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 14) end, -- Frame 7: Violet square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 7) end, -- Frame 8: White square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 6) end, -- Frame 9: Gray square
        function(x, y) rectfill(x-3, y-3, x+3, y+3, 5) end  -- Frame 10: Black square
    })
}