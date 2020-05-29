CountDownState = Class{__includes = BaseState}

ct = 0.7

function CountDownState:init()
    self.count = 3
    self.timer = 0
end

function CountDownState:update(dt)
    self.timer = self.timer + dt

    if self.timer > ct then
        self.timer = self.timer % ct
        self.count = self.count - 1

        if self.count == 0 then
            gStateMachine:change('play')
        end
    end
end

function CountDownState:render()
    love.graphics.setFont(HugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, vw, 'center')
end