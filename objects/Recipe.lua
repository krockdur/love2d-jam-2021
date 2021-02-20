

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


return Receipe