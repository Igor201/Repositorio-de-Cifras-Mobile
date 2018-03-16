local composer = require( "composer" )
local cifra = require( "Cifra" )
local save = require("saveData")
 
local scene = composer.newScene()

--local novaCifra = cifra:novaCifra()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local fieldNome
local fieldAutor
local fieldInicio
local fieldTom
local fieldConteudo
 
local function userImputNome( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
    cifra.nome = event.target.text  
    print(cifra.nome .. " Test")
 
    elseif ( event.phase == "editing" ) then
        
    end
end
 
local function userImputAutor( event )
 
    if ( event.phase == "began" ) then
        -- User begins editing "defaultField"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultField"
    cifra.autor = event.target.text  
    print(cifra.autor .. " Test")
 
    elseif ( event.phase == "editing" ) then
        
    end
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
local bg
local title
local button
local button2

function saveCifra( event )
    save.data(cifra.nome)
    print(save.readData())


end


function mudarCena(event)

composer.gotoScene("Menu", {effect = "slideLeft",time = 500})

end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    bg = display.newRect(display  .contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    bg:setFillColor(0,0,0)
    sceneGroup:insert(bg)

    title = display.newText("Cadastro Cifra", display.contentCenterX, display.contentCenterY/12, "Arial Black", 20)
    title:setFillColor(0, 0.5, 1 )
    sceneGroup:insert(title)

    button = display.newRect(display.contentCenterX, display.contentCenterY*1.7, display.contentWidth/3, display.contentHeight/13 )
    button:setFillColor(0, 0.5, 1 )
    sceneGroup:insert(button)

    button:addEventListener("tap", mudarCena)

    button2 = display.newRect(display.contentCenterX, display.contentCenterY*1.5, display.contentWidth/3, display.contentHeight/13 )
    button2:setFillColor(1, 1, 1 )
    sceneGroup:insert(button2)

    button2:addEventListener("tap", saveCifra)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local nome = display.newText("Nome da Música:", display.contentCenterX/2, display.contentHeight/7, "Arial Black", 16)   
        nome:setFillColor(1,1,1)
        sceneGroup:insert(nome)

        fieldNome = native.newTextField( display.contentWidth/15, display.contentHeight/5.5, display.contentWidth*0.85, display.contentHeight/15 )
        fieldNome.anchorX = 0
        fieldNome.anchorY = 0
        sceneGroup:insert(fieldNome)
        fieldNome:addEventListener( "userInput", userImputNome )


        local autor = display.newText("Autor:", display.contentCenterX/5, display.contentHeight/3.5, "Arial Black", 16)   
        autor:setFillColor(1,1,1)
        sceneGroup:insert(autor)

        fieldAutor = native.newTextField( display.contentWidth/15, display.contentHeight/3, display.contentWidth*0.85, display.contentHeight/15 )
        fieldAutor.anchorX = 0
        fieldAutor.anchorY = 0
        sceneGroup:insert(fieldAutor)
        fieldAutor:addEventListener( "userInput", userImputAutor )

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene