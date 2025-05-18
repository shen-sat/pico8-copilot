AnimationManager = {
    handle_next_animation = function(animation_state)
        -- Switch statement to determine the next animation
        if animation_state == player_animations.right then
            -- Transition to idle animation after right animation finishes
            player:set_animation_state(player_animations.idle)
        end
        -- Add more cases as needed for other animations
    end
}