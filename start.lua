-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------
--requires
local storyboard = require "storyboard"
local scene = storyboard.newScene()


-- Your code here
function scene:createScene(event)
	local screenGroup = self.view
	
	
	
	background = display.newImage("bg11.png")
	background:setReferencePoint(display.BottomLeftReferencePoint)
	background.x=-50
	screenGroup:insert(background)
	
	start21 = display.newImage("start12.png")
	start21:setReferencePoint(display.BottomLeftReferencePoint)
	start21.x=140
	start21.y=200
	screenGroup:insert(start21)
	
	

end

function start(event)
	if event.phase == "began" then
	storyboard.gotoScene("game", "fade", 100)
	end
end

function scene:enterScene(event)
	start21:addEventListener("touch", start)
	
end


function scene:exitScene(event)
	start21:removeEventListener("touch", start)
end


function scene:destroyScene(event)

end


scene:addEventListener("createScene" , scene)
scene:addEventListener("enterScene" , scene)
scene:addEventListener("exitScene" , scene)
scene:addEventListener("destroyScene" , scene)

return scene
