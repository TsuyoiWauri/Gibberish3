--=================================================================================================
--= Window level UI Elements        
--= ===============================================================================================
--= 
--=================================================================================================



---------------------------------------------------------------------------------------------------
-- timer types
Timer.Types.BAR = 1

-- timer specific tables
for index, timerType in pairs( Timer.Types ) do

    Timer[timerType] = {}

end

-- timer imports
import "Gibberish3.UI_ELEMENTS.TIMER.BAR"
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- window types
Window.Types.LISTBOX = 1

-- window specific tables
for index, windowType in pairs( Window.Types ) do

    Window[windowType] = {}

end

-- window imports
import "Gibberish3.UI_ELEMENTS.WINDOWS.LISTBOX"
---------------------------------------------------------------------------------------------------