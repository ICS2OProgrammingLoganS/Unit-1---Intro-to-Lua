-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: LoganS
-- Course: ICS2O
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar (display.HiddenStatusBar)

--load physics
local physics = require ("physics")

--start physics
physics.start()

-----------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------
--display the ground
local ground = display.newImage ("Images/ground.png", 0, 0)
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight/1

	-- Change the width to be the same as the screen
	ground.width = display.contentWidth

	-- Add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

local bkgMusic = audio.loadStream("Music/music.mp3")
audio.play(bkgMusic, {loop = -1})

-----------------------------------------------------------------------------------------

local beam1 = display.newImage("Images/beam_long.png")
local beam2 = display.newImage("Images/beam_long.png")

--set the x and y pos
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
beam2.x = display.contentCenterX/5
beam2.y = display.contentCenterY*1.65

beam1.x = display.contentWidth/10
beam1.y = display.contentHeight/1.2
beam2.x = display.contentWidth/1.15
beam2.y = display.contentHeight/1.2

beam1.width = display.contentWidth/0.05
beam1.height = display.contentHeight/10
beam2.width = display.contentWidth/0.05
beam2.height = display.contentHeight/10

--rotate the beam -60 degrees so its on an angle
beam1:rotate(45)
beam2:rotate(135)

--send it to the back layer
beam1:toBack()
beam2:toBack()

--add to physics
physics.addBody(beam1, "static", {friction = 0.5, bounce = 0.3})
physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.3})

--create bkg
local background = display.newImageRect("Images/bkg.png", 1536, 768)

	--set the x and y pos
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	background.x = display.contentWidth/2
	background.y = display.contentHeight/2

	--send to back
	background:toBack()

local function MoveBigBallListener(touch)
	if ((touch.phase == "moved")) then
		bigBall.x = touch.x
		bigBall.y = touch.y
	end
end

local function MoveMediumBallListener(touch)
	if ((touch.phase == "moved")) then
		mediumBall.x = touch.x
		mediumBall.y = touch.y
	end
end

local function MoveSmallBallListener(touch)
	if ((touch.phase == "moved")) then
		smallBall.x = touch.x
		smallBall.y = touch.y
	end
end

local function MoveTinyBallListener(touch)
	if ((touch.phase == "moved")) then
		tinyBall.x = touch.x
		tinyBall.y = touch.y
	end
end

local function MakeTinyBall()
	--creating first ball, tinyest ball
	local tinyBall = display.newImage("Images/super_ball.png")

	--add to physics
	physics.addBody(tinyBall, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 25})
	local function MoveTinyBallListener(touch)
		if ((touch.phase == "moved")) then
			tinyBall.x = touch.x
			tinyBall.y = touch.y
			physics.removeBody(tinyBall)
			physics.addBody(tinyBall, "static", {density = 4.0, friction = 0.5, bounce = 0.0, radius = 25})
		else 
			physics.removeBody(tinyBall)
			physics.addBody(tinyBall, {density = 4.0, friction = 0.5, bounce = 0.0, radius = 25})
		end
	end
	tinyBall:addEventListener ("touch", MoveTinyBallListener)
end

local function MakeSmallBall()
	--creating second ball, smallest ball
	local smallBall = display.newImage("Images/super_ball.png")

	smallBall.width = display.contentWidth/12
	smallBall.height = display.contentHeight/9.0
	smallBall.x = display.contentCenterX/5
	smallBall.y = display.contentCenterY*1.65

	--add to physics
	physics.addBody(smallBall, {density = 1.5, friction = 0.5, bounce = 0.5, radius = 45})

	local function MoveSmallBallListener(touch)
		if ((touch.phase == "moved")) then
			smallBall.x = touch.x
			smallBall.y = touch.y
			physics.removeBody(smallBall)
			physics.addBody(smallBall, "static", {density = 4.0, friction = 0.5, bounce = 0.0, radius = 45})
		else 
			physics.removeBody(smallBall)
			physics.addBody(smallBall, {density = 4.0, friction = 0.5, bounce = 0.0, radius = 45})
		end
	end
	smallBall:addEventListener ("touch", MoveSmallBallListener)
end

local function MakeMediumBall()
	--creating third ball, medium ball
	local mediumBall = display.newImage("Images/super_ball.png")

	mediumBall.x = display.contentCenterX/5
	mediumBall.y = display.contentCenterY*1.65
	mediumBall.width = display.contentWidth/6
	mediumBall.height = display.contentHeight/4.7

	--add to physics
	physics.addBody(mediumBall, {density = 2.0, friction = 0.5, bounce = 0.5, radius = 75})

	local function MoveMediumBallListener(touch)
		if ((touch.phase == "moved")) then
			mediumBall.x = touch.x
			mediumBall.y = touch.y
			physics.removeBody(mediumBall)
			physics.addBody(mediumBall, "static", {density = 4.0, friction = 0.5, bounce = 0.0, radius = 75})
		else 
			physics.removeBody(mediumBall)
			physics.addBody(mediumBall, {density = 4.0, friction = 0.5, bounce = 1.5, radius = 75})
		end
	end
	mediumBall:addEventListener ("touch", MoveMediumBallListener)
end


local function MakeBigBall()
	--creating fourth ball, biggest ball
	local bigBall = display.newImage("Images/super_ball.png")
	bigBall.width = display.contentWidth/4
	bigBall.height = display.contentHeight/3.1

	--add to physics
	physics.addBody(bigBall, {density = 4.0, friction = 0.5, bounce = 1.5, radius = 115})
	
	local function MoveBigBallListener(touch)
		if ((touch.phase == "moved")) then
			bigBall.x = touch.x
			bigBall.y = touch.y
			physics.removeBody(bigBall)
			physics.addBody(bigBall, "static", {density = 4.0, friction = 0.5, bounce = 1.5, radius = 115})
		else 
			physics.removeBody(bigBall)
			physics.addBody(bigBall, {density = 4.0, friction = 0.5, bounce = 1.5, radius = 115})
		end
	end
	bigBall:addEventListener ("touch", MoveBigBallListener)
end

MakeTinyBall()
MakeSmallBall()
MakeMediumBall()
MakeBigBall()