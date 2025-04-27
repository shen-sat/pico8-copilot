pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function _init()
    current_time = 0

    -- Include shared modules
    #include animation_system.lua
    #include player.lua
    #include controller.lua

    -- Initialize player
    
    player = create_player()

    -- Set initial animation state
    player:set_animation_state(idle_animation)
end

function _update()
    -- Handle input and update player
    controller:handle_input()
    player:update(1/30) -- Assuming 30 FPS

    current_time += 1
end

function _draw()
    cls() -- Clear screen
    player:draw()
end