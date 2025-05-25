-- Removed include statement for player_animations_states.lua

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
                self.animation_state:draw(self.x, self.y)
            end
        end
    }
end