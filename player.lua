Player = {}

function Player:load()
    self.width = 10
    self.height = 50
    self.x = 15
    self.y = (love.graphics.getHeight()/2)-(self.height/2)
    self.speed = 250
end

function Player:update(dt)
    if love.keyboard.isDown("up") and self.y > 0 then
        self.y = self.y-(self.speed*dt)
    elseif love.keyboard.isDown("down") and self.y < (love.graphics.getHeight()-self.height) then
        self.y = self.y+(self.speed*dt)
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end