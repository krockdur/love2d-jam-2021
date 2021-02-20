local Player = require "objects.Player"


local player = require("objects.Player")


local Game = {}

local posX = 10
local posY = 10


local wallpaper


function Game.load()
    
    love.keyboard.setKeyRepeat(true)

    wallpaper = love.graphics.newImage("assets/bg.png")

    player.load()

end

function Game.draw()

    love.graphics.draw(wallpaper)

    player.draw()
end

function Game.update(dt)

    player.update(dt)

end

function Game.keypressed(key)
    if key == "q" then
        --Player.moveLeft(10)
    end
    if key == "d" then
        --Player.moveRight(10)
    end
    if key == "z" then
        --Player.moveUp(10)
    end
    if key == "s" then
        --Player.moveDown(10)
    end
end

return Game