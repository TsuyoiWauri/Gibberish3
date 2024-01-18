--=================================================================================================
--= Effect Self Options        
--= ===============================================================================================
--= effect self options control
--=================================================================================================



EffectSelfOptions = class(Turbine.UI.Control)

Trigger[ Trigger.Types.EffectSelf ].Options = function ( parent, data, parentType )

    return EffectSelfOptions( parent, data, parentType )

end

Trigger[ Trigger.Types.EffectRemoveSelf ].Options = function ( parent, data, parentType )

    return EffectSelfOptions( parent, data, parentType )

end

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:Constructor( parent, data, parentType )
	Turbine.UI.Control.Constructor( self )

    self.parent = parent
    self.data = data

    local top = 0

    self.description = Options.Elements.TextBoxRow( Options.Defaults.window.backcolor1, "options", "description", "TODO", 50 )
    self.description:SetParent( self )
    self.description:SetTop( top )
    
    top = top + 55

    self.token = Options.Elements.TextBoxRow( Options.Defaults.window.backcolor1, "options", "token", "TODO", 50 )
    self.token:SetParent( self )
    self.token:SetTop( top )

    top = top + 55

    self.useRegex = Options.Elements.CheckBoxRow( Options.Defaults.window.backcolor1, "options", "useRegex", "TODO", 30 )
    self.useRegex:SetParent( self )
    self.useRegex:SetTop( top )

    top = top + 35

    self.action = Options.Elements.DropDownRow( Options.Defaults.window.backcolor1, "options", "action", "TODO", 30 )
    self.action:SetParent( self )
    self.action:SetTop( top )

    -- folder
    if parentType == 0 then
        self.action:AddItem( "action", "Enable", Action.Enable)
        self.action:AddItem( "action", "Disable", Action.Disable)
        self.action:AddItem( "action", "Reset", Action.Disable)

    -- window
    elseif parentType > 0 then
        self.action:AddItem( "action", "Enable", Action.Enable)
        self.action:AddItem( "action", "Disable", Action.Disable)
        self.action:AddItem( "action", "Clear", Action.Clear)
        self.action:AddItem( "action", "Reset", Action.Reset)
    
    -- timer
    elseif parentType < 0 then
        self.action:AddItem( "action", "Add", Action.Add)

        if (parentType *(-1)) == Timer.Types.COUNTER_BAR then
            self.action:AddItem( "action", "Subtract", Action.Subtract)
        end
        
        self.action:AddItem( "action", "Remove", Action.Remove)
        self.action:AddItem( "action", "Enable", Action.Enable)
        self.action:AddItem( "action", "Disable", Action.Disable)

    end

    top = top + 35
    
    self.value = Options.Elements.TextBoxRow( Options.Defaults.window.backcolor1, "options", "value", "TODO", 30 )
    if (parentType *(-1)) == Timer.Types.COUNTER_BAR then
        self.value:SetParent( self )
        self.value:SetTop( top )

        top = top + 35
    end


    self:ResetContent()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:ResetContent()

    self.description:SetText( self.data.description )
    self.token:SetText( self.data.token )
    self.useRegex:SetChecked( self.data.useRegex )
    self.action:SetSelection( self.data.action )
    self.value:SetText( self.data.value )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:SizeChanged()

    self.description:SetWidth( self:GetWidth() )
    self.token:SetWidth( self:GetWidth() )
    self.action:SetWidth( self:GetWidth() )
    self.value:SetWidth( self:GetWidth() )
    self.useRegex:SetWidth( self:GetWidth() )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:Save()

    self.data.description   = self.description:GetText(  )
    self.data.token         = self.token:GetText(  )
    self.data.useRegex      = self.useRegex:IsChecked(  )
    self.data.action        = self.action:GetSelectedValue(  )
    self.data.value         = self.value:GetText(  )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:Reset()

    self:ResetContent()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function EffectSelfOptions:Close()

    self.action:Close()

end
---------------------------------------------------------------------------------------------------
