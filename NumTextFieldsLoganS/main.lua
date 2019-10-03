-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question on the screen and asks the user to answer in a numeric textfield.

--hide status bar
display.setStatusBar (display.HiddenStatusBar)

display.setDefault("background", 121/255, 199/255, 124/255)

--VARIABLES

local questionObject
local correctObject
local numericfield
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

--FUNCTIONS

local function AskQuestion()
	--generate 2 random numbers between a max and min number.
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)
	-- User begins editing "numericfield"
	if
end
