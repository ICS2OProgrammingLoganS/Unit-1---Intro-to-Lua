-- Title: MovingImages
-- Name: Logan S
-- Course: ICS2O/3C
-- This program moves a spaceship 
  -- around the screen and maybe spins, 
  --changes direction, and much more

  display.setStatusBar (display.HiddenStatusBar)

  scrollSpeed = 3

  local backgroundImage = display.newImageRect ("Images/Space.png", 2048, 1536)