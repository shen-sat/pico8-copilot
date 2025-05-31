pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include shared.lua
#include player/player_animations_states.lua
#include player/player_move_states.lua
#include controller.lua

#include card/card_animations_states.lua

function _init()
    current_time = 0

    -- Initialize player
    player = create_object(64, 64)
    -- Set initial animation state
    player:set_animation_state(player_animations.idle)
    -- Set initial move state
    player:set_move_state(player_move_states.idle)

    -- Initialize card
    card = create_object(0, 0)
    -- Set initial animation state
    card:set_animation_state(card_animations_states.idle)
    -- Set initial move state
    -- card:set_move_state(card_move_states.idle)
end

function _update()
    -- Handle input and update player
    controller:handle_input()
    player:update(1/30) -- Assuming 30 FPS
    player:move()
    

    current_time += 1
end

function _draw()
    cls() -- Clear screen
    player:draw()
end