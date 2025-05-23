pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include shared.lua
#include animation_manager.lua
#include player/player_animations_states.lua
#include player.lua
#include controller.lua

function _init()
    current_time = 0

    -- Initialize player
    player = create_object(64, 64)

    -- Set initial animation state
    player:set_animation_state(player_animations.idle)
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