--[[
CreateCustomArmor
tes3mp 0.8.0
---------------------------
INSTALLATION:
Save the file as CreateCustomArmor.lua inside your server/scripts/custom folder.
Save the file as DataArmor.json inside your server/data/custom/DataBase folder.
Edits to customScripts.lua add : CreateCustomArmor = require("custom.CreateCustomArmor")
---------------------------
INSTRUCTIONS:
to modify a value of an item such as armorRating, modify the target in the file DataArmor.json
]]

---------------
-- JSON-DATA --
---------------
local DataArmor = jsonInterface.load("custom/DataBase/DataArmor.json")

-------------
-- METHODS --
-------------
local CreateCustomArmor = {}
CreateCustomArmor.OnServerInit = function(eventStatus)
	local recordTable	
	local recordStoreArmor = RecordStores["armor"]		
	for refId, record in pairs(DataArmor) do	
		recordTable = {
			baseId = record.baseId,
			id = record.baseId,			
			name = record.name,
			subtype = record.subtype,
			model = record.model,
			icon = record.icon,
			weight = record.weight,						
			value = record.value,
			health = record.health,
			armorRating = record.armorRating,
			enchantmentId = record.enchantmentId,
			enchantmentCharge = record.enchantmentCharge,
			script = record.script
		}	
		recordStoreArmor.data.permanentRecords[string.lower(refId)] = recordTable
	end
	recordStoreArmor:Save()	
	recordTable = nil
end	

------------
-- EVENTS --
------------
customEventHooks.registerHandler("OnServerInit", CreateCustomArmor.OnServerInit)

return CreateCustomArmor
