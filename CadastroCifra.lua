local composer = require( "composer" )
local cifra = require( "Cifra" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
local bg
local title
local button

--[[function mudarCena(event)

composer.gotoScene("Jogo", {effect = "slideLeft",time = 500})

end]]

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    bg = display.newRect(display  .contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    bg:setFillColor(1,1,1)
    sceneGroup:insert(bg)

    title = display.newText("Cadastro Cifra", display.contentCenterX, display.contentCenterY/9, "Arial Black", 20)
    title:setFillColor(0, 0.5, 1 )
    sceneGroup:insert(title)

    button = display.newRect(display.contentCenterX, display.contentCenterY*1.7, display.contentWidth/3, display.contentHeight/13 )
    button:setFillColor(0, 0.5, 1 )
    sceneGroup:insert(button)

    button:addEventListener("tap", mudarCena)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
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