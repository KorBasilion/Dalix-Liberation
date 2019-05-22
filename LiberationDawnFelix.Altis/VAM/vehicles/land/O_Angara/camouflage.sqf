//O_Angara Camouflage
//[["Hex",1],["showCamonetHull",0,"showCamonetTurret",0]]
selectcamo = 0;
_subname = localize "STR_VAM_SUB_CAMOUFLAGE";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_HEX_ARID_CAMO";
_subsel2 = localize "STR_VAM_GREEN_HEX_CAMO";
_subsel3 = localize "STR_VAM_JUNGLE_CAMO";
_subsel4 = localize "STR_VAM_GREY_CAMO";
_VAM_camo =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcamo = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcamo = 1;"]], "1", "1"],
	[_subsel2, [4], "", -5, [["expression", "selectcamo = 2;"]], "1", "1"],
	[_subsel3, [5], "", -5, [["expression", "selectcamo = 3;"]], "1", "1"],
	[_subsel4, [6], "", -5, [["expression", "selectcamo = 4;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcamo = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_camo";

waitUntil {sleep 0.1; selectcamo != 0};
private _targetvehicle = vehicle player;

if (selectcamo isEqualTo -1) exitWith {};

if (selectcamo > 0) then {hint localize "STR_VAM_SUB_CAMOUFLAGE_APPLIED";};

if (selectcamo isEqualTo 1) exitWith {
	[_targetvehicle,["Hex",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Angara_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 2) exitWith {
	[_targetvehicle,["GreenHex",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Angara_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 3) exitWith {
	[_targetvehicle,["Jungle",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Angara_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 4) exitWith {
	[_targetvehicle,["Grey",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Angara_camo; sleep 2; hint "";
};