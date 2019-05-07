local composer = require( "composer" )
local physics = require("physics")
 
local scene = composer.newScene()

function scene:create( event )
 
    local sceneGroup = self.view
    -- start physics
    physics.start()
    physics.setGravity(0, 32)
 
end

function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        local background = display.newRect(display.contentCenterX, display.contentCenterY, 1000, 1000)
        background:setFillColor( 53/255,235/255,242/255 )
        sceneGroup:insert( background )

        local theGround1 = display.newImage( "Assets/land.png" )
        theGround1.x = 160
        theGround1.y = display.contentHeight
        theGround1.id = "the ground"
        physics.addBody( theGround1, "static", { 
            friction = 0.5, 
            bounce = 0.3 
            } )
        sceneGroup:insert( theGround1 )


        local keemstar = display.newImage( "Assets/keemstar.jpg" )
        keemstar.x = 160
        keemstar.y = -200
        keemstar.width = 240
        keemstar.height = 180
        keemstar.id = "keemstar"
        physics.addBody( keemstar, "dynamic", { 
            friction = 0.5, 
            bounce = 0.3 
            } )
        sceneGroup:insert( keemstar )
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end

function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene