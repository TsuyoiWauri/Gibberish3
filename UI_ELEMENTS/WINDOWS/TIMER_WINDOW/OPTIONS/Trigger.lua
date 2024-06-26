--=================================================================================================
--= Dropdown TriggerOptions
--= ===============================================================================================
--= 
--=================================================================================================



TriggerOptions = class(Turbine.UI.Control)
---------------------------------------------------------------------------------------------------
function TriggerOptions:Constructor( data )
	Turbine.UI.Control.Constructor( self )

    self.data = data

    self:SetVisible( false )

    local left = Options.Defaults.window.tab_c_left
    local top = Options.Defaults.window.tab_c_top

    self.background1 = Turbine.UI.Control()
    self.background1:SetParent(self)
    self.background1:SetPosition( Options.Defaults.window.tab_c_left, Options.Defaults.window.tab_c_top )
    -- self.background1:SetHeight( self.height + 2*Options.Defaults.window.spacing )
    self.background1:SetBackColor( Options.Defaults.window.basecolor )

    self.listbox = Options.Elements.TriggerListbox( self )
    self.listbox:SetParent( self.background1 )
    self.listbox:SetPosition( Options.Defaults.window.spacing, Options.Defaults.window.spacing )
    -- self.listbox:SetSize( 200, self.height )
    self.listbox:SetWidth( 200 )

    self.listbox:ContentChanged( self.data )
    self.triggerOptions = nil

    self:Trigger2SelectionChanged()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:TriggerClicked( index , type )

    Options.Trigger2SelectionChanged( index, type )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:SizeChanged()

    local width, height = self:GetSize()
    local content_height = height - Options.Defaults.window.tab_c_top - Options.Defaults.window.spacing

    self.background1:SetSize( width - 2*Options.Defaults.window.spacing, content_height )
    self.listbox:SetHeight( content_height - 2*Options.Defaults.window.spacing )

    if self.triggerOptions ~= nil then
        self.triggerOptions:SetWidth( width - 200 - (5*Options.Defaults.window.spacing) )
        self.triggerOptions:SetHeight( self.listbox:GetHeight() )
    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:Save()

    if self.triggerOptions == nil  then
        return
    end

    self.triggerOptions:Save()
    self.listbox:UpdateData()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:Reset()

    if self.triggerOptions == nil  then
        return
    end

    self.triggerOptions:Reset()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:LanguageChanged()

    if self.triggerOptions == nil then
        return
    end

    self.triggerOptions:LanguageChanged()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:Show()

    self:SetVisible( true )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:Hide()

    self:SetVisible( false )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:Trigger2SelectionChanged()

    self.listbox:Trigger2SelectionChanged()

    -- close old
    if self.triggerOptions ~= nil then
        self.triggerOptions:Close()
        self.triggerOptions:SetParent()
        self.triggerOptions = nil
    end

    if Data.selectedTriggerIndex2 ~= 0 then
        local triggerData = self.data[ Data.selectedTriggerType2 ][ Data.selectedTriggerIndex2 ]

        self.triggerOptions = Trigger[ Data.selectedTriggerType2 ].Options( self, triggerData, 0 )
        self.triggerOptions:SetParent( self.background1 )
        self.triggerOptions:SetPosition( 200 + (2*Options.Defaults.window.spacing), Options.Defaults.window.spacing )
        self.triggerOptions:SetHeight( self.listbox:GetHeight() )

        self:SizeChanged()
    end

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:DeleteTrigger( triggerIndex, triggerType )

    Options.DeleteTrigger2( self.data, triggerIndex, triggerType )
    Options.SaveData()
    self.listbox:ContentChanged( self.data )
end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:CopyTrigger( triggerData )

    local trigger = Trigger.Copy( triggerData )
    local index = #self.data[ triggerData.type ] + 1

    self.data[ triggerData.type ][ index ] = trigger
    self.listbox:ContentChanged( self.data )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:BuildCollectionRightClickMenu( data, menu )

    if self.triggerOptions == nil then
        return
    end

    self.triggerOptions:BuildCollectionRightClickMenu( data, menu )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function TriggerOptions:TriggerSelected( index, type )

    Options.Trigger2SelectionChanged( index, type )

end
---------------------------------------------------------------------------------------------------
