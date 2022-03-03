hook.Remove("ULibUserGroupChange", "IFNET_WHITELISTUSERGROUP")
hook.Remove("PlayerAuthed", "IFNET_WHITELISTUSERGROUP")

local superadmin_banreason = "Vous n'êtes pas whitelist pour le rang de Superadmin !."
local admin_banreason = "Vous n'êtes pas whitelist pour le rang d'Admin !."
local moderator_banreason = "Vous n'êtes pas whitelist pour le rang de Modérateur !."

local superadmin_lookup = { 
    ["STEAM_0:0:00000000"] = true, -- STEAMID SUPERADMIN N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID SUPERADMIN N°2
    ["STEAM_0:0:22222222"] = true, -- STEAMID SUPERADMIN N°3

}

local admin_lookup = { 
    ["STEAM_0:0:00000000"] = true, -- STEAMID ADMIN N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID ADMIN N°2
    ["STEAM_0:0:22222222"] = true, -- STEAMID ADMIN N°3

}

local moderator_lookup = { 
    ["STEAM_0:0:00000000"] = true, -- STEAMID MODERATOR N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID MODERATOR N°2
    ["STEAM_0:0:22222222"] = true, -- STEAMID MODERATOR N°3

}

hook.Add("ULibUserGroupChange", "IFNET_WHITELISTUSERGROUP", function (steamid, allows, denies, new_group, old_group)
	local function BanPlayer(steamid, time, reason)
		ULib.addBan(steamid, time, reason)
		ULib.refreshBans()
	end

    if new_group == "superadmin" then
        print("SUPERADMIN1")
		if not superadmin_lookup[id] then
        	print("SUPERADMIN2")
			BanPlayer(steamid, 0, superadmin_banreason)
			return
		end
    elseif new_group == "admin" then
	print("ADMIN1")
		if not admin_lookup[id] then
        	print("ADMIN2")
			BanPlayer(steamid, 0, admin_banreason)
			return
		end
    elseif new_group == "moderator" then
    print("MODO1")
		if not moderator_lookup[id] then
            print("MODO2")
			BanPlayer(steamid, 0, moderator_banreason)
			return
		end
    end
end)

hook.Add("PlayerAuthed", "IFNET_WHITELISTUSERGROUP", function(ply, id) 
    if not superadmin_lookup[id] and ply:IsUserGroup("superadmin") then 
        ULib.addBan(id, 0, superadmin_banreason)
        return
    elseif not admin_lookup[id] and ply:IsUserGroup("admin") then 
        ULib.addBan(id, 0, admin_banreason)
        return
    elseif not moderator_lookup[id] and ply:IsUserGroup("moderator") then 
        ULib.addBan(id, 0, moderator_banreason)
        return
    end
end)
