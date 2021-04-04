require("spokostudios")

Ball = {}

function Ball:load()
    self.width = 10;
    self.height = 10;
    self.x = (love.graphics.getWidth()/2)-(self.width/2)
    self.y = (love.graphics.getHeight()/2)-(self.height/2)
    self.speed = 100;
    self.xVelocity = -self.speed
    self.yVelocity = 0
end

function Ball:update(dt)
    Ball:move(dt)
    Ball:collide()
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:move(dt)
    self.x = self.x+(self.xVelocity*dt)
    self.y = self.y+(self.yVelocity*dt)
end

function Ball:checkCollision(obj)
    if (Sos.getRight(self)>obj.x) and (self.x<Sos.getRight(obj)) and (Sos.getBottom(self)>obj.y) and (self.y<Sos.getBottom(obj)) then
        return true
    end

    return false
end

function Ball:collide()
    if not (self.y > 0) then
        Ball:swapYVelocity()
    end

    if Sos.getBottom(self) > love.graphics.getHeight() then
        Ball:swapYVelocity()
    end

    if Ball:checkCollision(Player) then
        self.xVelocity = -self.xVelocity
        self.yVelocity = (Sos.getMiddle(self)-Sos.getMiddle(Player))*5
    end
end

function Ball:swapYVelocity()
    self.yVelocity = -self.yVelocity
end