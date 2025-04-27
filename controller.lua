-- Controller Object
controller = {
    handle_input = function()
        if btnp(0) then -- Left button
            player:set_animation_state(left_animation)
        elseif btnp(2) then -- Up button
            player:set_animation_state(idle_animation)
        end
    end
}