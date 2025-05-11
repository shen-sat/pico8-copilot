-- Removed include statement for player_animations_states.lua

-- Player Object
function create_player()
    return {
        x = 64,
        y = 64,
        animation_state = nil,
        last_update_time = 0, -- Track time since last update

        set_animation_state = function(self, state)
            self.animation_state = state
            self.animation_state:reset()
        end,

        update = function(self, dt)
            if self.animation_state then
                self.animation_state:update(dt)
            end
        end,

        draw = function(self)
            if self.animation_state then
                self.animation_state:draw(self.x, self.y)
            end
        end
    }
end