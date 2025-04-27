-- Animation System
function create_animation_state(speed, loop, frames)
    return {
        speed = speed,
        loop = loop,
        frames = frames,
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
                    if self.loop then
                        self.current_frame = 1
                    else
                        self.current_frame = #self.frames
                    end
                end
            end
        end,

        draw = function(self, x, y)
            self.frames[self.current_frame](x, y)
        end
    }
end

-- Define specific animations

-- Left animation state
left_animation = create_animation_state(10, true, {
    function(x, y) circfill(x, y, 5, 8) end, -- Draw circle
    function(x, y) rectfill(x-3, y-3, x+3, y+3, 9) end, -- Draw square
    function(x, y) rectfill(x-5, y-2, x+5, y+2, 10) end -- Draw rectangle
})

-- Idle animation state
idle_animation = create_animation_state(3, true, {
    function(x, y) print("I", x, y, 7) end, -- Print "I"
    function(x, y) print("am", x, y, 7) end, -- Print "am"
    function(x, y) print("idle", x, y, 7) end -- Print "idle"
})