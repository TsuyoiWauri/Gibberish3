--=================================================================================================
--= selection options
--= ===============================================================================================
--= 
--=================================================================================================



Options.Elements.SelectionOptions = class(Turbine.UI.Control)
---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:Constructor()
	Turbine.UI.Control.Constructor( self )

	self:CreatBackground()
	self:CreateToolbar()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:LanguageChanged()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:SelectionChanged()

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:SizeChanged()

	local width, height = self:GetSize()

	-- calclulate size
	local background1_width  = width - ( 2 * Options.Defaults.window.spacing )
	local background1_height = height - ( 2 * Options.Defaults.window.spacing )

	local frame_width        = background1_width - ( 2 * Options.Defaults.window.spacing )
	local frame_height       = background1_height - ( 2 * Options.Defaults.window.spacing )

	local background2_width  = frame_width - ( 2 * Options.Defaults.window.frame )
	local background2_height = frame_height - ( 3 * Options.Defaults.window.frame ) -  Options.Defaults.window.toolbar_height

	local name_width         = background2_width - ( 4 * Options.Defaults.window.toolbar_height ) - ( 4 * Options.Defaults.window.frame )

	-- set size
	self.background1:SetSize( background1_width, background1_height )
	self.frame:SetSize( frame_width, frame_height )
	self.background2:SetSize( background2_width, background2_height )

	self.reset_back:SetSize( Options.Defaults.window.toolbar_height, Options.Defaults.window.toolbar_height)
	self.save_back:SetSize( Options.Defaults.window.toolbar_height, Options.Defaults.window.toolbar_height)
	self.import_back:SetSize( Options.Defaults.window.toolbar_height, Options.Defaults.window.toolbar_height)
	self.reload_back:SetSize( Options.Defaults.window.toolbar_height, Options.Defaults.window.toolbar_height)
	self.name_back:SetSize( name_width, Options.Defaults.window.toolbar_height)
	self.name_label:SetSize( name_width, Options.Defaults.window.toolbar_height)

	-- calclulate position
	local background1_pos    =  Options.Defaults.window.spacing
	local frame_pos          =  Options.Defaults.window.spacing
	local background2_left   =  Options.Defaults.window.frame 
	local background2_top    = ( 2 * Options.Defaults.window.frame ) + Options.Defaults.window.toolbar_height
	local reset_left         = Options.Defaults.window.frame
	local save_left          = reset_left + Options.Defaults.window.frame + Options.Defaults.window.toolbar_height
	local import_left        = save_left + Options.Defaults.window.frame + Options.Defaults.window.toolbar_height
	local reload_left        = import_left + Options.Defaults.window.frame + Options.Defaults.window.toolbar_height
	local name_left          = reload_left + Options.Defaults.window.frame + Options.Defaults.window.toolbar_height

	-- set position
	self.background1:SetPosition( background1_pos, background1_pos )
	self.frame:SetPosition( frame_pos, frame_pos )
	self.background2:SetPosition( background2_left, background2_top )
	
	self.reset_back:SetPosition( reset_left, Options.Defaults.window.frame )
	self.save_back:SetPosition( save_left, Options.Defaults.window.frame )
	self.import_back:SetPosition( import_left, Options.Defaults.window.frame )
	self.reload_back:SetPosition( reload_left, Options.Defaults.window.frame )
	self.name_back:SetPosition( name_left, Options.Defaults.window.frame)
	
end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:CreatBackground()

	self:SetBackColor( Options.Defaults.window.basecolor )

	-- background
	self.background1 = Turbine.UI.Control()
	self.background1:SetParent( self )
	self.background1:SetBackColor( Options.Defaults.window.backcolor1 )

	self.frame = Turbine.UI.Control()
	self.frame:SetParent( self.background1 )
	self.frame:SetBackColor( Options.Defaults.window.framecolor )

	self.background2 = Turbine.UI.Control()
	self.background2:SetParent( self.frame )
	self.background2:SetBackColor( Options.Defaults.window.backcolor2 )

end
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
function Options.Elements.SelectionOptions:CreateToolbar()

	-- reset button
	self.reset_back = Turbine.UI.Control()
	self.reset_back:SetParent( self.frame )
	self.reset_back:SetBackColor( Options.Defaults.window.backcolor2 )

	self.reset_button = Turbine.UI.Button()
	self.reset_button:SetParent( self.reset_back )
	self.reset_button:SetBlendMode( Turbine.UI.BlendMode.Overlay )
	self.reset_button:SetBackground( "Gibberish3/RESOURCES/back.tga" )
	self.reset_button:SetPosition( -3, -3 )
	Options.Elements.Tooltip.AddTooltip( self.reset_button, "tooltip", "TODO", false )
	
	-- save button
	self.save_back = Turbine.UI.Control()
	self.save_back:SetParent( self.frame )
	self.save_back:SetBackColor( Options.Defaults.window.backcolor2 )

	self.save_button = Turbine.UI.Button()
	self.save_button:SetParent( self.save_back )
	self.save_button:SetBlendMode( Turbine.UI.BlendMode.Overlay )
	self.save_button:SetBackground( "Gibberish3/RESOURCES/save.tga" )
	self.save_button:SetPosition( -3, -3 )
	Options.Elements.Tooltip.AddTooltip( self.save_button, "tooltip", "TODO", false )
	
	-- import button
	self.import_back = Turbine.UI.Control()
	self.import_back:SetParent( self.frame )
	self.import_back:SetBackColor( Options.Defaults.window.backcolor2 )

	self.import_button = Turbine.UI.Button()
	self.import_button:SetParent( self.import_back )
	self.import_button:SetBlendMode( Turbine.UI.BlendMode.Overlay )
	self.import_button:SetBackground( "Gibberish3/RESOURCES/import.tga" )
	self.import_button:SetPosition( -3, -3 )
	Options.Elements.Tooltip.AddTooltip( self.import_button, "tooltip", "TODO", false )
	
	-- reload button
	self.reload_back = Turbine.UI.Control()
	self.reload_back:SetParent( self.frame )
	self.reload_back:SetBackColor( Options.Defaults.window.backcolor2 )

	self.reload_button = Turbine.UI.Button()
	self.reload_button:SetParent( self.reload_back )
	self.reload_button:SetBlendMode( Turbine.UI.BlendMode.Overlay )
	self.reload_button:SetBackground( "Gibberish3/RESOURCES/reload.tga" )
	self.reload_button:SetPosition( -3, -3 )
	self.reload_button.Click = function ()
		Options.Reload()
	end
	Options.Elements.Tooltip.AddTooltip( self.reload_button, "tooltip", "TODO", false )

	-- name
	self.name_back = Turbine.UI.Control()
	self.name_back:SetParent( self.frame )
	self.name_back:SetBackColor( Options.Defaults.window.backcolor2 )

	self.name_label = Turbine.UI.Label()
	self.name_label:SetParent( self.name_back )
	self.name_label:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleLeft )
	self.name_label:SetFont( Options.Defaults.window.font )
	
end
---------------------------------------------------------------------------------------------------