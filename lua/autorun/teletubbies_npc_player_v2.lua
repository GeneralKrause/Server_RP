local Category = "teletubbies_npc_player_v2"


local NPC = { 	Name = "tinkywinky", 
				Class = "npc_citizen",
				Model = "models/humans/tinkywinky_hl2mp_human/tinkywinky_hl2mp_human.mdl",
				Health = "200",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "tinkywinky_hl2mp", NPC )


local NPC = { 	Name = "dipsy", 
				Class = "npc_citizen",
				Model = "models/humans/dipsy_hl2mp_human/dipsy_hl2mp_human.mdl",
				Health = "200",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "dipsy_hl2mp", NPC )


local NPC = { 	Name = "laalaa", 
				Class = "npc_citizen",
				Model = "models/humans/laalaa_hl2mp_human/laalaa_hl2mp_human.mdl",
				Health = "200",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "laalaa_hl2mp", NPC )


local NPC = { 	Name = "po", 
				Class = "npc_citizen",
				Model = "models/humans/po_hl2mp_human/po_hl2mp_human.mdl",
				Health = "200",
				KeyValues = { citizentype = 4 },
				Category = Category	}

list.Set( "NPC", "po_hl2mp", NPC )


list.Set( "NPCWeapons", "weapon_fiveseven", "Five Seven" )
list.Set( "NPCWeapons", "weapon_ak47", "AK47" )
list.Set( "NPCWeapons", "weapon_tmp", "TMP" )
list.Set( "NPCWeapons", "weapon_para", "Para" )
list.Set( "NPCWeapons", "weapon_mac10", "Mac10" )
list.Set( "NPCWeapons", "weapon_deagle", "Deagle" )
list.Set( "NPCWeapons", "weapon_pumpshotgun", "Pumpshotgun" )
list.Set( "NPCWeapons", "weapon_mp5", "MP5" )
list.Set( "NPCWeapons", "weapon_m4", "M4" )


list.Set( "PlayerOptionsModel", "tinkywinky_hl2mp_player",		"models/player/tinkywinky_hl2mp_player/tinkywinky_hl2mp_player.mdl" )
player_manager.AddValidModel( "tinkywinky_hl2mp_player",		"models/player/tinkywinky_hl2mp_player/tinkywinky_hl2mp_player.mdl" )

list.Set( "PlayerOptionsModel", "dipsy_hl2mp_player",		"models/player/dipsy_hl2mp_player/dipsy_hl2mp_player.mdl" )
player_manager.AddValidModel( "dipsy_hl2mp_player",		"models/player/dipsy_hl2mp_player/dipsy_hl2mp_player.mdl" )

list.Set( "PlayerOptionsModel", "laalaa_hl2mp_player",		"models/player/laalaa_hl2mp_player/laalaa_hl2mp_player.mdl" )
player_manager.AddValidModel( "laalaa_hl2mp_player",		"models/player/laalaa_hl2mp_player/laalaa_hl2mp_player.mdl" )

list.Set( "PlayerOptionsModel", "po_hl2mp_player",		"models/player/po_hl2mp_player/po_hl2mp_player.mdl" )
player_manager.AddValidModel( "po_hl2mp_player",		"models/player/po_hl2mp_player/po_hl2mp_player.mdl" )
