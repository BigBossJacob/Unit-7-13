local composer = require( "composer" )
 
local scene = composer.newScene()

local function showScene2 ()

    local options = {
        effect = "fade",
        time = 3000
    }
    composer.gotoScene( "menu", options)
end

function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
        local background = display.newRect ( 0, 0, 1000, 1500)
        background:setFillColor(255, 0, 0)
        sceneGroup:insert(background)


        local myText = display.newText( "Epic Gamer Time", 160, 240, native.systemFont, 30)
        myText:setFillColor( 255/255, 255/255, 255/255 )
        sceneGroup:insert(myText)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
         timer.performWithDelay( 3000, showScene2 )
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