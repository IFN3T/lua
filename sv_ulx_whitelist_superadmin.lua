hook.Remove("ULibUserGroupChange", "IFNET_WHITELISTUSERGROUP")
hook.Remove("PlayerAuthed", "IFNET_WHITELISTUSERGROUP")

local banreason = "Vous n'êtes pas whitelist pour le rang de Superadmin !."

local steamid_lookup = { 
    ["STEAM_0:1:00000000"] = true,
    ["STEAM_0:0:11111111"] = true,
}

hook.Add("ULibUserGroupChange", "IFNET_WHITELISTUSERGROUP", function (id, allows, denies, new_group, old_group)
    if new_group == "superadmin" then
        if not steamid_lookup[id] then 
            ULib.addBan(id, 0, banreason)
        end
    end
end)

hook.Add("PlayerAuthed", "IFNET_WHITELISTUSERGROUP", function(ply, id) 
    if not steamid_lookup[id] and ply:IsSuperAdmin() then 
        ULib.addBan(id, 0, banreason)
    end
end)
