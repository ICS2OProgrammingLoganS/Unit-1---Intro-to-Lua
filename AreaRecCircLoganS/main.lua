-- Title: AreaOfRectangleAndCircle
-- Name: Logan Sweeney
-- Course: ICS2O/3C
-- This program...

--Create my local variables
local areaText
local textSize = 37
local myRectangle
local widthOfRectangle = 290
local heightOfRectangle = 190
local areaOfRectangleh

-- set the background colour
display.setDefault ("background", 0/255, 100/255, 255/255)

display.setStatusBar (display.HiddenStatusBar)

myRectangle = display.newRect (0, 0, widthOfRectangle, heightOfRectangle)

myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

myRectangle.strokeWidth = 30

myRectangle:setFillColor (0/255, 255/255, 0/255)

myRectangle:setStrokeColor (255/255, 0/255, 0/255)

areaOfRectangle = widthOfRectangle * heightOfRectangle

areaText = display.newText ("The Area of this Rectangle with a width of \n" 
	.. widthOfRectangle .. " and a height of \n" 
	.. heightOfRectangle .. " is " .. areaOfRectangle .. " pixels².", 0, 0, "Times New Roman", textSize)

areaText.x = 680
areaText.y = 150

local areaCircText
local circTextSize = 37
local circRadius = 150
local PI = 3.14
local areaOfCirc
local myCirc

myCirc = display.newCircle (display.contentWidth*3/4)