--=================================================================================================
--= Skill         
--= ===============================================================================================
--= trigger from skill reset time changed
--=================================================================================================



---------------------------------------------------------------------------------------------------
-- skill event processing start up
---------------------------------------------------------------------------------------------------
Trigger[Trigger.Types.Skill].Init = function ()

    local listOfSkills = LocalPlayer:GetTrainedSkills()

    for i = 1, listOfSkills:GetCount(), 1 do

        local skill = listOfSkills:GetItem(i)

        if Trigger[ Trigger.Types.Skill ].IsSkillUsed( skill:GetSkillInfo():GetName() ) then

            function skill.ResetTimeChanged( sender, args )

                Trigger[ Trigger.Types.Skill ].SkillUsed( skill )
                
            end

            if skill:GetResetTime() > 0 then

                Trigger[ Trigger.Types.Skill ].SkillUsed( skill )

            end
            
        end
        
    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- return if skill is used by any trigger
---------------------------------------------------------------------------------------------------
Trigger[Trigger.Types.Skill].IsSkillUsed = function (skillName)

    -- all groups
    for windowIndex, windowData in ipairs(Data.window) do                                      
                 
        -- check if group is enabled
        if windowData.enabled == true then                                                   

            -- all timer of the group
            for timerIndex, timerData in ipairs(windowData.timerList) do    

                -- check if timer is enabled
                if timerData.enabled == true then                                           
                
                    -- all skill of the timer
                    for triggerIndex, triggerData in ipairs(timerData[Trigger.Types.Skill]) do      

                        -- check if trigger is enabled
                        if triggerData.enabled == true then                                 

                            if triggerData.token == skillName then

                                return true
                                
                            end
                       
                        end
                                    
                    end
                   
                end

            end

        end

        -- check window triggers
        for triggerIndex, triggerData in ipairs(windowData[ Trigger.Types.Skill ]) do

            -- check if trigger is enabled
            if triggerData.enabled == true then                                 
                                
                if triggerData.token == skillName then

                    return true
                    
                end

            end

        end
        
    end

    return false

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- skill is used event
---------------------------------------------------------------------------------------------------
Trigger[Trigger.Types.Skill].SkillUsed = function (skill)

    local name = skill:GetSkillInfo():GetName()
    Turbine.Shell.WriteLine(name)
    -- all groups
    for windowIndex, windowData in ipairs(Data.window) do                                      

        -- check if group is enabled
        if windowData.enabled == true then                                                   

            -- all timer of the group
            for timerIndex, timerData in ipairs(windowData.timerList) do                     

                -- check if timer is enabled
                if timerData.enabled == true then                                           
                
                    -- all effect self of the timer
                    for triggerIndex, triggerData in ipairs(timerData[Trigger.Types.Skill]) do 

                        -- check if trigger is enabled
                        if triggerData.enabled == true then                                 

                            if name == triggerData.token then

                                Trigger[ Trigger.Types.Skill ].ProcessTrigger( skill, windowIndex, timerIndex, triggerIndex )
                                
                            end
                               
                        end

                    end

                end
                
            end

        end

        -- check window triggers
        for triggerIndex, triggerData in ipairs(windowData[ Trigger.Types.Skill ]) do

            -- check if trigger is enabled
            if triggerData.enabled == true then                                 
                                
                if triggerData.token == name then

                    Windows.WindowAction( windowIndex, windowData, triggerData )
                                    
                end

            end

        end

    end


end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- process skill trigger
---------------------------------------------------------------------------------------------------
Trigger[ Trigger.Types.Skill ].ProcessTrigger = function ( skill, windowIndex, timerIndex, triggerIndex )

    -- declarations
    local windowData = Data.window[windowIndex]
    local timerData = windowData.timerList[timerIndex]
    local triggerData = timerData[Trigger.Types.Skill][triggerIndex]
    local name = skill:GetSkillInfo():GetName()

    local startTime = skill:GetResetTime() - skill:GetCooldown()
    local text      = ""
    local duration  = 10
    local icon      = timerData.icon
    local entity    = nil
    local key       = nil

    local token = triggerData.token

    -- key
    -- every trigger = new timer
    if timerData.stacking == Stacking.Multi then

        key = startTime

    else

        key = nil
        
    end

    -- key
    if timerData.useKey == false then

        key = startTime
        
    end

    -- icon
    if icon == nil then
        icon = skill:GetSkillInfo():GetIconImageID()
    end

    -- text   
    if  timerData.textOption == TimerTextOptions.Token then

        text = name

    elseif timerData.textOption == TimerTextOptions.CustomText then

        text = timerData.textValue

    end

    -- duration  
    if timerData.useCustomTimer == true then
         
        duration = timerData.timerValue

    else

        duration = skill:GetResetTime() - startTime

    end

    -- window call
    Windows[ windowIndex ]:TimerAction( triggerData, timerData, timerIndex, startTime, duration, icon, text, entity, key )

end
---------------------------------------------------------------------------------------------------