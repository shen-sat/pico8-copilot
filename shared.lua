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

        draw = function(self, caller)
            self.frames[self.current_frame](caller)
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
    if state == player_move_states.left then
        player:set_move_state(player_move_states.idle)
    end
end

function create_framed_move_state(speed, frames, loop)
    assert(type(speed) == "number" and speed > 0, "[create_framed_move_state] 'speed' must be a positive number")
    assert(type(frames) == "table" and #frames > 0, "[create_framed_move_state] 'frames' must be a non-empty table")
    for i, frame in ipairs(frames) do
        assert(type(frame) == "table", "[create_framed_move_state] frame #"..i.." must be a table with x and/or y keys")
        if frame.x ~= nil then
            assert(type(frame.x) == "number", "[create_framed_move_state] frame #"..i.." 'x' must be a number if present")
        end
        if frame.y ~= nil then
            assert(type(frame.y) == "number", "[create_framed_move_state] frame #"..i.." 'y' must be a number if present")
        end
    end
    assert(type(loop) == "boolean", "[create_framed_move_state] 'loop' must be a boolean value")
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
            local frame = self.frames[self.current_frame]
            if frame then
                if frame.x then caller.x += frame.x end
                if frame.y then caller.y += frame.y end
            end
        end
    }
end

function create_simple_move_state(update_fn, reset_fn, attrs)
    assert(type(update_fn) == "function", "[create_simple_move_state] 'update_fn' must be a function")
    assert(type(reset_fn) == "function", "[create_simple_move_state] 'reset_fn' must be a function")
    if attrs ~= nil then
        assert(type(attrs) == "table", "[create_simple_move_state] 'attrs' must be a table if provided")
    end
    local state = {
        x = 0,
        y = 0,
        update = update_fn,
        move = function(self, caller)
            caller.x += self.x
            caller.y += self.y
        end,
        reset = reset_fn
    }
    if attrs then
        for k, v in pairs(attrs) do
            state[k] = v
        end
    end
    return state
end

function create_object(x, y)
    return {
        x = x,
        y = y,
        animation_state = nil,
        move_state = nil,

        set_animation_state = function(self, state)
            self.animation_state = state
            self.animation_state:reset()
        end,

        set_move_state = function(self, state)
            self.move_state = state
            self.move_state:reset()
        end,

        update = function(self, dt)
            if self.move_state then
                self.move_state:update(dt)
            end
            if self.animation_state then
                self.animation_state:update(dt)
            end
        end,

        move = function(self)
            if self.move_state then
                self.move_state:move(self)
            end
        end,

        draw = function(self)
            if self.animation_state then
                self.animation_state:draw(self)
            end
        end
    }
end