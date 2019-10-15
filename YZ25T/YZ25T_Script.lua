PRIMARY_TEXT = 0
SECONDARY_TEXT = 1
function Initialise ()
Call( "BeginUpdate" )
end
function Update ( time )
speed1 = Call("GetSpeed")

if speed1 >= 0 then
gSpeed3 = speed1*3.6
else
gSpeed3 = math.abs(speed1*3.6)
end

gSPdecimal = math.floor( math.mod( gSpeed3, 10 ))
gUnits = math.floor( math.mod( gSpeed3/10, 10 ))
gTens = math.floor( math.mod( gSpeed3/100, 10 ))
gHundreds = math.floor( gSpeed3/1000 )

if gTens == 0 then
gTens = -1
if gUnits == 0 then
gUnits = -1
end
end
Call( "SPDU:SetText", gSPdecimal , PRIMARY_TEXT )
Call( "SPDT:SetText", gUnits , PRIMARY_TEXT )
Call( "SPDH:SetText", gTens , PRIMARY_TEXT )
	
-- in-game real time clock
gTIMESEC = SysCall("ScenarioManager:GetTimeOfDay")
gHour = math.floor(gTIMESEC/3600)
gMin = math.floor(math.mod(gTIMESEC/60,60))
gSec = math.mod(gTIMESEC,60)

    gH1 = math.floor( math.mod( gHour, 10 ))
    gH2 = math.floor( math.mod( gHour/10, 10 ))
	if gH2 == 0 then
       gH2 = -1
    end
	
	gM1 = math.floor( math.mod( gMin, 10 ))
    gM2 = math.floor( math.mod( gMin/10, 10 ))

Call( "TIMEHU:SetText", gH1 , PRIMARY_TEXT )
Call( "TIMEHT:SetText", gH2 , PRIMARY_TEXT )
Call( "TIMEMU:SetText", gM1 , PRIMARY_TEXT )
Call( "TIMEMT:SetText", gM2 , PRIMARY_TEXT )
--clock end

end

function OnConsistMessage ( msg, argument, direction )

Call( "SendConsistMessage", msg, argument, direction )

end
