params [ "_sector" ];
private [ "_actual_capture_size", "_red_forces", "_blue_forces", "_ratio" ];

_actual_capture_size = CONST_CAPTURE_SIZE;
if ( _sector in SECTOR_BIGTOWN ) then {
	_actual_capture_size = CONST_CAPTURE_SIZE * 1.4;
};

_red_forces = [ (markerpos _sector), _actual_capture_size, CONST_SIDE_OPFOR ] call F_getUnitsCount;
_blue_forces = [ (markerpos _sector), _actual_capture_size, CONST_SIDE_BLUFOR ] call F_getUnitsCount;
_ratio = -1;

if (_red_forces > 0) then {
	_ratio = _blue_forces / ( _red_forces + _blue_forces );
} else {
	if ( _sector in SECTOR_BLUFOR || _blue_forces != 0 ) then {
		_ratio = 1;
	} else {
		_ratio = 0;
	};
};

_ratio
