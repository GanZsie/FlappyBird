Bird = Class()
local  gravity = 20

function Bird:init()
    self.image = love.graphics.newImage('Bird-export.png')
    self.w = self.image:getWidth()
    self.h = self.image:getHeight()

    self.x = vw / 2 - (self.w / 2)
    self.y = vh / 2 - (self.h / 2)  
    
    self.dy = 0
end
    
function Bird:collides(pipe)
    if (self.x + 2) + (self.w - 4) >= pipe.x and self.x + 2 <= pipe.x + pidth then
        if (self.y + 2) + (self.h - 4) >= pipe.y and self.y + 2 <= pipe.y + pieght then
            return true
        end
    end
    
    return false

end


function Bird:update(dt)
    self.dy = self.dy + gravity * dt

    if love.keyboard.wasPressed('space') then
        self.dy = -3
        sounds['jump']:play()
    end
    
    self.y = self.y + self.dy
end


function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end