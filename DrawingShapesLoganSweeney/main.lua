display.setStatusBar (display.HiddenStatusBar)

local triangleVerticies = {-120, 50, 120, 50, 0, -80 }
local Triangle =  display.newPolygon(510 ,375, triangleVerticies)

display.setDefault ("background", 0/255, 255/255, 0/255)

local paralellogramVerticies = {0, 1, 3, 0, 5, -2, 2, -1}
local Paralellogram = display.newPolygon(700, 600, paralellogramVerticies)