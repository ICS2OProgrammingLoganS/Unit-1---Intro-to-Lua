--Title: Whack A Mole
--Name: Logan Sweeney
--Course: ICS2O
-- This Program has a mole appear on the screen, and if
-- the user clicks on it, it will disappear and reappear in
-- a different place.

display.setStatusBar (display.HiddenStatusBar)

-- Create the background
local background = display.newImageRect("Images/Garden.jpg", 2048, 1536)

local points = 0
local pointsText





--creating mole
local moleObject = display.newImage("Images/mole.png")

	--setting mole pos
	moleObject.x = display.contentCenterX
	moleObject.y = display.contentCenterY

	moleObject.width = display.contentWidth/5
	moleObject.height = display.contentHeight/5

	moleObject.isVisible = false

--------------- FUNCTIONS -----------------
function MolePopUp()

	-- Choosing random pos on the screen between 0 and the size of the screen
	moleObject.x = math.random (0, display.contentWidth)
	moleObject.y = math.random (0, display.contentHeight)

	moleObject.isVisible = true
	timer.performWithDelay(500, MoleHide)
end

function PopUpDelay()
	timer.performWithDelay(3000, MolePopUp)
end

function MoleHide()
	moleObject.isVisible = false
	PopUpDelay()
end

function StartGame()
	PopUpDelay()
end


function WhackedMole(event)

	--if touch phase just started
	if (event.phase == "began") then
		points = points + 1
		pointsText.text = "Moles Whacked:" .. points .. ""

 end

end

pointsText = display.newText ("Moles Whacked: " .. points, display.contentWidth/4.8, display.contentHeight/30, nil, 50)


-----------------EVENT LISTENERS -------------------
moleObject:addEventListener("touch", WhackedMole)

StartGame()