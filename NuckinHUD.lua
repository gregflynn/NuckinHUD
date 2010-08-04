NuckinHUD = {}
NuckinHUD_Modules = {}

function NuckinHUD:print(msg)
    print("|cff0058ff<NuckinHUD>: |r"..msg)
end

function NuckinHUD:error(msg)
    NuckinHUD:print("|cffff0000 -- ERROR: "..msg.."|r")
end

function NuckinHUD:OnLoad(self)
	--core OnLoad
	self:print("NuckinHUD Loaded")
	--modules OnLoad
	for key,value in pairs(NuckinHUD_Modules) do
		if value then
			_G["NuckinHUD_"..key.."_OnLoad"](self)
		end
	end
end

function NuckinHUD:OnEvent(self, event, arg1, arg2)
	--core OnEvent
	
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

function NuckinHUD:AddModule(name)
    if NuckinHUD_Modules[name] then
        print("|cffff0000 -- ERROR: Duplicate Module Named '"..name.."'|r")
    else
        NuckinHUD_Modules[name] = true
    end
end