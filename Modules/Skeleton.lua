--[[
Here is the training module, it is designed to help anyone interested in building
a module for NuckinHUD to get their foot in the door with the thin library in
NuckinHUD.
]]--

--This function registers the module with NuckinHUD so that it can be referenced
--The name MUST be unique, otherwise NuckinHUD will throw an error into the console
NuckinHUD:AddModule("Skeleton")

--This function registers all the events you need for the module to work
NuckinHUD:AddEvent("PLAYER_ENTERING_WORLD")

--REQUIRED OnLoad function
function NuckinHUD_Skeleton_OnLoad(self)
    --print messages
	self:print("Skeleton Loaded")
	
	--print errors
	self:error("Skeleton should not be loaded in a non-development setting!")
end

--REQUIRED OnEvent function
function NuckinHUD_Skeleton_OnEvent(self, event, arg1, arg2)
    --here we will handle all the events that you specified above
end

--REQUIRED OnUpdate function
function NuckinHUD_Skeleton_OnUpdate(self, elapsed)
    --stuff that has to happen between events
end

--REQUIRED to apply newly changed settings for this module
function NuckinHUD_Skeleton_ApplySettings()

end