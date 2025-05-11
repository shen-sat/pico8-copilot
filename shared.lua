-- Shared utilities and systems

-- Animation System
function create_animation_state(speed, loop, frames, next_animation)
    return {
        speed = speed,
        loop = loop,
        frames = frames,
        next_animation = next_animation, -- New property to store the next animation
        elapsed_time = 0,
        current_frame = 1,

        reset = function(self)
            self.elapsed_time = 0
            self.current_frame = 1
        end,

        update = function(self, dt, player)
            self.elapsed_time = self.elapsed_time + dt
            local frame_duration = 1 / self.speed

            if self.elapsed_time >= frame_duration then
                self.elapsed_time = 0  -- Reset elapsed time to ensure consistent frame timing
                self.current_frame = self.current_frame + 1

                if self.current_frame > #self.frames then
                    if self.loop then
                        self.current_frame = 1
                    else
                        self.current_frame = #self.frames
                        if self.next_animation then
                            player:set_animation_state(self.next_animation) -- Transition to the next animation
                        end
                    end
                end
            end
        end,

        draw = function(self, x, y)
            self.frames[self.current_frame](x, y)
        end
    }
end