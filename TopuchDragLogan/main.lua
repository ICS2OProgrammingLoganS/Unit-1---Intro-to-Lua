-- Title: TouchAndDrag
-- Name: Your Name
-- Course: ICS2O/3C
-- This program has 2 images that are able to be dragged around the screen 
-- if you click and hold your mouse on it.

--hide the status bar
display.setStatusBar (display.HiddenStatusBar)

--local variables. I am still trying to get the x-value to set properly.
local backgroundImage = display.newImageRect ("Images/ground.jpg", 2048, 1536) 
local reaper = display.newImageRect ("Images/reaper.png", 200, 200)
local reaperWidth = reaper.reaperWidth
local reaperHeight = reaper.height


local squidward = display.newImageRect ("Images/squidward.png", 200, 200)
local squidwardWidth = squidward.Width
local squidwardHeight = squidward.height

--my boolean variables to keep track of which object I touched first
local alreadyTouchedReaper = false
local alreadyTouchedSquidward = false

--set the initiaL x and y position of my image
reaper.x = 400
reaper.y = 500

squidward.x = 510
squidward.y = 375

-- Function: SquidwardListener
-- Input: touch Listener
-- Output:none
-- Description:
local function SquidwardListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedReaper == false) then
			alreadyTouchedSquidward = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedSquidward == true) ) then
		squidward.x = touch.x
		squidward.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedSquidward = false
		alreadyTouchedReaper = false
	end
end

squidward:addEventListener ("touch", SquidwardListener)

local function ReaperListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedSquidward == false) then
			alreadyTouchedReaper = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedReaper == true) ) then
		reaper.x = touch.x
		reaper.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedReaper = false
		alreadyTouchedSquidward = false
	end
end

reaper:addEventListener ("touch", ReaperListener)

