-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question on the screen and asks the user to answer in a numeric textfield.

--hide status bar
display.setStatusBar (display.HiddenStatusBar)

display.setDefault("background", 121/255, 199/255, 124/255)

----------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer = 0
local incorrectObject
local points = 0
local pointsText
local randomOperator
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countdownTimer
local lives = 4
local heart1
local heart2
local heart3
local heart4
local gameOver

----------------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------------

local incorrectSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")
local incorrectSoundChannel
local correctSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")
local correctSoundChannel

----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------

local function AskQuestion()
	randomOperator = math.random (1,4)


	if (randomOperator == 1) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	
	elseif (randomOperator == 3) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
		
	elseif (randomOperator == 4) then
		--generate 2 random numbers between a max and min number.
		randomNumber1 = math.random(1, 15)
		randomNumber2 = math.random(1, 15)

		correctAnswer = randomNumber1 / randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " ÷ " .. randomNumber2 .. " = "
	end
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)
	-- User begins editing "numericfield"
	if (event.phase == "began") then

		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		--when the answer is submitted (enter key pressed) set user input to user's answer
		userAnswer = tonumber (event.target.text)

		--if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			-- give a point if user gets right answer.
			points = points + 1
			--update it in the display object
			pointsText.text = "Points: " .. points
			correctObject.isVisible = true
			correctSoundChannel = audio.play (correctSound)
			timer.performWithDelay (2000, HideCorrect)
		else
			incorrectObject.text = "You got it wrong! The correct answer was " .. correctAnswer .." !"
			incorrectSoundChannel = audio.play (incorrectSound)
			incorrectObject.isVisible = true
			timer.performWithDelay (2000, HideIncorrect)
			if (lives == 3) then
				heart1.isVisible = false
			elseif (lives == 2) then
				heart3.isVisible = false
			elseif (lives == 1) then
				heart2.isvisible = false
			elseif (lives  == 0) then
				heart4.isVisible = false
			end
		end
	end
end

local function UpdateTime()

	--decrement the number of seconds Left
	secondsLeft = seconds - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND SHOW A YOU LOSE IMAGE
		--AND CANCEL THE TIMER REMOVE THE THIRD FOURTH HEART BY MAKING IT INVISIBLE
		if (lives == 3) then
			heart4.isVisible = false
		elseif (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isvisible = false
		elseif (lives  == 0) then
			heart4.isVisible = false
		end
-- *** CALL THE FUNCTION TO ASK A NEW QUESTION
		AskQuestion()
    end 
end

-- function that calls the timer
local function StartTimer()
	--create a countdown timer that loops infinitely
	countdownTimer = timer.performWithDelay (1000, UpdateTime, 0)
end

----------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------

--displays a question and sets the color
questionObject = display.newText ("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (255/255, 198/255, 155/255)

--create the correct text object and make it invisible
correctObject = display.newText ("Correct! You are so smart! Nice One!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor (255/255, 0/255, 0/255)
correctObject.isVisible = false

--create numeric field 
numericField = native.newTextField (display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener ("userInput", NumericFieldListener)

--create incorrect object - make it invisible
incorrectObject = display.newText ("You got it wrong! The correct answer was" .. correctAnswer .."!" , display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor (0/255, 0/255, 255/255)
incorrectObject.isVisible = false

-- display the amount of points as a text object
pointsText = display.newText ("Points: " .. points, display.contentWidth/3, display.contentHeight/3, nil, 50)

heart1 = display.newImageRect ("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect ("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect ("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect ("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

clockText 

----------------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion ()