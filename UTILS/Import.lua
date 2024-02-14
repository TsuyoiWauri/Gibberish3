--=================================================================================================
--= Import Functions        
--= ===============================================================================================
--= 
--=================================================================================================

---------------------------------------------------------------------------------------------------
function StringToData( text, insert )

    local type
    type, text = GetStringType( text )

    if type == nil then
        return
    end

    local type_number = tonumber(type)

    if type_number == ImportType.Window then
        local folder = nil
        if insert == true then
            if Data.selectedIndex > 0 then
                -- insert into the same folder as the selected window
                folder = Data.window[ Data.selectedIndex ].folder
            elseif Data.selectedIndex < 0 then
                -- insert into the selected folder
                folder = Data.selectedIndex *(-1)
            end
        end
        -- remove <window> tags
        text = string.gsub( text, "<window>", "")
        StringToWindow( text, folder )

    elseif type_number == ImportType.Timer then
        local window_data
        if insert == true and Data.selectedIndex > 0 then
            window_data = Data.window[ Data.selectedIndex ]
        else
            window_data = Window.New("Imported Timers " .. (Data.window.lastID + 1) )
        end
        text = string.gsub( text, "<timer>", "")
        StringToTimer( text, window_data )

    elseif type_number == ImportType.Trigger then
        if insert == false or Data.selectedIndex < 1 or Data.selectedTimerIndex < 1 then
            return
        end
        text = string.gsub( text, "<trigger>", "")
        StringToTrigger( text, Data.window[ Data.selectedIndex ].timerList[ Data.selectedTimerIndex ] )

    elseif type_number == ImportType.Folder then

    elseif type_number == ImportType.WindowList then
        local folder = nil
        if insert == true then
            if Data.selectedIndex > 0 then
                -- insert into the same folder as the selected window
                folder = Data.window[ Data.selectedIndex ].folder
            elseif Data.selectedIndex < 0 then
                -- insert into the selected folder
                folder = Data.selectedIndex *(-1)
            end
        end
        local list = Split( text, "<window>")
        for index, value in ipairs(list) do
            StringToWindow( value, folder )
        end

    elseif type_number == ImportType.TimerList then
        local window_data
        if insert == true and Data.selectedIndex > 0 then
            window_data = Data.window[ Data.selectedIndex ]
        else
            window_data = Window.New("Imported Timers " .. (Data.window.lastID + 1) )
        end
        local list = Split( text, "<timer>")
        for index, value in ipairs(list) do
            StringToTimer( value, window_data )
        end

    elseif type_number == ImportType.TriggerList then

    end

	Options.Window.Object:ResetSelectedContent()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function StringToWindow( text, folder )

    -- list[1] = window data with window triggers
    -- list[2-X] = timer data
    local list = Split( text, "<timer>")

    -- text can not be processed
    if list[1] == nil then
        return
    end

    -- seperate window and timer
    local window_string_with_trigger = list[1]
    local timer_strings = {}
    for i = 2, #list do
        timer_strings[#timer_strings+1] = list[i]
    end

    -- list[1] = window data
    -- list[2-X] = trigger data
    local list2 = Split( window_string_with_trigger, "<trigger>")

    -- text can not be processed
    if list2[1] == nil then
        return
    end

    -- seperate window and trigger
    local window_string = list2[1]
    local trigger_strings = {}
    for i = 2, #list2 do
        trigger_strings[#trigger_strings+1] = list2[i]
    end

    local window_attribut_strings = Split( window_string, "}_")

    -- text can not be processed
    if #window_attribut_strings == 0 then
        return
    end

    -- split attributes in key and value
    local window_attributes = {}
    for index, value in ipairs(window_attribut_strings) do
        local tmp_list = Split(value, "_{")

        -- should always be 2 key and value
        if #tmp_list == 2 then
            -- insert into window attributes
            window_attributes[ tmp_list[1] ] = tmp_list[2]
        end
    end

    -- text can not be processed
    if window_attributes["name"] == nil or window_attributes["type"] == nil then
        return
    end
    -- create new window
    local index = Window.New( window_attributes["name"], tonumber(window_attributes["type"]))
    local data = Data.window[ index ]

    -- overwrite attributes
    if window_attributes["nextTimerSortIndex"] ~= nil then
        data.nextTimerSortIndex    = tonumber(window_attributes["nextTimerSortIndex"])
    end

    -- folder from parameters
    data.folder                = folder

    if window_attributes["timerType"] ~= nil then
        data.timerType             = tonumber(window_attributes["timerType"])
    end

    if window_attributes["enabled"] ~= nil then
        data.enabled               = ToBool(window_attributes["enabled"])
    end

    if window_attributes["saveGlobaly"] ~= nil then
        data.saveGlobaly           = ToBool(window_attributes["saveGlobaly"])
    end

    if window_attributes["description"] ~= nil then
        data.description           = window_attributes["description"]
    end

    if window_attributes["resetOnTargetChanged"] ~= nil then
        data.resetOnTargetChanged  = ToBool(window_attributes["resetOnTargetChanged"])
    end

    if window_attributes["useTargetEntity"] ~= nil then
        data.useTargetEntity       = ToBool(window_attributes["useTargetEntity"])
    end

    if window_attributes["left"] ~= nil then
        data.left                  = tonumber(window_attributes["left"])
    end

    if window_attributes["top"] ~= nil then
        data.top                   = tonumber(window_attributes["top"])
    end

    if window_attributes["width"] ~= nil then
        data.width                 = tonumber(window_attributes["width"])
    end

    if window_attributes["height"] ~= nil then
        data.height                = tonumber(window_attributes["height"])
    end

    if window_attributes["frame"] ~= nil then
        data.frame                 = tonumber(window_attributes["frame"])
    end

    if window_attributes["spacing"] ~= nil then
        data.spacing               = tonumber(window_attributes["spacing"])
    end

    if window_attributes["direction"] ~= nil then
        data.direction             = ToBool(window_attributes["direction"])
    end

    if window_attributes["orientation"] ~= nil then
        data.orientation           = ToBool(window_attributes["orientation"])
    end

    if window_attributes["overlay"] ~= nil then
        data.overlay               = ToBool(window_attributes["overlay"])
    end

    if window_attributes["color1"] ~= nil then
        data.color1                = StringToColor( window_attributes["color1"] )
    end

    if window_attributes["color2"] ~= nil then
        data.color2                = StringToColor( window_attributes["color2"] )
    end

    if window_attributes["color3"] ~= nil then
        data.color3                = StringToColor( window_attributes["color3"] )
    end

    if window_attributes["color4"] ~= nil then
        data.color4                = StringToColor( window_attributes["color4"] ) 
    end

    if window_attributes["color5"] ~= nil then
        data.color5                = StringToColor( window_attributes["color5"] )
    end

    if window_attributes["opacityActiv"] ~= nil then
        data.opacityActiv          = tonumber(window_attributes["opacityActiv"])
    end

    if window_attributes["opacityPassiv"] ~= nil then
        data.opacityPassiv         = tonumber(window_attributes["opacityPassiv"])
    end

    if window_attributes["font"] ~= nil then
        data.font                  = tonumber(window_attributes["font"])
    end

    if window_attributes["fontSize"] ~= nil then
        data.fontSize              = tonumber(window_attributes["fontSize"])
    end

    if window_attributes["durationFormat"] ~= nil then
        data.durationFormat        = tonumber(window_attributes["durationFormat"])
    end

    if window_attributes["textAlignment"] ~= nil then
        data.textAlignment         = tonumber(window_attributes["textAlignment"])
    end

    if window_attributes["timerAlignment"] ~= nil then
        data.timerAlignment        = tonumber(window_attributes["timerAlignment"])
    end

    if window_attributes["showTimer"] ~= nil then
        data.showTimer             = ToBool(window_attributes["showTimer"])
    end

    -- add window triggers
    for i, trigger_string in ipairs(trigger_strings) do
        StringToTrigger( trigger_string, data )
    end

    -- add timers
    for i, timer_string in ipairs(timer_strings) do
        StringToTimer( timer_string, data )
    end
end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function StringToTimer( text, parent )

    -- list[1] = window data
    -- list[2-X] = trigger data
    local list2 = Split( text, "<trigger>")

    -- text can not be processed
    if list2[1] == nil then
        return
    end

    -- seperate window and trigger
    local timer_string = list2[1]
    local trigger_strings = {}
    for i = 2, #list2 do
        trigger_strings[#trigger_strings+1] = list2[i]
    end

    local timer_attribut_strings = Split( timer_string, "}_")

    -- text can not be processed
    if #timer_attribut_strings == 0 then
        return
    end

    -- split attributes in key and value
    local timer_attributes = {}
    for index, value in ipairs(timer_attribut_strings) do
        local tmp_list = Split(value, "_{")

        -- should always be 2 key and value
        if #tmp_list == 2 then
            -- insert into window attributes
            timer_attributes[ tmp_list[1] ] = tmp_list[2]
        end
    end

    -- text can not be processed
    if  timer_attributes["type"] == nil then
        return
    end

    local type = tonumber( timer_attributes["type"] )
    local data = Timer.New( type )

    if timer_attributes["id"] ~= nil then
        data.id              = tonumber(timer_attributes["id"])
    end
    
    if timer_attributes["nextTriggerSortIndex"] ~= nil then
        data.nextTriggerSortIndex              = tonumber(timer_attributes["nextTriggerSortIndex"])
    end

    if timer_attributes["enabled"] ~= nil then
        data.enabled              = ToBool(timer_attributes["enabled"])
    end
    
    if timer_attributes["sortIndex"] ~= nil then
        data.sortIndex              = tonumber(timer_attributes["sortIndex"])
    end
    
    data.type              = type

    
    if timer_attributes["description"] ~= nil then
        data.description              = tostring(timer_attributes["description"])
    end
    
    if timer_attributes["permanent"] ~= nil then
        data.permanent              = ToBool(timer_attributes["permanent"])
    end
    
    if timer_attributes["stacking"] ~= nil then
        data.stacking              = ToBool(timer_attributes["stacking"])
    end
    
    if timer_attributes["loop"] ~= nil then
        data.loop              = ToBool(timer_attributes["loop"])
    end
    
    if timer_attributes["reset"] ~= nil then
        data.reset              = ToBool(timer_attributes["reset"])
    end
    
    if timer_attributes["unsCustomTimer"] ~= nil then
        data.unsCustomTimer              = ToBool(timer_attributes["unsCustomTimer"])
    end
    
    if timer_attributes["timerValue"] ~= nil then
        data.timerValue              = tonumber(timer_attributes["timerValue"])
    end
    
    if timer_attributes["counterEND"] ~= nil then
        data.counterEND              = tonumber(timer_attributes["counterEND"])
    end
    
    if timer_attributes["counterSTART"] ~= nil then
        data.counterSTART              = tonumber(timer_attributes["counterSTART"])
    end
    
    if timer_attributes["icon"] ~= nil then
        data.icon              = tonumber(timer_attributes["icon"])
    end
    
    if timer_attributes["showIcon"] ~= nil then
        data.showIcon              = ToBool(timer_attributes["showIcon"])
    end
    
    if timer_attributes["textOption"] ~= nil then
        data.textOption              = tonumber(timer_attributes["textOption"])
    end
    
    if timer_attributes["textValue"] ~= nil then
        data.textValue              = tostring(timer_attributes["textValue"])
    end
    
    if timer_attributes["direction"] ~= nil then
        data.direction              = ToBool(timer_attributes["direction"])
    end
    
    if timer_attributes["useThreshold"] ~= nil then
        data.useThreshold              = ToBool(timer_attributes["useThreshold"])
    end
    
    if timer_attributes["thresholdValue"] ~= nil then
        data.thresholdValue              = tonumber(timer_attributes["thresholdValue"])
    end
    
    if timer_attributes["useAnimation"] ~= nil then
        data.useAnimation              = ToBool(timer_attributes["useAnimation"])
    end
    
    if timer_attributes["animationSpeed"] ~= nil then
        data.animationSpeed              = tonumber(timer_attributes["animationSpeed"])
    end
    
    if timer_attributes["animationType"] ~= nil then
        data.animationType              = tonumber(timer_attributes["animationType"])
    end

    if timer_attributes["useShadow"] ~= nil then
        data.useShadow              = ToBool(timer_attributes["useShadow"])
    end

    -- add triggers
    for i, trigger_string in ipairs(trigger_strings) do
        StringToTrigger( trigger_string, data )
    end

    parent.timerList[ #parent.timerList + 1 ] = data

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function StringToTrigger( text, parent )

    local trigger_attribut_strings = Split( text, "}_")

    -- text can not be processed
    if #trigger_attribut_strings == 0 then
        return
    end

    -- split attributes in key and value
    local trigger_attributes = {}
    for index, value in ipairs(trigger_attribut_strings) do
        local tmp_list = Split(value, "_{")

        -- should always be 2 key and value
        if #tmp_list == 2 then
            -- insert into window attributes
            trigger_attributes[ tmp_list[1] ] = tmp_list[2]
        end
    end

    -- text can not be processed
    if  trigger_attributes["type"] == nil then
        return
    end

    local type = tonumber( trigger_attributes["type"] )
    local data = Trigger.New( type )

    if trigger_attributes["id"] ~= nil then
        data.id              = tonumber(trigger_attributes["id"])
    end

    if trigger_attributes["enabled"] ~= nil then
        data.enabled         = ToBool(trigger_attributes["enabled"])
    end

    if trigger_attributes["token"] ~= nil then
        data.token           = trigger_attributes["token"]
    end
    
    if trigger_attributes["icon"] ~= nil then
        data.icon            = tonumber(trigger_attributes["icon"])
    end
    
    if trigger_attributes["useRegex"] ~= nil then
        data.useRegex        = ToBool(trigger_attributes["useRegex"])
    end
    
    if trigger_attributes["description"] ~= nil then
        data.description     = trigger_attributes["description"]
    end
    
    if trigger_attributes["action"] ~= nil then
        data.action          = tonumber(trigger_attributes["action"])
    end
    
    if trigger_attributes["value"] ~= nil then
        data.value           = trigger_attributes["value"]
    end
    
    if trigger_attributes["listOfTargets"] ~= nil then
        data.listOfTargets   = StringOfTargetsToList( trigger_attributes["listOfTargets"] )
    end
    
    if trigger_attributes["source"] ~= nil then
        data.source          = tonumber(trigger_attributes["source"])
    end

    parent[ type ][ #parent[ type ] + 1 ] = data

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function StringToFolder( text, insert )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function GetStringType( text )

    local i, j = string.find( text, "Gibberish3/%d")
    if i == nil then
        return nil
    end

    -- type
    local k = i + j - 1
    local type = string.sub( text, k, k)
    text = string.gsub( text, "Gibberish3/%d", "")

    return type, text

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function StringToColor( text )

    local rows = Split( text, ">_" )

    if #rows ~= 4 then
        return {R=1, G=1, B=1}
    end

    local color = {}

    for i, v in ipairs(rows) do
        local tmp_list = Split( v, "_<")
        if #tmp_list == 2 then
            color[tmp_list[1] ] = tonumber( tmp_list[2] )
        end
    end

    -- fix if necessary
    if color.R == nil then
        color.R = 1
    end

    if color.G == nil then
        color.G = 1
    end

    if color.B == nil then
        color.B = 1
    end

    return color

end
---------------------------------------------------------------------------------------------------
