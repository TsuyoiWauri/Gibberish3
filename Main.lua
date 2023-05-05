

import "Turbine.Gameplay"
import "Turbine.UI"
import "Turbine.UI.Lotro"


import "Gibberish3.GobalVariables"
import "Gibberish3.Resources.IconIDs"

import "Gibberish3.UTILS"


import "Gibberish3.STRUCTS"
import "Gibberish3.ELEMENTS"


import "Gibberish3.Save"
import "Gibberish3.Load"


import "Gibberish3.TRIGGER"

-------------------------------------------------------------------------------------
--      Description:    TOBEDELETED 
-------------------------------------------------------------------------------------

Data.New()

local testIndex = Group.New("hi", 1)

Data.group[testIndex].width = 50
Data.group[testIndex].height = 50
Data.group[testIndex].frame = 10
-- Data.group[testIndex].color1 = {R=1, G=0, B=0}

Data.group[testIndex].timerList[1] = Timer.New(Timer.Types.BAR)
Data.group[testIndex].timerList[1].useCustomTimer = true
Data.group[testIndex].timerList[1].timerValue = "&1"
Data.group[testIndex].timerList[1].textOption = TimerTextOptions.CustomText
Data.group[testIndex].timerList[1].textValue = "Text: &2"
Data.group[testIndex].timerList[1].unique = true

Data.group[testIndex].timerList[1][Trigger.Chat][1] = Trigger.New(Trigger.Types.Chat)
Data.group[testIndex].timerList[1][Trigger.Chat][1].useRegex = true
Data.group[testIndex].timerList[1][Trigger.Chat][1].token = "pull in &1 &2"

Data.group[testIndex].timerList[2] = Timer.New(Timer.Types.ICON)
Data.group[testIndex].timerList[2].useCustomTimer = false
Data.group[testIndex].timerList[2].textOption = TimerTextOptions.NoText
Data.group[testIndex].timerList[2].textValue = "Text: &2"
Data.group[testIndex].timerList[2].unique = true
Data.group[testIndex].timerList[2].useThreshold = true

Data.group[testIndex].timerList[2][Trigger.EffectSelf][1] = Trigger.New(Trigger.Types.EffectSelf)
Data.group[testIndex].timerList[2][Trigger.EffectSelf][1].useRegex = false
Data.group[testIndex].timerList[2][Trigger.EffectSelf][1].token = "Soliloquy of Spirit"
Data.group[testIndex].timerList[2].icon = nil
Data.group[testIndex].timerList[2].useCustomTimer = true
Data.group[testIndex].timerList[2].useAnimation = true
Data.group[testIndex].timerList[2].timerValue = 10
Data.group[testIndex].timerList[2].useShadow = true
Data.group[testIndex].timerList[2].direction = Direction.Descending
Data.group[testIndex].timerList[2].animationType = IconID.Type.NewDottedBorder

Data.group[testIndex].timerList[3] = Timer.New(Timer.Types.BAR)
Data.group[testIndex].timerList[3].useCustomTimer = false
Data.group[testIndex].timerList[3].textOption = TimerTextOptions.Token
Data.group[testIndex].timerList[3].textValue = "Text: &2"
Data.group[testIndex].timerList[3].unique = true

Data.group[testIndex].timerList[3][Trigger.Skill][1] = Trigger.New(Trigger.Types.Skill)
Data.group[testIndex].timerList[3][Trigger.Skill][1].useRegex = false
Data.group[testIndex].timerList[3][Trigger.Skill][1].token = "Chord of Salvation"
Data.group[testIndex].timerList[3].icon = nil
Data.group[testIndex].timerList[3].permanent = true
Data.group[testIndex].opacityPassiv = 0.3
Data.group[testIndex].opacityActiv = 1

local testIndex2 = Group.New("bye", 1)
Data.group[testIndex2].top = 0.5

-------------------------------------------------------------------------------------
--      Description:    TOBEDELETED   
-------------------------------------------------------------------------------------

Group.OpenAll()

Trigger.InitAll()



import "Gibberish3.OPTIONS"
import "Gibberish3.ChatCommand"