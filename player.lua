-- Removed include statement for player_animations_states.lua

function create_object(x, y)
    return {
        x = x,
        y = y,
        animation_state = nil,

        set_animation_state = function(self, state)
            self.animation_state = state
            self.animation_state:reset()
        end,

        update = function(self, dt)
            if self.animation_state then
                self.animation_state:update(dt, self)
            end
        end,

        draw = function(self)
            if self.animation_state then
                self.animation_state:draw(self.x, self.y)
            end
        end
    }
end