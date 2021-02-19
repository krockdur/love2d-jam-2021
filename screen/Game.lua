
local Game = {}

local posX = 10
local posY = 10

function Game.load()
end

function Game.draw()
    love.graphics.rectangle("fill", posX, posY, 50, 20)
end

function Game.update(dt)
end

function Game.keypressed(key)
    if key == "a" then
        posX = posX-10
    end
    if key == "e" then
        posX = posX+10
    end
end

return Game