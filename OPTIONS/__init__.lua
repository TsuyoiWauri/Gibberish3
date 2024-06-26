--=================================================================================================
--= Options      
--= ===============================================================================================
--= 
--=================================================================================================




---------------------------------------------------------------------------------------------------
-- elements table
Options.Elements = {}
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- import elements
import "Gibberish3.OPTIONS.ELEMENTS.CheckBox"
import "Gibberish3.OPTIONS.ELEMENTS.Tooltip"
import "Gibberish3.OPTIONS.ELEMENTS.RIGHT_CLICK_MENU"
import "Gibberish3.OPTIONS.ELEMENTS.DROPDOWN"
import "Gibberish3.OPTIONS.ELEMENTS.TABWINDOW"
import "Gibberish3.OPTIONS.ELEMENTS.TRIGGERLISTBOX"
import "Gibberish3.OPTIONS.ELEMENTS.TIMERLISTBOX"

import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.TextBoxRow"
import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.NumberBoxRow"
import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.IconBoxRow"
import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.ColorBoxRow"
import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.CheckBoxRow"
import "Gibberish3.OPTIONS.ELEMENTS.OPTIONS_ROW.DropDownRow"
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- import the rest
import "Gibberish3.OPTIONS.SHORTCUT.Window"
import "Gibberish3.OPTIONS.WINDOW"
import "Gibberish3.OPTIONS.MOVE.Window"
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- import option functions
import "Gibberish3.OPTIONS.Functions"
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- create objects
Options.Shortcut.Object = Options.Shortcut.Constructor()

-- if Data.moveMode == true then
--     Options.Move.Object     = Options.Move.Constructor()
-- else
--     Options.Move.Object     = nil
-- end
---------------------------------------------------------------------------------------------------
 
---------------------------------------------------------------------------------------------------
-- create objects
Options.Elements.TooltipObject = Options.Elements.Tooltip()
---------------------------------------------------------------------------------------------------
