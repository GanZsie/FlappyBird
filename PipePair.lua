PipePair = Class{}

local gieght = 90

function PipePair:init(y)
    self.x = vw + 32
    self.y = y

    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + pieght + gieght)
    }

    self.remove = false
end

function PipePair:update(dt)
    if self.x > -pidth then
        self.x = self.x - pspeed * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true

        self.scored = false
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes ) do
        pipe:render()
    end
end
