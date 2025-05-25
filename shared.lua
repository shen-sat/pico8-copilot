function create_animation_state(speed, frames, loop)
    return {
        speed = speed,
        frames = frames,
        loop = loop, -- Define the loop attribute
        elapsed_time = 0,
        current_frame = 1,

        reset = function(self)
            self.elapsed_time = 0
            self.current_frame = 1
        end,

        update = function(self, dt)
            self.elapsed_time = self.elapsed_time + dt
            local frame_duration = 1 / self.speed

            if self.elapsed_time >= frame_duration then
                self.elapsed_time = 0  -- Reset elapsed time to ensure consistent frame timing
                self.current_frame = self.current_frame + 1

                if self.current_frame > #self.frames then
                    if not self.loop then
                        -- Call the AnimationManager to handle the next animation
                        handle_next_animation(self)
                    else
                        self.current_frame = 1 -- Loop back to the first frame
                    end
                end
            end
        end,

        draw = function(self, x, y)
            self.frames[self.current_frame](x, y)
        end
    }
end

function handle_next_animation(animation_state)
    -- Switch statement to determine the next animation
    if animation_state == player_animations.right then
        -- Transition to idle animation after right animation finishes
        player:set_animation_state(player_animations.idle)
    end
    -- Add more cases as needed for other animations
end