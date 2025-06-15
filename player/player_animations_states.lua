-- Removed include statement for shared.lua

-- Player-specific animation states

player_animations = {
    left = create_animation_state(10, {
        function(caller) circfill(caller.x, caller.y, 5, 8) end, -- Draw circle
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 9) end, -- Draw square
        function(caller) rectfill(caller.x-5, caller.y-2, caller.x+5, caller.y+2, 10) end -- Draw rectangle
    }, true), -- Loop is false for left animation

    idle = create_animation_state(3, {
        function(caller) print("I", caller.x, caller.y, 7) end, -- Print "I"
        function(caller) print("am", caller.x, caller.y, 7) end, -- Print "am"
        function(caller) print("idle", caller.x, caller.y, 7) end -- Print "idle"
    }, true), -- Loop is false for idle animation

    right = create_animation_state(5, {
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 8) end, -- Frame 1: Red square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 9) end, -- Frame 2: Orange square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 10) end, -- Frame 3: Yellow square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 11) end, -- Frame 4: Green square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 12) end, -- Frame 5: Blue square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 13) end, -- Frame 6: Indigo square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 14) end, -- Frame 7: Violet square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 7) end, -- Frame 8: White square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 6) end, -- Frame 9: Gray square
        function(caller) rectfill(caller.x-3, caller.y-3, caller.x+3, caller.y+3, 5) end  -- Frame 10: Black square
    }, false) -- Loop is true for right animation
}