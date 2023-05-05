--===================================================================================
--             Name:    Data
-------------------------------------------------------------------------------------
--      Description:    Data structure and functions
--===================================================================================


-------------------------------------------------------------------------------------
--      Description:    Set base data structure       
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:    
-------------------------------------------------------------------------------------
function Data.New()

    Data.group  = {}   -- list of group data
    Data.group.lastID = 0

    Data.folder  = {}   -- list of folder data
    Data.folder.lastID = 0

    Data.options = {}   -- list of options data

    Data.selectedGroupIndex = nil
    Data.moveMode = false

    Data.trackGroupEffects = true
    Data.trackTargetEffects = false

end
