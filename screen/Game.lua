local Player = require "objects.Player"


local player = require("objects.Player")
local map = require("objects.Map")
local recipe = require("objects.Recipe")
local ui = require("objects.Ui")

local Game = {}

local posX = 10
local posY = 10


local wallpaper

local winRecipe = false
local loseRecipe = false

-----------------------------------------------------------------------
local font = love.graphics.newFont("assets/SnesItalic-vmAPZ.ttf", 40)

local score = 0

local spriteWin
local spriteBad

function Game.load()

  ui.load()
  -- test

  -- recette à produire
  recipe.load()  
  recipe.create(Game.pickUpRandRecipe())
  --

  love.keyboard.setKeyRepeat(true)

  wallpaper = love.graphics.newImage("assets/bg.png")

  spriteWin = love.graphics.newImage("assets/win.png")
  spriteBad = love.graphics.newImage("assets/bad.png")

  player.load()
  player.setMap(map)

end

-----------------------------------------------------------------------


function Game.draw()

  love.graphics.draw(wallpaper)

  ui.draw()
  player.draw()
  recipe.draw()

  if winRecipe then
    love.graphics.draw(spriteWin, 0, 200)    
  end
  if loseRecipe then
    love.graphics.draw(spriteBad, 0, 200)    
  end

end

-----------------------------------------------------------------------
local timerWin = 0
function Game.update(dt)

  ui.update(dt)
  player.update(dt)

  if winRecipe then
    timerWin = timerWin + dt
    local timer_limit = 2
    if timerWin >= timer_limit then
      winRecipe = false
      timerWin = 0
    end
  end

  if loseRecipe then
    timerWin = timerWin + dt
    local timer_limit = 2
    if timerWin >= timer_limit then
      loseRecipe = false
      timerWin = 0
    end
  end

end

-----------------------------------------------------------------------

function Game.keypressed(key)
  if key == "space" then

    print(tostring(player.tileX))
    print(tostring(player.tileY))

    print(tostring(map.lvlCollision[player.tileY][player.tileX]))


    -- zone pour vider le player
    if map.lvlCollision[player.tileY][player.tileX] == 31 then
      player.isLoaded = false
    end

    -- chargement player
    if not player.isLoaded then

      -- zone de picking des ingrédients
      if map.lvlCollision[player.tileY][player.tileX] == 11 then
        player.transport(11)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 12 then
        player.transport(12)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 13 then
        player.transport(13)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 14 then
        player.transport(14)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 15 then
        player.transport(15)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 16 then
        player.transport(16)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 17 then
        player.transport(17)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 18 then
        player.transport(18)
      end
      if map.lvlCollision[player.tileY][player.tileX] == 19 then
        player.transport(19)
      end


      -- zone de picking depuis la zone de dépose
      if map.lvlCollision[player.tileY][player.tileX] == 21 and recipe.zone21 ~= 0 then
        player.transport(recipe.zone21)
        recipe.zone21 = 0
      end

      if map.lvlCollision[player.tileY][player.tileX] == 22 and recipe.zone22 ~= 0 then
        player.transport(recipe.zone22)
        recipe.zone22 = 0
      end

      if map.lvlCollision[player.tileY][player.tileX] == 23 and recipe.zone23 ~= 0 then
        player.transport(recipe.zone23)
        recipe.zone23 = 0
      end

      if map.lvlCollision[player.tileY][player.tileX] == 24 and recipe.zone24 ~= 0 then
        player.transport(recipe.zone24)
        recipe.zone24 = 0
      end

      if map.lvlCollision[player.tileY][player.tileX] == 25 and recipe.zone25 ~= 0 then
        player.transport(recipe.zone25)
        recipe.zone25 = 0
      end

      if map.lvlCollision[player.tileY][player.tileX] == 26 and recipe.zone26 ~= 0 then
        player.transport(recipe.zone26)
        recipe.zone26 = 0
      end


      -- zone de préparation de la recette
      if map.lvlCollision[player.tileY][player.tileX] == 41 then

        local tabSubmit = {}

        if recipe.zone21 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone21))
        end
        if recipe.zone22 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone22))
        end
        if recipe.zone23 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone23))
        end
        if recipe.zone24 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone24))
        end
        if recipe.zone25 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone25))
        end
        if recipe.zone26 ~= 0 then
          table.insert(tabSubmit, map.getStrIngredient(recipe.zone26))
        end

        local isRecipeValidated = recipe.validateReceipe(tabSubmit)

        if isRecipeValidated then
          print("WIN")
          winRecipe = true
          recipe.resetZones()
          recipe.create(Game.pickUpRandRecipe())
          score = score + 1
        else
          print("LOSE")
          loseRecipe = true
        end

      end


      -- déchargement player
    else

      if map.lvlCollision[player.tileY][player.tileX] == 21 then
        if recipe.zone21 == 0 then
          recipe.zone21 = player.ingredientLoaded
          player.isLoaded = false
        end
      end
      if map.lvlCollision[player.tileY][player.tileX] == 22 then
        if recipe.zone22 == 0 then
          recipe.zone22 = player.ingredientLoaded
          player.isLoaded = false
        end
      end
      if map.lvlCollision[player.tileY][player.tileX] == 23 then
        if recipe.zone23 == 0 then
          recipe.zone23 = player.ingredientLoaded
          player.isLoaded = false
        end
      end
      if map.lvlCollision[player.tileY][player.tileX] == 24 then
        if recipe.zone24 == 0 then
          recipe.zone24 = player.ingredientLoaded
          player.isLoaded = false
        end
      end
      if map.lvlCollision[player.tileY][player.tileX] == 25 then
        if recipe.zone25 == 0 then
          recipe.zone25 = player.ingredientLoaded
          player.isLoaded = false
        end
      end
      if map.lvlCollision[player.tileY][player.tileX] == 26 then
        if recipe.zone26 == 0 then
          recipe.zone26 = player.ingredientLoaded
          player.isLoaded = false
        end
      end

    end



  end
end

-----------------------------------------------------------------------

function Game.mousepressed(x, y, button, istouch)
  ui.mousepressed(x, y, button, istouch)
end

-----------------------------------------------------------------------

-- generate random number from 1 -> 6
function Game.pickUpRandRecipe()
  math.randomseed(os.time())
  return math.random(1, 6)
end

-----------------------------------------------------------------------

return Game