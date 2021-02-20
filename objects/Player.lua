local Player = {}

local posX = 64
local posY = 64

local playerSrite
local CELERITY = 0.15

function Player.load()
    playerSrite = love.graphics.newImage("assets/chef.png")
end

function Player.draw()
    love.graphics.draw(playerSrite, posX, posY)
end

local timer = 0
function Player.update(dt)

    timer = timer + dt
    local timer_limit = CELERITY
    if timer >= timer_limit then
      
        timer = timer - timer_limit
    
        if love.keyboard.isDown('q') then
            Player.moveLeft(dt)
        end
        if love.keyboard.isDown('d') then
            Player.moveRight(dt)
        end
        if love.keyboard.isDown('z') then
            Player.moveUp(dt)
        end
        if love.keyboard.isDown('s') then
            Player.moveDown(dt)
        end
    end

end

function Player.moveLeft(dt)
    posX = posX - 64
end
function Player.moveRight(dt)
    posX = (posX + 64)
end
function Player.moveDown(dt)
    posY = (posY + 64)
end
function Player.moveUp(dt)
    posY = (posY - 64)
end
return Player