if ( combat_readiness > 15 ) then {

	params [ "_targetsector" ];
	_init_units_count = ( ([ getmarkerpos _targetsector , CONST_CAPTURE_SIZE , CONST_SIDE_OPFOR ] call F_getUnitsCount) );

	if ( !(_targetsector in SECTOR_BIGTOWN)) then {
		while { (_init_units_count * 0.75) <=  ( [ getmarkerpos _targetsector , CONST_CAPTURE_SIZE , CONST_SIDE_OPFOR ] call F_getUnitsCount ) } do {
			sleep 5;
		};
	};

	if ( _targetsector in SECTOR_ACTIVE ) then {

		_nearestower = [markerpos _targetsector, CONST_SIDE_OPFOR, GRLIB_radiotower_size * 1.4] call F_getNearestTower;

		if ( _nearestower != "" ) then {
			_reinforcements_time = (((((markerpos _nearestower) distance (markerpos _targetsector)) / 1000) ^ 1.66 ) * 120) / (CONST_DIFFICULTY_MODIFIER * CONST_CSAT_AGGRESSIVITY);
			if (_targetsector in SECTOR_BIGTOWN) then {
				_reinforcements_time = _reinforcements_time * 0.35;
			};
			_current_timer = time;

			waitUntil { sleep 0.3; (_current_timer + _reinforcements_time < time) || (_targetsector in SECTOR_BLUFOR) || (_nearestower in SECTOR_BLUFOR) };

			sleep 15;

			if ( (_targetsector in SECTOR_ACTIVE) && !(_targetsector in SECTOR_BLUFOR) && !(_nearestower in SECTOR_BLUFOR) && (!([] call F_isBigtownActive) || _targetsector in SECTOR_BIGTOWN)  ) then {
				reinforcements_sector_under_attack = _targetsector;
				reinforcements_set = true;
				[ "lib_reinforcements" , [ markertext  _targetsector ] ] remoteExec ["bis_fnc_shownotification", -2];
				if ( (random combat_readiness) > (20 + (30 / CONST_CSAT_AGGRESSIVITY) ) ) then {
					[ _targetsector ] spawn F_spawnParatrooper;
				};
				stats_reinforcements_called = stats_reinforcements_called + 1;
			};
		};
	};
};

