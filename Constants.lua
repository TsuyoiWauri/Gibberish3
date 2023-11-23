--=================================================================================================
--= Constants        
--= ===============================================================================================
--= definitions for globaly used constants
--=================================================================================================



---------------------------------------------------------------------------------------------------
Language = {}

-- used language
Language.Local = 1

-- determine used language by checking for existence of commands
if Turbine.Shell.IsCommand("hilfe") then
    Language.Local = 2
elseif Turbine.Shell.IsCommand("aide") then
    Language.Local = 3
end

-- language constants
Language.English = 1
Language.German  = 2
Language.French  = 3
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- trigger action times
Actions          = {}
Actions.Add      = 1
Actions.Remove   = 2
Actions.Reset    = 3
---------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------
-- option defaults
Options.Defaults                        = {}
-- delay until tooltip ist displayed
Options.Defaults.tooltipActivationDelay = 1
---------------------------------------------------------------------------------------------------