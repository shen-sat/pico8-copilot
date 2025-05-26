-- Controller Object
controller = {
    handle_input = function()
        if btnp(0) then -- Left button
            player:set_animation_state(player_animations.left)
            player:set_move_state(player_move_states.left)
        elseif btnp(1) then -- Right button
            player:set_animation_state(player_animations.right)
            player:set_move_state(player_move_states.right)
        elseif btnp(2) then -- Up button
            player:set_animation_state(player_animations.idle)
            player:set_move_state(player_move_states.idle)
        end
    end
}