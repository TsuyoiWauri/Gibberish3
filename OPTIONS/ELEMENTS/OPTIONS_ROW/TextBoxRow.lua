--=================================================================================================
--= TextBox
--= ===============================================================================================
--= 
--=================================================================================================



Options.Elements.TextBoxRow = class(Turbine.UI.Control)
---------------------------------------------------------------------------------------------------
function Options.Elements.TextBoxRow:Constructor( back_color, label_control, label_description, tooltip_description, height, allow_multiline )
	Turbine.UI.Control.Constructor( self )

    self.label_control = label_control
    self.label_description = label_description

	self.label = Turbine.UI.Label()
	self.label:SetParent( self )
	self.label:SetPosition( Options.Defaults.window.spacing, Options.Defaults.window.spacing )
	self.label:SetSize( 110, height - Options.Defaults.window.spacing )
	self.label:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleRight )
	self.label:SetFont( Options.Defaults.window.font )
	Options.Elements.Tooltip.AddTooltip( self.label, "tooltip", tooltip_description, false )

    self.textbox = Turbine.UI.Lotro.TextBox()
    self.textbox:SetParent( self )
    -- self.textbox:SetBackColor()
    self.textbox:SetPosition( 130 + 2*Options.Defaults.window.spacing, Options.Defaults.window.spacing )
    self.textbox:SetHeight( height - 2*Options.Defaults.window.spacing )
    self.textbox:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft )
	self.textbox:SetForeColor( Options.Defaults.window.textcolor )
	self.textbox:SetSelectable( true )
    self.textbox:SetFont( Options.Defaults.window.font )
    self.textbox:SetMultiline( allow_multiline )
    self.textbox:SetMarkupEnabled(false)

    self:SetHeight( height )
    self:SetBackColor( back_color )

    self:LanguageChanged()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.TextBoxRow:LanguageChanged()

    self.label:SetText( UTILS.GetText( self.label_control, self.label_description ) )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.TextBoxRow:SizeChanged()

    local width, height = self:GetSize()

    self.textbox:SetWidth( width - 130 - 3*Options.Defaults.window.spacing )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.TextBoxRow:SetText( value )
    self.textbox:SetText( value )
end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.TextBoxRow:GetText()
    return self.textbox:GetText()
end
---------------------------------------------------------------------------------------------------