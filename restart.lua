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

highscore = 0
		--for highscore get value from file and compare woth highscore
			local path = system.pathForFile( "MyFile.txt", system.ResourceDirectory )

			local file = io.open( path, "r" )
			local savedData = file:read( "*n" )
			highscore = savedData
			io.close( file )
			file = nil
			print(highscore)


	local screenGroup = self.view
	
	background = display.newImage("restart11.png")
	background:setReferencePoint(display.BottomLeftReferencePoint)
	background.x=-50
	screenGroup:insert(background)
	

	playag= display.newImage("playag.png")
	playag:setReferencePoint(display.BottomLeftReferencePoint)
	playag.x=140
	playag.y=100
	screenGroup:insert(playag)
	
	
	 scoreTxt1 = display.newText( "Your Score: 0", 0, 0, "Helvetica", 30 )
	scoreTxt1:setReferencePoint(display.TopLeftReferencePoint)
	scoreTxt1.x = display.screenOriginX + 200
	scoreTxt1.y = display.screenOriginY + 190
	scoreTxt1.isVisible = true
	
	
	
	
	--timer.performWithDelay(1000, dispScore, 1)	
	 screenGroup:insert(scoreTxt1)
	 
	
 highscoreTxt1 = display.newText( "High Score: 0", 0, 0, "Helvetica", 30 )
	highscoreTxt1:setReferencePoint(display.TopLeftReferencePoint)
	highscoreTxt1.x = display.screenOriginX + 200
	highscoreTxt1.y = display.screenOriginY + 150
	highscoreTxt1.isVisible = true	
	 screenGroup:insert(highscoreTxt1)
	
	

end





function start(event)
	if event.phase == "began" then
	
	storyboard.gotoScene("game", "fade", 100)
	end
end



function scene:enterScene(event)


	storyboard.purgeScene("game")
	playag:addEventListener("touch",start)
	-- Get parameter from prev scene
	  params = event.params
	scoreTxt1.text = string.format("Your Score: %d", params.score1)
-- for highscore , chk score and insert in file
	print( params.score1 ) 	
		if params.score1 > highscore then
  
		highscore = params.score1
		local saveData = params.score1

		local path = system.pathForFile( "MyFile.txt", system.ResourceDirectory )

		local file = io.open( path, "w" )
		file:write( saveData )

		io.close( file )
		file = nil
		end
	
	highscoreTxt1.text = string.format("High Score: %d", highscore)
	
	
	
end
function dispScore()
	
    
     	-- print(score)
end


function scene:exitScene(event)
	playag:removeEventListener("touch",start)
	
end


function scene:destroyScene(event)

end


scene:addEventListener("createScene" , scene)
scene:addEventListener("enterScene" , scene)
scene:addEventListener("exitScene" , scene)
scene:addEventListener("destroyScene" , scene)

return scene
