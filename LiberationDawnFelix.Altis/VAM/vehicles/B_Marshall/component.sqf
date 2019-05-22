//B_Marshall Components
//[["Sand",1],["showBags",0,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",0,"showSLATTurret",0]]
selectcomp = 0;
_subname = localize "STR_VAM_SUB_COMPONENT";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subnone = localize "STR_VAM_NONE_COMP";
_subevery = localize "STR_VAM_EVERYTHING_COMP";
_subsel1 = localize "STR_VAM_CAMONET_HULL_COMP";
_subsel2 = localize "STR_VAM_CAMONET_TURRET_COMP";
_subsel3 = localize "STR_VAM_EXTERNAL_BAG_1_COMP";
_subsel4 = localize "STR_VAM_SLAT_ARMOR_HULL_COMP";
_subsel5 = localize "STR_VAM_SLAT_ARMOR_TURRET_COMP";
_VAM_Comp =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcomp = -1;"]], "1", "1"],
	[_subnone, [3], "", -5, [["expression", "selectcomp = 1;"]], "1", "1"],
	[_subsel1, [4], "", -5, [["expression", "selectcomp = 2;"]], "1", "1"],
	[_subsel2, [5], "", -5, [["expression", "selectcomp = 3;"]], "1", "1"],
	[_subsel3, [6], "", -5, [["expression", "selectcomp = 4;"]], "1", "1"],
	[_subsel4, [7], "", -5, [["expression", "selectcomp = 5;"]], "1", "1"],
	[_subsel5, [8], "", -5, [["expression", "selectcomp = 6;"]], "1", "1"],
	[_subevery, [9], "", -5, [["expression", "selectcomp = 7;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcomp = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_comp";

waitUntil {sleep 0.1; selectcomp != 0};
private _targetvehicle = vehicle player;
private _getvc = [_targetvehicle] call BIS_fnc_getVehicleCustomization;
private _check = _getvc select 1;
private _op1 = _check select 3;
private _op2 = _check select 5;
private _op3 = _check select 1;
private _op4 = _check select 7;
private _op5 = _check select 9;

if (selectcomp isEqualTo -1) exitWith {};

if (selectcomp > 0) then {hint localize "STR_VAM_SUB_COMPONENT_APPLIED";};

if (selectcomp isEqualTo 1) exitWith {[_targetvehicle,nil,[true],nil] call BIS_fnc_initVehicle; [] spawn fnc_Marshall_comp; sleep 2; hint "";};

if (selectcomp isEqualTo 7) exitWith {
	[_targetvehicle,nil,["showBags",1,"showCamonetHull",1,"showCamonetTurret",1,"showSLATHull",1,"showSLATTurret",1],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Marshall_comp; sleep 2; hint "";
};

if (selectcomp isEqualTo 2) then {
	if (_check select 3 isEqualTo 0) then {_op1 = 1;};
	if (_check select 3 isEqualTo 1) then {_op1 = 0;};
};

if (selectcomp isEqualTo 3) then {
	if (_check select 5 isEqualTo 0) then {_op2 = 1;};
	if (_check select 5 isEqualTo 1) then {_op2 = 0;};
};

if (selectcomp isEqualTo 4) then {
	if (_check select 1 isEqualTo 0) then {_op3 = 1;};
	if (_check select 1 isEqualTo 1) then {_op3 = 0;};
};

if (selectcomp isEqualTo 5) then {
	if (_check select 7 isEqualTo 0) then {_op4 = 1;};
	if (_check select 7 isEqualTo 1) then {_op4 = 0;};
};

if (selectcomp isEqualTo 6) then {
	if	(_check select 9 isEqualTo 0) then {_op5 = 1;};
	if	(_check select 9 isEqualTo 1) then {_op5 = 0;};
};

if (true) then {
	[_targetvehicle,nil,["showBags",_op3,"showCamonetHull",_op1,"showCamonetTurret",_op2,"showSLATHull",_op4,"showSLATTurret",_op5],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Marshall_comp; sleep 2; hint "";
};