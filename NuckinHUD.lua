NuckinHUD = {}
NuckinHUD_Modules = {}
NuckinHUD_Graphics = {}
NuckinHUD_Events = {}
NuckinHUD_Defaults = {
    ["Graphics"] = "Glow",
}

function NuckinHUD:print(msg)
    print("|cff0058ff<NuckinHUD>: |r"..msg)
end

function NuckinHUD:error(msg)
    NuckinHUD:print("|cffff0000 -- ERROR: "..msg.."|r")
end

function NuckinHUD:OnLoad(self)
	--core OnLoad
	self:print("NuckinHUD "..GetAddOnMetadata("NuckinHUD", "Version").." Loaded")
	self:AddEvent("ADDON_LOADED")
	
	--modules OnLoad
	for key,value in pairs(NuckinHUD_Modules) do
		if value then
			_G["NuckinHUD_"..key.."_OnLoad"](self)
		end
	end
end

function NuckinHUD:OnEvent(self, event, arg1, arg2)
	--core OnEvent
	if event == "ADDON_LOADED" and arg1 == "NuckinHUD" then
    	if NuckinHUDOptions == nil then
    	    NuckinHUDOptions = NuckinHUD_Defaults
    	    NuckinHUDOptions["firstloaded"] = true
    	    self:print("First time load complete")
    	end
	end
	--modules OnEvent
	for key,value in pairs(NuckinHUD_Modules) do
		if value then
			_G["NuckinHUD_"..key.."_OnEvent"](self, event, arg1, arg2)
		end
	end
end

function NuckinHUD:OnUpdate(self, elapsed)
	--core OnUpdate
	
	--modules OnUpdate
	for key,value in pairs(NuckinHUD_Modules) do
		if value then
			_G["NuckinHUD_"..key.."_OnUpdate"](self, elapsed)
		end
	end
end

--This function registers a module with the library
function NuckinHUD:AddModule(name)
    if NuckinHUD_Modules[name] then
        NuckinHUD:error("Duplicate module loaded named '"..name.."'")
    else
        NuckinHUD_Modules[name] = true
    end
end

--This function registers a graphic with the core
function NuckinHUD:AddGraphic(name)
    if NuckinHUD_Graphics[name] then
        NuckinHUD:error("Duplicate graphics library loaded named '"..name.."'")
    else
        NuckinHUD_Graphics[name] = true
    end
end

--This function registers an event with the core
function NuckinHUD:AddEvent(event)
    if NuckinHUD_Events[event] == nil then
        NuckinHUD_Events[event] = true
        _G["NuckinHUD_Events"]:RegisterEvent(event)
    end
end

function NuckinHUD:SetTexture(textureObj)
    local gfx = NuckinHUDOptions["Graphics"]
    _G["NuckinHUD_"..gfx.."_SetTexture"](textureObj)
end