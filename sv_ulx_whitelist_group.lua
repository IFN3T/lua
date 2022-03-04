hook.Remove("ULibUserGroupChange", "ULXWG")
hook.Remove("PlayerAuthed", "ULXWG")

MsgC(Color(0, 255, 0), [[



                          _    _ _     __   ____          _______ 
                         | |  | | |    \ \ / /\ \        / / ____|
                         | |  | | |     \ V /  \ \  /\  / / |  __ 
                         | |  | | |      > <    \ \/  \/ /| | |_ |
                         | |__| | |____ / . \    \  /\  / | |__| |
                          \____/|______/_/ \_\    \/  \/   \_____|                   
                             _                     _          _ 
                            | |                   | |        | |
                            | |     ___   __ _  __| | ___  __| |
                            | |    / _ \ / _` |/ _` |/ _ \/ _` |
                            | |___| (_) | (_| | (_| |  __/ (_| |
                            |______\___/ \__,_|\__,_|\___|\__,_|
]])

local superadmin_banreason = "Vous n'êtes pas whitelist pour le rang de Superadmin !."
local admin_banreason = "Vous n'êtes pas whitelist pour le rang d'Admin !."
local moderator_banreason = "Vous n'êtes pas whitelist pour le rang de Modérateur !."

local superadmin_lookup = { 
    ["STEAM_0:0:00000000"] = true, -- STEAMID SUPERADMIN N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID SUPERADMIN N°2
    ["STEAM_0:0:22222222"] = true -- STEAMID SUPERADMIN N°3
}

local admin_lookup = { 
    ["STEAM_0:0:00000000"] = true, -- STEAMID ADMIN N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID ADMIN N°2
    ["STEAM_0:0:22222222"] = true -- STEAMID ADMIN N°3

}

local moderator_lookup = { 
    ["STEAM_0:1:00000000"] = true, -- STEAMID MODERATOR N°1
    ["STEAM_0:0:11111111"] = true, -- STEAMID MODERATOR N°2
    ["STEAM_0:0:22222222"] = true -- STEAMID MODERATOR N°3

}

hook.Add("ULibUserGroupChange", "IFNET_WHITELISTUSERGROUP", function (steamid, allows, denies, new_group, old_group)
	local function BanPlayer(steamid, time, reason)
		ULib.addBan(steamid, time, reason)
		ULib.refreshBans()
	end

    if new_group == "superadmin" then
		print(util.SteamIDTo64(steamid))
		if not superadmin_lookup[steamid] then
			BanPlayer(steamid, 0, superadmin_banreason)
			return
		end
    elseif new_group == "admin" then
		if not admin_lookup[steamid] then
			BanPlayer(steamid, 0, admin_banreason)
			return
		end
    elseif new_group == "moderator" then
		if not moderator_lookup[steamid] then
			BanPlayer(steamid, 0, moderator_banreason)
			return
		end
    end
end)

hook.Add("PlayerAuthed", "IFNET_WHITELISTUSERGROUP", function(ply, id) 
    if not superadmin_lookup[util.SteamIDTo64(steamid)] and ply:IsUserGroup("superadmin") then 
        BanPlayer(steamid, 0, superadmin_banreason)
        return
    elseif not admin_lookup[util.SteamIDTo64(steamid)] and ply:IsUserGroup("admin") then 
        BanPlayer(steamid, 0, admin_banreason)
        return
    elseif not moderator_lookup[util.SteamIDTo64(steamid)] and ply:IsUserGroup("moderator") then 
        BanPlayer(steamid, 0, moderator_banreason)
        return
    end
end)
