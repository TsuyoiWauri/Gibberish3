--===================================================================================
--             Name:    COUNTER Functions
-------------------------------------------------------------------------------------
--      Description:    
--===================================================================================







-------------------------------------------------------------------------------------
--      Description:    constructor array workaround
-------------------------------------------------------------------------------------
--        Parameter:    index
--                      data
-------------------------------------------------------------------------------------
--           Return:    group template element
-------------------------------------------------------------------------------------
Group.Constructor[Group.Types.COUNTER] = function (index, data)

    return COUNTER.CounterElement(index, data)

end



-------------------------------------------------------------------------------------
--      Description:    returns a list of all allowed timers
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:    list of all allowed timers for group listbox
-------------------------------------------------------------------------------------
Group.GetAllowedTimer[Group.Types.COUNTER] = function ()

    return {    Timer.Types.COUNTER_BAR,
                Timer.Types.COUNTER_RESET }

end
