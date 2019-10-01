display.setStatusBar (display.HiddenStatusBar)

local backgroundImage = display.newImageRect ("Images/ground.jpg", 2048, 1536) 
local reaper = display.newImageRect ("Images/reaper.png", 200, 200)
local reaperWidth = reaper.reaperWidth
local reaperHeight = reaper.height


local squidward = display.newImageRect ("Images/squidward.png", 200, 200)
local squidwardWidth = squidward.Width
local squidwardHeight = squidward.height

local alreadyTouchedReaper = false
local alreadyTouchedSquidward = false

reaper.x = 400
reaper.y = 500

squidward.x = 300
squidward.y = 200

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