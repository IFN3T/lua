hook.Remove( "Think", "IFN_HOSTNAME_THINK" )
hook.Remove( "player_connect", "IFN_HOSTNAME" )
hook.Remove( "player_disconnect", "IFN_HOSTNAME" )

local IFN_HOSTNAME = "[FR] COVID19RP | RECRTUEMENT ON | TDM | FLUIDE"

hook.Add( "Think", "IFN_HOSTNAME", function()
  RunConsoleCommand( 'hostname' , IFN_HOSTNAME .. " | " .. player.GetCount() .. "/" .. game.MaxPlayers() )
end )

gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "IFN_HOSTNAME_CONNECT", function()
  RunConsoleCommand( 'hostname' , IFN_HOSTNAME .. " | " .. player.GetCount() .. "/" .. game.MaxPlayers() )
end )

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "IFN_HOSTNAME_DISCONNECT", function()
  RunConsoleCommand( 'hostname' , IFN_HOSTNAME .. " | " .. player.GetCount() .. "/" .. game.MaxPlayers() )
end )
