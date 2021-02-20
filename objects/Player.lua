local Player = {}


-- Tile en cours du player
Player.tileX = 5
Player.tileY = 3

-- Position de dessin du sprite
local posX = 320-64
local posY = 192-64

-- ref vers la map
local map

local CELERITY = 0.15

local playerSrite

function Player.load()
    playerSrite = love.graphics.newImage("assets/chef.png")
end


--debug
local font = love.graphics.newFont("assets/SnesItalic-vmAPZ.ttf", 40)
local txtDebug = love.graphics.newText(font, "DEBUG")
local txtDebugTileX = love.graphics.newText(font, tostring(Player.tileX))
local txtDebugTileY = love.graphics.newText(font, tostring(Player.tileY))
--fin debug

function Player.draw()
    love.graphics.draw(playerSrite, posX, posY)


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