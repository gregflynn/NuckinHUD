NuckinHUD_Modules = {}

function NuckinHUD_OnLoad(self)
	--core OnLoad
	print("NuckinHUD Loaded")
	--modules OnLoad
	for key,value in pairs(NuckinHUD_Modules) do
		if value then
			_G["NuckinHUD_"..key.."_OnLoad"](self)
		end
	end
end

function NuckinHUD_OnEvent(self, event, arg1, arg2)
	--core OnEvent
	
	--modules OnEvent
	
end

function NuckinHUD_OnUpdate(self, elapsed)
	--core OnUpdate
	
	--modules OnUpdate
	
end

function NuckinHUD_AddModule(name)
    NuckinHUD_Modules[name] = true
end