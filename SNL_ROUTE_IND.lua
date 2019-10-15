NEXT_IND = 10001
NEXT_SPEED = 10002
REAR = -1
PRIMARY_TEXT = 0
SECONDARY_TEXT = 1
gConnectedLink	= 0
INDON = false

function Initialise ()
	gLinkCount = Call( "GetLinkCount" )
	gCurrentIndicator		= ""
	gSignalState = STOP
	Call( "BeginUpdate" )
end

function Update( time )
	SNLRouteIndicator (  )
end

function OnSignalMessage( message, parameter, direction, linkIndex )
	Call( "SendSignalMessage", message, parameter, -direction, 1, linkIndex )
end

function GetSignalState( )

	if gSignalState == STOP then
	
	else
		
	end

end

function SNLRouteIndicator (  )
	linkCountAsString = "" .. (5 * (gLinkCount + 1))
	local gconnectedLink = Call( "GetConnectedLink", linkCountAsString, 1, 0 )
	local newIndicator = 00
	local newIndicatorStr = ""
	if gconnectedLink > 0 then
		newIndicator = Call("GetLinkFeatherChar",gconnectedLink)
		if newIndicator ~= 0 then
			newIndicatorStr = string.char(newIndicator)
			A = string.sub(newIndicatorStr, 1,1)
		else
			newIndicatorStr = ""
		end
	end
	if gCurrentIndicator ~= newIndicatorStr then
			Call( "IND1:SetText", A, PRIMARY_TEXT )
            Call( "SetText", A, PRIMARY_TEXT )
	end
	gCurrentIndicator = newIndicatorStr
	Call ("BeginUpdate")
	Call ("SendSignalMessage", NEXT_IND, A, REAR, 1, 0)
end

function SNLSpeedIndicator ( )
    linkCountAsString = "" .. (5 * (gLinkCount + 1))
	local gconnectedLink = Call( "GetConnectedLink", linkCountAsString, 1, 0 )
	gReceivedSpeedLimit = Call("GetLinkSpeedLimit", gconnectedLink)
	local newIndicator = ""
	local speedLimit = tonumber(gReceivedSpeedLimit)
		if speedLimit == nil then
			speedLimit = -1
		end
		if speedLimit > 0 and speedLimit < 160 then
			newIndicator = "" .. math.floor(speedLimit / 10)
			if		newIndicator == "10" then newIndicator = "a"
			elseif	newIndicator == "11" then newIndicator = "b"
			elseif	newIndicator == "12" then newIndicator = "c"
			elseif	newIndicator == "13" then newIndicator = "d"
			elseif	newIndicator == "14" then newIndicator = "e"
			elseif	newIndicator == "15" then newIndicator = "f"
			elseif	newIndicator == "16" then newIndicator = "g"
			end
            Call( "SetText", newIndicator, PRIMARY_TEXT )
		else
			speedLimit = -1
			Call( "SetText", "", PRIMARY_TEXT )
		end
	gCurrentIndicator = newIndicator
	Call ("BeginUpdate")
	Call ("SendSignalMessage", NEXT_SPEED, newIndicator, REAR, 1, 0)
end