     
local nextName
local tbNPCs = {}
hook.Add("PlayerSpawnNPC","npcspawngetname",function(pl,name,wepName) nextName = name end)
 
hook.Add("PlayerSpawnedNPC","npcspawnupdatemodel",function(pl,npc)
        if(!nextName) then return end
        if(tbNPCs[nextName]) then
                local min,max = npc:GetCollisionBounds()
                local hull = npc:GetHullType()
                npc:SetModel(tbNPCs[nextName])
                npc:SetSolid(SOLID_BBOX)
                npc:SetHullType(hull)
                npc:SetHullSizeNormal()
                npc:SetCollisionBounds(min,max)
                npc:DropToFloor()
        end
        nextName = nil
end)
 
local function AddNPC(category,name,class,model,keyvalues,skin)
        list.Set("NPC",name,{Name = name,Class = class,Skin = skin,Model = model,Category = category,KeyValues = keyvalues})
        tbNPCs[name] = model
end


AddNPC("Metropolice pack v5","Arctic","npc_metropolice","models/arctic.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Badass","npc_metropolice","models/badass_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Spec Ops","npc_metropolice","models/biopolice.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","City 08 Police","npc_metropolice","models/c08cop.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Civil Medic","npc_metropolice","models/civil_medic.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Black Metro Police","npc_metropolice","models/blacop.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Skull Squad","npc_metropolice","models/blacop.mdl",{["manhacks"] = 0},1)
AddNPC("Metropolice pack v5","Beta Metro Police","npc_metropolice","models/hl2beta_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Blue eyed Metro Police","npc_metropolice","models/hl2concept.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","HD Barney","npc_barney","models/HD_Barney.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","HD Barney ep1","npc_barney","models/HD_Barney.mdl",{["manhacks"] = 0},1)
AddNPC("Metropolice pack v5","HD Metro Police","npc_metropolice","models/HDpolice.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Hunter Squad","npc_metropolice","models/hunter_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Phoenix Metro Police","npc_metropolice","models/phoenix_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Breen Troops","npc_metropolice","models/leet_police_bt.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Elite Shock Unit","npc_metropolice","models/leet_police2.mdl",{["manhacks"] = 1},0)
AddNPC("Metropolice pack v5","Concept Trenchcoat","npc_metropolice","models/metrold.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Female Metro Police","npc_metropolice","models/police_female.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Fragger Police","npc_metropolice","models/police_fragger.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Trenchcoat Metro Police","npc_metropolice","models/policetrench.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Rogue Police","npc_metropolice","models/redice.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Resistance Police","npc_citizen","models/resistance_police.mdl",{["citizentype"] = 4},0)
AddNPC("Metropolice pack v5","Retro Police","npc_metropolice","models/retrocop.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Steampunk Police","npc_metropolice","models/steampunk_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","TF2 RED Police","npc_metropolice","models/tf2_metrocop.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","TF2 BLU Police","npc_metropolice","models/tf2_metrocop.mdl",{["manhacks"] = 0},2)
AddNPC("Metropolice pack v5","Tribal Police","npc_metropolice","models/tribal.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Tron Styled Blue","npc_metropolice","models/tron_police.mdl",{["manhacks"] = 0},0)
AddNPC("Metropolice pack v5","Tron Styled Orange","npc_metropolice","models/tron_police.mdl",{["manhacks"] = 0},1)
AddNPC("Metropolice pack v5","Urban Camo","npc_metropolice","models/urban_police.mdl",{["manhacks"] = 0},0)