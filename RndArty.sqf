// Author: Vincent Heuken
// RndArty.sqf
// Version 1.1
// Script randomly fires artillery inside a marker
// continuously until object is destroyed

//
// USAGE:
// ["MARKERNAME", objectname] execVM "RndArty.sqf"
//

_marker = _this select 0;
_obj = _this select 1;


// gets center position of area marker;
_centerPos = getMarkerPos _marker;
_centerX = abs(_centerPos select 0);
_centerY = abs(_centerPos select 1);

// gets size of marker
_markerSize = getMarkerSize _marker;
_sizeX = _markerSize select 0;
_sizeY = _markerSize select 1;

_sizeX = _sizeX/2;
_sizeY = _sizeY/2;

// while object is alive
while {alive _obj} do
{
	_x = 0;
	_y = 0;

	_test= round(random 1);
	
	if (_test == 1) then
	{
		_rand = random _sizeX;
		_x = _centerX + _rand;
	}
	else
	{
		_rand = random _sizeX;
		_x = _centerX - _rand;
	};

	_test = round(random 1);

	if (_test == 1) then
	{
		_rand = random _sizeY;
		_y = _centerY + _rand;
	}
	else
	{
		_rand = random _sizeY;
		_y = _centerY - _rand;
	};
	
	"Sh_105_HE" createVehicle [_x,_y];
	_rand = round(random 10);
	sleep _rand;
}
