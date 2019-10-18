-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program does something when I click a button.

--set the background color
display.setDefault ("background", 255/255, 0/255, 0/255)

--hide status bar
display.setStatusBar (display.HiddenStatusBar)

--create first button, set its position and make it visible
local blackButton = display.newImageRect ("Images/black-button.png", 150, 150)
blackButton.x = display.contentWidth/2
blackButton.y = display.contentHeight/2
blackButton.isVisible = true

--create second button, set position and make invisible
local greenButton = display.newImageRect ("Images/green-button.png", 150, 150)
greenButton.x = display.contentWidth/2
greenButton.y = display.contentHeight/2
greenButton.isVisible = false

--create text object, set position, make invisible
local textObject = display.newText ("You got me!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/2
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- Function: BlackButtonListener
-- Input: Touch Listener
-- Output: none
-- Descrption: when black button touched, green button appear and black button disappear
local function BlackButtonListener(touch)
	if (touch.phase == "began") then
		blackButton.isVisible = false
		greenButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blackButton.isVisible = true
		greenButton.isVisible = false
		textObject.isVisible = false
	end
end

local function GreenButtonListener(touch)
	if (touch.phase == "began") then
		greenButton.isVisible = true
		blackButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blackButton.isVisible = false
		greenButton.isVisible = true
		textObject.isVisible = true
	end
end