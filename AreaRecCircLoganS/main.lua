-- Title: AreaOfRectangleAndCircle
-- Name: Logan Sweeney
-- Course: ICS2O/3C
-- This program...

--Create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
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

areaOfRectangle = widthOfRectangle