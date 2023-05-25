--===================================================================================
--             Name:    Window Options
-------------------------------------------------------------------------------------
--      Description:    
--===================================================================================
Options.Constructor.WindowOptions = class(Turbine.UI.Control)





-------------------------------------------------------------------------------------
--      Description:    Window Options constructor
-------------------------------------------------------------------------------------
--        Parameter:    parent
--                      width
--                      height
-------------------------------------------------------------------------------------
--           Return:     
-------------------------------------------------------------------------------------
function Options.Constructor.WindowOptions:Constructor( parent )
	Turbine.UI.Control.Constructor( self )

    self.parent = parent

    self.currentDisplay = nil

    self:SetParent(parent)
    self:SetBackColor( Defaults.Colors.BackgroundColor2 )

    local width = 730
    local background_pos        = 5
    local heading_top           = 7
    local frame_left            = 10
    local frame_top             = 40
    local background_width      = width - 10
    local frame_width           = background_width - 10
    local heading_height        = 25
    local reset_left            = frame_left
    local save_left             = width - 80


-------------------------------------------------------------------------------------
--  background  
    self.background                   = Turbine.UI.Control()
    self.background:SetParent(          self )
    self.background:SetPosition(        background_pos, background_pos )
    self.background:SetBackColor(       Defaults.Colors.BackgroundColor1 )
    self.background:SetMouseVisible(    false )
    self.background:SetWidth(           background_width )


-------------------------------------------------------------------------------------
--  heading
    self.headingLabel                 = Turbine.UI.Label()
    self.headingLabel:SetParent(        self )
    self.headingLabel:SetTop(           heading_top )
    self.headingLabel:SetWidth(         width )
    self.headingLabel:SetHeight(        heading_height )
    self.headingLabel:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter )
    self.headingLabel:SetFont(          Defaults.Fonts.HeadingFont )
    self.headingLabel:SetMouseVisible(  false )

-------------------------------------------------------------------------------------
--  frame  
    self.frame                        = Turbine.UI.Control()
    self.frame:SetParent(               self )
    self.frame:SetPosition(             frame_left, frame_top )
    self.frame:SetBackColor(            Defaults.Colors.BackgroundColor6 )
    self.frame:SetMouseVisible(         false )
    self.frame:SetWidth(                frame_width )


-------------------------------------------------------------------------------------
--  save button
    self.saveButton                    = Turbine.UI.Lotro.Button()
    self.saveButton:SetParent(           self )
    self.saveButton:SetSize( 70, 22)
    self.saveButton:SetFont(             Defaults.Fonts.ButtonFont )
    self.saveButton:SetForeColor(        Turbine.UI.Color.White)
    self.saveButton:SetText(             L[Language.Local].Button.Save )
    self.saveButton:SetLeft(            save_left )

    function self.saveButton.Click( sender, args )

    end

    -------------------------------------------------------------------------------------
--  reset button 
    self.resetButton                    = Turbine.UI.Lotro.Button()
    self.resetButton:SetParent(           self )
    self.resetButton:SetSize( 70, 22)
    self.resetButton:SetFont(             Defaults.Fonts.ButtonFont )
    self.resetButton:SetForeColor(        Turbine.UI.Color.White)
    self.resetButton:SetText(             L[Language.Local].Button.Reset )
    self.resetButton:SetLeft(             reset_left )

    function self.resetButton.Click( sender, args )

    end

-------------------------------------------------------------------------------------
--  start

    self:SelectionChanged()

end




-------------------------------------------------------------------------------------
--      Description:    finish
-------------------------------------------------------------------------------------
--        Parameter:   
-------------------------------------------------------------------------------------
--           Return:    
-------------------------------------------------------------------------------------
function Options.Constructor.WindowOptions:SelectionChanged()

    -- single group options
    if #Data.selectedGroupIndex == 1 and #Data.selectedFolderIndex == 0 then

        self.resetButton:SetVisible(true)
        self.saveButton:SetVisible(true)
        self.frame:SetVisible(true)
        self.background:SetBackColor(       Defaults.Colors.BackgroundColor1 )

        if self.currentDisplay ~= nil then
            self.currentDisplay:SetParent(nil)
        end

        local groupIndex = Data.selectedGroupIndex[1]
        local groupData = Data.group[ Data.selectedGroupIndex[1] ]

        self.headingLabel:SetText(   "- " ..   groupData.name ..    L[Language.Local].Headings.Options )
      
        self.currentDisplay = Group.Options[ groupData.type ]
        self.currentDisplay:SetPosition(12, 42)
        self.currentDisplay:SetHeight( self.frame:GetHeight() - 4 )
        self.currentDisplay.FillContent( groupData, groupIndex )
        self.currentDisplay:SetParent(self)

    -- multi group options
    elseif #Data.selectedGroupIndex + #Data.selectedFolderIndex > 1 then



    -- single folder options
    elseif #Data.selectedGroupIndex == 0 and #Data.selectedFolderIndex == 1 then

        self.resetButton:SetVisible(true)
        self.saveButton:SetVisible(true)
        self.frame:SetVisible(true)
        self.background:SetBackColor(       Defaults.Colors.AccentColor5 )
      
        
        if self.currentDisplay ~= nil then
            self.currentDisplay:SetParent(nil)
        end

        local folderIndex = Data.selectedFolderIndex[1] 
        local folderData = Data.folder[ Data.selectedFolderIndex[1] ]
      
        self.headingLabel:SetText(   "- " ..   folderData.name ..    L[Language.Local].Headings.Options )
      
        self.currentDisplay = Folder.Options
        self.currentDisplay:SetPosition(12, 42)
        self.currentDisplay:SetHeight( self.frame:GetHeight() - 4 )
        self.currentDisplay.FillContent( folderData, folderIndex )
        self.currentDisplay:SetParent(self)

    -- multi folder options
    elseif #Data.selectedGroupIndex == 0 and #Data.selectedFolderIndex > 1 then



    -- no seletion
    else

        self.background:SetBackColor(       Defaults.Colors.BackgroundColor1 )
        self.headingLabel:SetText( "" )
        self.frame:SetVisible(false)
        self.resetButton:SetVisible(false)
        self.saveButton:SetVisible(false)
        self.headingLabel:SetText(   "- " ..       L[Language.Local].Headings.Options )
        

    end

end


-------------------------------------------------------------------------------------
--      Description:    template constructor
-------------------------------------------------------------------------------------
--        Parameter:    group data 
-------------------------------------------------------------------------------------
--           Return:    group template element
-------------------------------------------------------------------------------------
function Options.Constructor.WindowOptions:Finish()

    self:SetVisible(false)

end


-------------------------------------------------------------------------------------
--      Description:    finish and close window
-------------------------------------------------------------------------------------
--        Parameter:    
-------------------------------------------------------------------------------------
--           Return:     
-------------------------------------------------------------------------------------
function Options.Constructor.WindowOptions:SizeChanged()

    local height       = self:GetHeight()

    local background_height   = height - 10
    local frame_height        = background_height - 70
    local current_height      = frame_height - 4
    local button_top          = height - 32

    self.background:SetHeight(   background_height )
    self.frame:SetHeight(        frame_height )

    self.saveButton:SetTop( button_top )
    self.resetButton:SetTop( button_top )

    if self.currentDisplay ~= nil then
        self.currentDisplay:SetHeight( current_height )
    end

end