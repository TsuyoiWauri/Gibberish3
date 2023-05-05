
--===================================================================================
--             Name:    STRUCTS - Trigger
-------------------------------------------------------------------------------------
--      Description:    Trigger structure and functions
--===================================================================================





-------------------------------------------------------------------------------------
--      Description:     return the base structure for creating a new trigger 
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:    trigger struct
-------------------------------------------------------------------------------------
function Trigger.GetStruct(type)

    local trigger = {}

    trigger.id              = Turbine.Engine.GetGameTime()
    trigger.enabled         = true
    trigger.type            = type
    trigger.token           = Trigger.Defaults[type].token
    trigger.useRegex        = Trigger.Defaults[type].useRegex
    trigger.description     = Trigger.Defaults[type].description
    trigger.action          = Action.Add
    trigger.listOfTargets   = Trigger.Defaults[type].listOfTargets

    return trigger

end


-------------------------------------------------------------------------------------
--      Description:     
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:    
-------------------------------------------------------------------------------------
function Trigger.New(type)

    return Trigger.GetStruct(type)

end


-------------------------------------------------------------------------------------
--      Description:     
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:    
-------------------------------------------------------------------------------------
function Trigger.Delete()


end