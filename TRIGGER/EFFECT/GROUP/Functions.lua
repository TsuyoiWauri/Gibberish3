--=================================================================================================
--= Effect Group          
--= ===============================================================================================
--= trigger from effect group events
--=================================================================================================



---------------------------------------------------------------------------------------------------
-- skill event processing start up
---------------------------------------------------------------------------------------------------
Trigger[Trigger.Types.EffectGroup].Init = function ()

    -- track group
    if  Data.trackGroupEffects == true then                     

        local party = LocalPlayer:GetParty()

        -- party exists
        if party ~= nil then                                    
         
            local localPlayerName = LocalPlayer:GetName()

            -- iterate member
            for i = 1, party:GetMemberCount(), 1 do             

                local player = party:GetMember(i)

                -- if member ~= lp
                if player:GetName() ~= localPlayerName then     

                    local effects = player:GetEffects()

                    -- add
                    function effects.EffectAdded(sender, args)

                        local effect = effects:Get(args.Index)

                        -- all groups
                        for windowIndex, windowData in ipairs(Data.window) do

                            Trigger[ Trigger.Types.EffectGroup ].CheckWindows( effect, player, windowIndex, windowData )

                        end

                    end


                    -- check all activ effects
                    Trigger[ Trigger.Types.EffectGroup ].CheckAllActivEffects()

                end

            end

        end

    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- check all activ effects
---------------------------------------------------------------------------------------------------
Trigger[ Trigger.Types.EffectGroup ].CheckAllActivEffects = function ()

    local party = LocalPlayer:GetParty()

    -- if party exists
    if party ~= nil then                                        
     
        local localPlayerName = LocalPlayer:GetName()

        -- iterate member
        for i = 1, party:GetMemberCount(), 1 do                 

            local player = party:GetMember(i)

            -- member ~= lp
            if player:GetName() ~= localPlayerName then         

                local effects = player:GetEffects()

                -- iterate effects
                for j = 1, effects:GetCount(), 1 do             

                    local effect = effects:Get(j)

                    -- all groups
                    for windowIndex, windowData in ipairs(Data.window) do

                        Trigger[ Trigger.Types.EffectGroup ].CheckWindows( effect, player, windowIndex, windowData )

                    end

                end

            end

        end

    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- check windows
---------------------------------------------------------------------------------------------------
Trigger[ Trigger.Types.EffectGroup ].CheckWindows = function ( effect, player, windowIndex, windowData )

    -- only check for enabled windows
    if windowData.enabled == false then
        return
    end

    -- check window triggers
    for triggerIndex, triggerData in ipairs(windowData[ Trigger.Types.EffectGroup ]) do
        local posAdjustment = Trigger[ Trigger.Types.EffectGroup ].CheckTrigger(effect, player, triggerData)

        if posAdjustment ~= nil then
            Windows.WindowAction( windowIndex, windowData, triggerData )

        end

    end

    
    -- check the timers of the window
    for timerIndex, timerData in ipairs( windowData.timerList ) do
        Trigger[ Trigger.Types.EffectGroup ].CheckTimer(effect, player, windowIndex, timerIndex, timerData)

    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- check timer
---------------------------------------------------------------------------------------------------
Trigger[ Trigger.Types.EffectGroup ].CheckTimer = function ( effect, player, windowIndex, timerIndex, timerData )

    -- only check for enabled timers
    if timerData.enabled == false then
        return
    end

    -- check timer triggers
    for triggerIndex, triggerData in ipairs(timerData[ Trigger.Types.EffectGroup ]) do

        local posAdjustment = Trigger[ Trigger.Types.EffectGroup ].CheckTrigger(effect, player, triggerData)

        if posAdjustment ~= nil then
            -- fix posAdjustment
            posAdjustment = posAdjustment - 1
            Trigger.ProcessEffectTrigger( effect, player, posAdjustment, windowIndex, timerIndex, triggerData )

        end

    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- check trigger
---------------------------------------------------------------------------------------------------
Trigger[ Trigger.Types.EffectGroup ].CheckTrigger = function ( effect, player, triggerData )

    -- only check for enabled trigger
    if triggerData.enabled == false then
        return nil
    end

    -- check listOfTargets
    if Trigger.CheckListForName( player:GetName(), triggerData.listOfTargets ) == false then
        return nil
    end

    -- check token
    if triggerData.useRegex == true then

        return string.find( effect:GetName(), Trigger.ReplacePlaceholder(triggerData.token) )

    else

        if effect:GetName() == triggerData.token then

            return 1

        end

    end

    return nil

end
---------------------------------------------------------------------------------------------------
