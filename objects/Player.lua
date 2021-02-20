local Player = {}


-- Tile en cours du player
Player.tileX = 5
Player.tileY = 3

-- Position de dessin du sprite
local posX = 320-64
local posY = 192-64

-- ref vers la map
local map

local CELERITY = 0.1

local direction = "front"

local spritePlayerFront
local spritePlayerBack
local spritePlayerLeft
local spritePlayerRight

function Player.load()
    spritePlayerFront   = love.graphics.newImage("assets/chef.png")
    spritePlayerBack    = love.graphics.newImage("assets/chef-back.png")
    spritePlayerLeft    = love.graphics.newImage("assets/chef-left.png")
    spritePlayerRight   = love.graphics.newImage("assets/chef-right.png")
end


--debug
local font = love.graphics.newFont("assets/SnesItalic-vmAPZ.ttf", 40)
local txtDebug = love.graphics.newText(font, "DEBUG")
local txtDebugTileX = love.graphics.newText(font, tostring(Player.tileX))
local txtDebugTileY = love.graphics.newText(font, tostring(Player.tileY))
--fin debug

function Player.draw()
    --player direction
    if direction == "front" then
        love.graphics.draw(spritePlayerFront, posX, posY)
    elseif direction == "back" then
        love.graphics.draw(spritePlayerBack, posX, posY)
    elseif direction == "left" then
        love.graphics.draw(spritePlayerLeft, posX, posY)  
    elseif direction == "right" then
        love.graphics.draw(spritePlayerRight, posX, posY)         
    end


    -- Affichage debug
    love.graphics.draw(txtDebug, 32, 10)
    love.graphics.draw(txtDebugTileX, 128, 10)
    love.graphics.draw(txtDebugTileY, 192, 10)
    -- Fin affichage debug

end

local timer = 0
function Player.update(dt)

    -- debug
    txtDebugTileX:set(tostring(Player.tileX))
    txtDebugTileY:set(tostring(Player.tileY))
    -- fin debug

    timer = timer + dt
    local timer_limit = CELERITY
    if timer >= timer_limit then
      
        timer = timer - timer_limit
    
        if love.keyboard.isDown('q') then
            direction = "left"
            Player.moveLeft(dt)
        end
        if love.keyboard.isDown('d') then
            direction = "right"
            Player.moveRight(dt)
        end
        if love.keyboard.isDown('z') then
            direction = "back"
            Player.moveUp(dt)
        end
        if love.keyboard.isDown('s') then
            direction = "front"
            Player.moveDown(dt)
        end
    end

end

function Player.moveLeft(dt)
    local nextTileX = Player.tileX - 1
    
    local valueTileToTest = map.lvlCollision[Player.tileY][nextTileX]
    if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
        posX = posX - 64
        Player.tileX = nextTileX    
    end

end

function Player.moveRight(dt)
    local nextTileX = Player.tileX + 1

    local valueTileToTest = map.lvlCollision[Player.tileY][nextTileX]
    if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
        posX = (posX + 64)
        Player.tileX = Player.tileX + 1
    end
end

function Player.moveDown(dt)
    local nextTileY = Player.tileY + 1

    local valueTileToTest = map.lvlCollision[nextTileY][Player.tileX]
    if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
        posY = (posY + 64)
        Player.tileY = Player.tileY + 1
    end
end

function Player.moveUp(dt)
    local nextTileY = Player.tileY - 1

    local valueTileToTest = map.lvlCollision[nextTileY][Player.tileX]
    if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
        posY = (posY - 64)
        Player.tileY = Player.tileY - 1
    end
end

function Player.setMap(Map)
    map = Map
end




return Player