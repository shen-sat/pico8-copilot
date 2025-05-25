function create_animation_state(speed, frames, loop)
    assert(type(speed) == "number" and speed > 0, "[create_animation_state] 'speed' must be a positive number")
    assert(type(frames) == "table" and #frames > 0, "[create_animation_state] 'frames' must be a non-empty table")
    for i, frame in ipairs(frames) do
        assert(type(frame) == "function", "[create_animation_state] frame #"..i.." is not a function")
    end
    assert(type(loop) == "boolean", "[create_animation_state] 'loop' must be a boolean value")

    return {
        speed = speed,
        frames = frames,
        loop = loop, -- Define the loop attribute
        elapsed_time = 0,
        current_frame = 1,
        is_first_loop = true, -- Add is_first_loop attribute

        reset = function(self)
            self.elapsed_time = 0
            self.current_frame = 1
            self.is_first_loop = true
        end,

        update = function(self, dt)
            if self.is_first_loop then
                self.is_first_loop = false
                return
            end
            self.elapsed_time = self.elapsed_time + dt
            local frame_duration = 1 / self.speed

            if self.elapsed_time >= frame_duration then
                self.elapsed_time = 0  -- Reset elapsed time to ensure consistent frame timing
                self.current_frame = self.current_frame + 1

                if self.current_frame > #self.frames then
                    if not self.loop then
                        -- Call the AnimationManager to handle the next animation
                        handle_next_state(self)
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

function handle_next_state(state)
    if state == player_animations.right then
        player:set_animation_state(player_animations.idle)
    end
    if state == player_move_states.right then
        player:set_move_state(player_move_states.idle)
    end
end

function create_move_state(speed, frames, loop)
    assert(type(speed) == "number" and speed > 0, "[create_move_state] 'speed' must be a positive number")
    assert(type(frames) == "table" and #frames > 0, "[create_move_state] 'frames' must be a non-empty table")
    for i, frame in ipairs(frames) do
        assert(type(frame) == "function", "[create_move_state] frame #"..i.." is not a function")
    end
    assert(type(loop) == "boolean", "[create_move_state] 'loop' must be a boolean value")
    return {
        speed = speed,
        frames = frames,
        loop = loop,
        elapsed_time = 0,
        current_frame = 1,
        is_first_loop = true,
        reset = function(self)
            self.elapsed_time = 0
            self.current_frame = 1
            self.is_first_loop = true
        end,
        update = function(self, dt)
            if self.is_first_loop then
                self.is_first_loop = false
                return
            end
            self.elapsed_time = self.elapsed_time + dt
            local frame_duration = 1 / self.speed
            if self.elapsed_time >= frame_duration then
                self.elapsed_time = 0
                self.current_frame = self.current_frame + 1
                if self.current_frame > #self.frames then
                    if not self.loop then
                        handle_next_state(self)
                    else
                        self.current_frame = 1
                    end
                end
            end
        end,
        move = function(self, caller)
            local move_fn = self.frames[self.current_frame]
            if move_fn then
                move_fn(self, caller)
            end
        end
    }
end