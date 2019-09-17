fn_SyncGroupClient = {
	params ["_GroupName", "_GroupType"];
	(group player) setVariable ['GroupType',_GroupType,true];
	[_GroupName,_GroupType,player,group player] remoteExecCall ["fn_SyncGroupServer",2];
};


addMissionEventHandler ["eachFrame" , {
	if (!isnil {uiNamespace getVariable "BIS_dynamicGroups_display"} && isNil "GroupTagDialog") then {
		GroupTagDialog = [] spawn {
			disableSerialization;
			private ["_display" , "_cntrlGroupEdit" , "_cntrlsquadDescription" , "_cntrlGroupList"];
			_display =  (uiNamespace getVariable "BIS_dynamicGroups_display");
			_cntrlGroupEdit = _display displayCtrl 9777;

			{_cntrlGroupEdit ctrlRemoveAllEventHandlers _x} forEach ["KeyDown" , "SetFocus" ,"KillFocus" ];
			_cntrlGroupEdit ctrlSetEventHandler ["MouseButtonClick" ," (uiNamespace getVariable 'BIS_dynamicGroups_display') closeDisplay 2; createDialog 'liberation_GroupManager'; "];

			waitUntil {uisleep (1/diag_fps); isnil {uiNamespace getVariable "BIS_dynamicGroups_display"}   };
			GroupTagDialog = nil;
			terminate _thisScript;
		};
	};
}];
