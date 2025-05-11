-- Controller Object
controller = {
    handle_input = function()
        if btnp(0) then -- Left button
            player:set_animation_state(player_animations.left)
        elseif btnp(1) then -- Right button
            player:set_animation_state(player_animations.right)
        elseif btnp(2) then -- Up button
            player:set_animation_state(player_animations.idle)
        end
    end
}