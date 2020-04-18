waitUntil { time > 1 };
waitUntil { !isNil "FOB_ALL" };
waitUntil { !isNil "SAVE_LOADED" };

private [ "_fobbox" ];

if ( count FOB_ALL == 0 ) then {

	if ( CONST_BUILD_FIRST_FOB ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 1600 ) then {
					_acceptsector = false;
				};
			} foreach SECTOR_ALL;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = selectRandom _potentialplaces;
		[ markerPos _spawnplace, true ] remoteExec ["build_fob_remote_call", 2];
 
	} else {
		while { count FOB_ALL == 0 } do {

			if ( GRLIB_isAtlasPresent ) then {
				_fobbox = FOB_box_typename createVehicle [0,0,50];
				_fobbox enableSimulationGlobal false;
				_fobbox allowDamage false;
				_fobbox setposasl [(getpos lhd select 0) + 10, (getpos lhd select 1) + 62, (18.5   + (getposasl lhd select 2))];
				clearItemCargoGlobal _fobbox;
				_fobbox setDir 130;
				sleep 1;
				_fobbox enableSimulationGlobal true;
				_fobbox allowDamage true;
			} else {
				_fobbox = FOB_box_typename createVehicle (getpos base_boxspawn);
				_fobbox setpos (getpos base_boxspawn);
				_fobbox setdir 215;
			};

			[_fobbox, 3000 ] remoteExec ["F_setMass"];

			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count FOB_ALL > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};
};

terminate _thisScript;