Pipe = Class{}


local pimage =  love.graphics.newImage('pipe.png')
--local piscroll = -60

pspeed = 60

pieght = 288
pidth = 70
function Pipe:init(orientation, y)
    self.x = vw
    --self.y = math.random(vh / 4, vh - 10)
    self.y = y 
    
    self.width = pidth--pimage:getWidth()
    self.hieght = pieght
        
    self.orientation = orientation
end

function Pipe:update(dt)
   -- self.x = self.x + piscroll * dt
end

function Pipe:render()
    love.graphics.draw(pimage, self.x, 
        (self.orientation == 'top' and self.y + pieght or self.y), 
        0, 1, self.orientation == 'top' and -1 or 1)
end

    
