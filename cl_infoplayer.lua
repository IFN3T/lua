for i, v in ipairs( player.GetAll() ) do
    print("***************************************")

	if v:Nick() == nil or v:Nick() == "" then
	print("Nom: ???\n")
	else
    print("Nom Steam: " .. v:SteamName() .. "\n")
	end
	
	if v:getDarkRPVar("money") != nil then
    print("[DARKRP]: Nom" .. v:GetName() .. "\n")
	end

	if v:SteamID() == nil then
    print("SteamID: ???\n")
	else
	print("SteamID: " .. v:SteamID() .. "\n")
	end

	if v:SteamID64() == nil then
    print("SteamID64: ???\n")
	else
	print("SteamID64: " .. v:SteamID64() .. "\n")
	end

	if v:Team() == nil or v:Team() == "" then
	print("Team: ???\n")
	else
    print("Team: " .. v:Team() .. "\n")
	end

	if v:Health() == nil or v:Health() == "" then
	print("Vie: ???\n")
	else
	local max = 100 * v:Health() / v:GetMaxHealth()
	print("Vie: " .. v:Health() .. "/" .. v:GetMaxHealth() .. " - " .. max .. "%\n")
	end

	if v:GetUserGroup() == nil or v:GetUserGroup() == "" then
    print("Grade: ??? \n")
	else
    print("Grade: " .. v:GetUserGroup() .. "\n")
	end

	if v:getDarkRPVar("money") != nil then
    print("[DARKRP] Money: " .. v:getDarkRPVar("money") .. "\n")
	end

end

	print("********* [DEBUG] *********\n")

	if LocalPlayer():getDarkRPVar("money") != nil then
	print("DARKRP: TRUE")
	else
	print("DARKRP: FALSE")
	end
