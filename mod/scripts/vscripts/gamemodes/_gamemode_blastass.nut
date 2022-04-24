global function AssBlastFFA_init
void function AssBlastFFA_init() {
    SetLoadoutGracePeriodEnabled( false )
    SetWeaponDropsEnabled(false )
    Riff_ForceTitanAvailability( eTitanAvailability.Never )
    Riff_ForceBoostAvailability( eBoostAvailability.Disabled )
	AddCallback_OnClientConnected( PlayerJoined )
}



void function PlayerJoined(entity player){
    //lets give them stim, followed by increased air accel

	//lets set their loadout
    foreach ( entity weapon in player.GetMainWeapons() )
        player.TakeWeaponNow( weapon.GetWeaponClassName() )
        SendHudMessage( player, "Higher EPG Radius and FireRate, along with increased speed, go nuts.", -1, 0.4, 255, 0, 0, 0, 0, 3, 0.15 )

    foreach ( entity weapon in player.GetOffhandWeapons() )
        player.TakeWeaponNow( weapon.GetWeaponClassName() )

    player.GiveOffhandWeapon( "melee_pilot_emptyhanded", OFFHAND_MELEE )
    //unfortunately the game requires that you have a weapon of some kind in order to use secondaries, so lets give those fuckers an EPG
    player.GiveWeapon( "mp_weapon_epg" )
}