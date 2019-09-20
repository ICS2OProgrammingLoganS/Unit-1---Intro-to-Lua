-- Title: HelloWorld
-- Name: Logan S
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.

-- Print to the command terminal
print ("Hello 3rd grader I am working with!")
print ("This Class is Awesome!!!!!!!!!!!!!!")

--Hide the status bar
display.setStatusBar (display.HiddenStatusBar)

display.setDefault ("background",0/255,255/255,0/255)

--Create a text textObject

textObject=display.newText("Bruh.", 300, 500, 'Times New Roman', 200)

textObject:setTextColor(255/255, 0/255, 0/255)

local textObjectSignature

textObjectSignature = display.newText("By: Logan", 500, 700, "Consolas", 55)

textObjectSignature:setTextColor(0/255, 0/255, 255/255)