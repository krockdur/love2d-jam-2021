

-- recette a produire
-- liste de recette à suivre ?

-- test validation recette

local Receipe = {}

local name
local nbIngredients
local tabIngredients = {}

function Receipe.create(randomNumber)

    if randomNumber == 1 then

        name = "cookies"
        nbIngredients = 3
        tabIngredients[1] = "chocolate chips"           -- pépittes
        tabIngredients[2] = "flour"                     -- farine
        tabIngredients[3] = "egg"                       -- oeufs

    end

end

-- test si la recette soumise est conforme
function Receipe.validateReceipe(tabSubmit)
    local nbIngOk = 0
    if #tabSubmit == nbIngredients then
        for idSb, ingTbSubmit in pairs(tabSubmit) do

            for id, ingTabIng in pairs(tabIngredients) do
                if ingTabIng == ingTbSubmit then
                    nbIngOk = nbIngOk + 1
                end
            end

        end

        if (nbIngOk == nbIngredients) then
            return true
        else
            return false
        end

    else
        return false
    end
end

local brownie       
local cake          
local chocolateMilk 
local chocolateMouse
local cookies       
local spread        
local butter        
local chocolateChips
local cocoa         
local eggs          
local flour         
local hazelnut      
local milk          
local oil           
local sugar         

function Receipe.load()
    brownie         = love.graphics.newImage("assets/brownie.png")
    cake            = love.graphics.newImage("assets/cake.png")
    chocolateMilk   = love.graphics.newImage("assets/chocolate-milk.png")
    chocolateMouse  = love.graphics.newImage("assets/chocolate-mousse.png")
    cookies         = love.graphics.newImage("assets/cookies.png")
    spread          = love.graphics.newImage("assets/spread.png")

    butter          = love.graphics.newImage("assets/ingredients/butter.png")
    chocolateChips  = love.graphics.newImage("assets/ingredients/chocolate-chips.png")
    cocoa           = love.graphics.newImage("assets/ingredients/cocoa.png")
    eggs            = love.graphics.newImage("assets/ingredients/eggs.png")
    flour           = love.graphics.newImage("assets/ingredients/flour.png")
    hazelnut        = love.graphics.newImage("assets/ingredients/hazelnut.png")
    milk            = love.graphics.newImage("assets/ingredients/milk.png")
    oil             = love.graphics.newImage("assets/ingredients/oil.png")
    sugar           = love.graphics.newImage("assets/ingredients/sugar.png")
end

function Receipe.draw()

    -- dessiner la recette cible

    -- dessiner les ingrédients
    love.graphics.draw(butter,          14*64, 8*64)--
    love.graphics.draw(chocolateChips,  01*64, 8*64)--
    love.graphics.draw(cocoa,           01*64, 6*64)--
    love.graphics.draw(eggs,            14*64, 2*64)--
    love.graphics.draw(flour,           01*64, 4*64)--
    love.graphics.draw(hazelnut,        14*64, 4*64)--
    love.graphics.draw(milk,            01*64, 2*64)--
    love.graphics.draw(oil,             14*64, 6*64)--
    love.graphics.draw(sugar,           04*64, 9*64)--

    -- Ajouter du texte pour les ingrédients

end


return Receipe