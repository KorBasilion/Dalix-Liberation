params [ "_sector", "_opforcount" ];

private _corrected_size = [ _opforcount ] call F_getCorrectedSectorRange;

sleep 0.1;
private _unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 10 ) then { sleep 5; };

sleep 0.1;

_unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 6 ) then { sleep 5; };

sleep 0.1;

_unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 4 ) then { sleep 5; };

sleep 0.1;

_unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 3 ) then { sleep 5; };

sleep 0.1;

_unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount > 0 && _unitscount <= 2 ) then { sleep 5; };

sleep 0.1;

_unitscount = [ getmarkerpos _sector , _corrected_size , CONST_SIDE_BLUFOR ] call F_getUnitsCount;
if ( _unitscount == 1 ) then { sleep 5; };