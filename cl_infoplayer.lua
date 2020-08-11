for i, v in ipairs( player.GetAll() ) do
	if not IsValid(v) and not v:IsPlayer() then continue end
	print("***************************************")
	print("Nom Steam: " .. v:SteamName() or "???" .. "\n")
	print("[DARKRP]: Nom" .. v:GetName() or "???" .. "\n")
	print("SteamID: " .. v:SteamID() or "???" .. "\n")
	print("SteamID64: " .. v:SteamID64() or "???" .. "\n")
	print("Team: " .. v:Team() or "???" .. "\n")
	local max = 100 * v:Health() / v:GetMaxHealth() or ""
	print("Vie: " .. v:Health() or "???" .. "/" .. v:GetMaxHealth() or "" .. " - " .. max .. "%\n")
	print("Grade: " .. v:GetUserGroup() or "???" .. "\n")
	print("[DARKRP] Money: " .. v:getDarkRPVar("money") or 0 .. "\n")
	
end

print("********* [DEBUG] *********\n")

if DarkRP and LocalPlayer():getDarkRPVar("money") != nil then
	print("DARKRP: TRUE")
else
	print("DARKRP: FALSE")
end
