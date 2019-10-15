
function DebugPrint( message )
	if (DEBUG) then
		Print( message )
	end
end
PRIMARY_TEXT = 0
SECONDARY_TEXT = 1
TRUE = 1
FALSE = 0
AL_VISUAL_TIME_DELAY = 30
AL_AUDIBLE_TIME_DELAY = 5
AL_SHUTDOWN_TIME_DELAY = 5
AL_FLASH_INTERVAL_SECS = 0.5
AL_MIN_ALERT_SPEED = 15
AL_STATE_NORMAL = 0
AL_STATE_ALARM = 1
gALstate = 0
gALtimeout = 0.0
gTrainBrakeValue = 0.0
gEngineBrakeValue = 0.0
gALflashstate = 0
gALflashinterval = 0
ON = 1
OFF = 0
gDISRUN = 0
gTime = 0
gMileTime = 0
gLastBrake = 0
gLastDyno = 0
gDynoCoupled = 1
gOldpage = 0
gSpark = 0
gTimeSpark = 0
gTilt = 0
gSparkStorm = false
gSparkStormTime = 0
gSparkFactor = 0
gFrontPantoTime = 0
gRearPantoTime = 0
CamLe = true
gSpeedFlashTime = 0
gSpeedIsFlash = false
gSpeedlimitFlashTime = 0
gSpeedlimitIsFlash = false
Fr = false
Be = false
LASTE = false
LEADE = false
HANDBRAKE_APP = 80001
LEAD_ENGINE = 80002
LAST_ENGINE = 80003
ENGINE_CONNECT = 80004
PANTO_HEI = 80005
PANTO_SEL = 80006
PANTO_SW = 80007
BATT_SW = 80008
HANDBRAKE_REL = 80009
function Initialise ()
    Call( "SetControlValue", "HBU", 0, 0 )
	Call( "Spark11:Activate", 0 )
Call( "Spark12:Activate", 0 )
Call( "Spark21:Activate", 0 )
Call( "Spark22:Activate", 0 )
Call( "SparkLF:Activate", 0 )
Call( "SparkLR:Activate", 0 )
Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 0 )
    Call( "BeginUpdate" )
end

function OnCameraEnter ( cabEndWithCamera, carriageCam )
 
 if cabEndWithCamera == 1 then
    Call("*:SetControlValue", "DriverPosition", 0, 1)
	Call("*:ActivateNode", "driverF", 1)
	Call("*:ActivateNode", "driverB", 0)
	CamLe = false
	Fr = true
	Be = false
 elseif cabEndWithCamera == 2 then
    Call("*:SetControlValue", "DriverPosition", 0, -1)
	Call("*:ActivateNode", "driverF", 0)
	Call("*:ActivateNode", "driverB", 1)
	CamLe = false
	Fr = false
	Be = true
 end
end

function OnCameraLeave ( )
 CamLe = true
end

function OnControlValueChange ( name, index, value )

if Call( "*:ControlExists", name, index ) then
       Call( "*:SetControlValue", name, index, value );
end

gDP1 = Call("*:GetControlValue", "DriverPosition", 0)

if gDP1 == 1 then
if name == "Headlights" then
		if value == 0 then
			Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 0 )
		elseif value == 1 then
		    Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 1 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 1 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 1 )
		elseif value == 2 then
		    Call( "FwdHeadlight01:Activate", 1 )
			Call( "FwdHeadlight02:Activate", 1 )
			Call( "FwdHeadlight03:Activate", 1 )
			Call( "FwdHeadlight04:Activate", 1 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 1 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 1 )
		elseif value == 3 then
		    Call( "FwdHeadlight01:Activate", 1 )
			Call( "FwdHeadlight02:Activate", 1 )
			Call( "FwdHeadlight03:Activate", 1 )
			Call( "FwdHeadlight04:Activate", 1 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 1 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 1 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 1 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 1 )
		end
	end
elseif gDP1 == -1 then
if name == "Headlights" then
		if value == 0 then
			Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 0 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 0 )
			Call( "BwdTaillight02:Activate", 0 )
			Call( "FwdTaillight02:Activate", 0 )
		elseif value == 1 then
		    Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 0 )
			Call( "BwdHeadlight02:Activate", 0 )
			Call( "BwdHeadlight03:Activate", 0 )
			Call( "BwdHeadlight04:Activate", 1 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 1 )
			Call( "BwdTaillight02:Activate", 1 )
			Call( "FwdTaillight02:Activate", 0 )
		elseif value == 2 then
		    Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 1 )
			Call( "BwdHeadlight02:Activate", 1 )
			Call( "BwdHeadlight03:Activate", 1 )
			Call( "BwdHeadlight04:Activate", 1 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 0 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 0 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 1 )
			Call( "BwdTaillight02:Activate", 1 )
			Call( "FwdTaillight02:Activate", 0 )
		elseif value == 3 then
		    Call( "FwdHeadlight01:Activate", 0 )
			Call( "FwdHeadlight02:Activate", 0 )
			Call( "FwdHeadlight03:Activate", 0 )
			Call( "FwdHeadlight04:Activate", 0 )
			Call( "BwdHeadlight01:Activate", 1 )
			Call( "BwdHeadlight02:Activate", 1 )
			Call( "BwdHeadlight03:Activate", 1 )
			Call( "BwdHeadlight04:Activate", 1 )
			Call( "FLightFR:Activate", 0 )
			Call( "FLightRR:Activate", 1 )
			Call( "FLightFL:Activate", 0 )
			Call( "FLightRL:Activate", 1 )
			Call( "FwdTaillight01:Activate", 0 )
			Call( "BwdTaillight01:Activate", 1 )
			Call( "BwdTaillight02:Activate", 1 )
			Call( "FwdTaillight02:Activate", 0 )
		end
	end
end
    
	if name == "CabLight" then
		if value == 2 then
			Call( "CabLight1L:Activate", 0 )
			Call( "CabLight1R:Activate", 0 )
			Call( "CabLight2L:Activate", 0 )
			Call( "CabLight2R:Activate", 0 )
			Call( "DeskLight1:Activate", 1 )
			Call( "DeskLight2:Activate", 1 )
			SysCall("ScenarioManager:ShowAlertMessageExt", "INFO" , "DeskLight On" , 3 )
		elseif value == 1 then
			Call( "CabLight1L:Activate", 0 )
			Call( "CabLight1R:Activate", 0 )
			Call( "CabLight2L:Activate", 0 )
			Call( "CabLight2R:Activate", 0 )
			Call( "DeskLight1:Activate", 0 )
			Call( "DeskLight2:Activate", 0 )
			SysCall("ScenarioManager:ShowAlertMessageExt", "INFO" , "Light Off" , 3 )
		elseif value == 0 then
			Call( "CabLight1L:Activate", 1 )
			Call( "CabLight1R:Activate", 1 )
			Call( "CabLight2L:Activate", 1 )
			Call( "CabLight2R:Activate", 1 )
			Call( "DeskLight1:Activate", 0 )
			Call( "DeskLight2:Activate", 0 )
			SysCall("ScenarioManager:ShowAlertMessageExt", "INFO" , "CabLight On" , 3 )
		end
	end
	
	
	
	if name == "AWSReset" then
    ALresetAlerter(1)
    end
	
end

function Panto ( par )
  gPR = Call("*:GetControlValue", "PantographControl", 0)
  gPSEL = Call("*:GetControlValue", "pantosel", 0)
  gPHSEL = Call("*:GetControlValue", "pantohei", 0)
  if par == 0 then
  Call("*:AddTime", "frontPanto",  -0.003)
  Call("*:AddTime", "rearPanto",  -0.003)
  Call("*:AddTime", "frontPanto1",  -0.003)
  Call("*:AddTime", "rearPanto1",  -0.003)
  Call("*:AddTime", "frontPanto2",  -0.003)
  Call("*:AddTime", "rearPanto2",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  elseif par == 1 then
  if gPSEL == 1 then
  if gPHSEL == 0 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto",  -0.003)
  Call("*:AddTime", "rearPanto",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto",  -0.003)
  Call("*:AddTime", "rearPanto",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 1 )
  end
  elseif gPHSEL == 1 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto1",  -0.003)
  Call("*:AddTime", "rearPanto1",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto1",  -0.003)
  Call("*:AddTime", "rearPanto1",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 1 )
  end
  elseif gPHSEL == 2 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto2",  -0.003)
  Call("*:AddTime", "rearPanto2",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto2",  -0.003)
  Call("*:AddTime", "rearPanto2",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 1 )
  end
  end
  elseif gPSEL == 2 then
  if gPHSEL == 0 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto",  -0.003)
  Call("*:AddTime", "rearPanto",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto",  0.003)
  Call("*:AddTime", "rearPanto",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 1 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  elseif gPHSEL == 1 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto1",  -0.003)
  Call("*:AddTime", "rearPanto1",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto1",  0.003)
  Call("*:AddTime", "rearPanto1",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 1 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  elseif gPHSEL == 2 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto2",  -0.003)
  Call("*:AddTime", "rearPanto2",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto2",  0.003)
  Call("*:AddTime", "rearPanto2",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 1 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  end
  elseif gPSEL == 0 then
  if gPHSEL == 0 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto",  -0.003)
  Call("*:AddTime", "rearPanto",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto",  0.003)
  Call("*:AddTime", "rearPanto",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  elseif gPHSEL == 1 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto1",  -0.003)
  Call("*:AddTime", "rearPanto1",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto1",  0.003)
  Call("*:AddTime", "rearPanto1",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  elseif gPHSEL == 2 then
  if gPR == 0 then
  Call("*:AddTime", "frontPanto2",  -0.003)
  Call("*:AddTime", "rearPanto2",  -0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  elseif gPR == 1 then
  Call("*:AddTime", "frontPanto2",  0.003)
  Call("*:AddTime", "rearPanto2",  0.003)
  Call("*:SetControlValue", "RearPantograph", 0, Call("*:GetControlValue", "RearPantograph", 0) - 0.003)
  Call("*:SetControlValue", "FrontPantograph", 0, Call("*:GetControlValue", "FrontPantograph", 0) - 0.003)
  Call( "*:SetControlValue", "FrontPantographC", 0, 0 )
  Call( "*:SetControlValue", "RearPantographC", 0, 0 )
  end
  end
  end
  end
end

function Update ( time )

if Call( "GetIsPlayer" ) == 1 then

if ( Call( "GetIsEngineWithKey" ) == 1 ) then
			if gDriven == 0 then
				gDriven = 1
				Call( "*:SetControlValue", "Active", 0, 1 )
			end
		else
			if gDriven == 1 then
				gDriven = 0
				Call( "*:SetControlValue", "Active", 0, 0 )
			end
		end

gBt = Call("*:GetControlValue", "battsw2", 0)
gPanto = Call("*:GetControlValue", "PantographControl", 0)
gStaT = Call("*:GetControlValue", "Startup", 0)
gHba = Call("*:GetControlValue", "hba", 0)
gHbr = Call("*:GetControlValue", "hbr", 0)
gMCB = Call("*:GetControlValue", "MCB", 0)
Panto (1)
if gBt == 0 then
	Call( "SetControlValue", "Startup", 0, -1 )
	Call( "SetControlValue", "HBU", 0, 0 )
	Call( "SetControlValue", "MCB", 0, 0 )
	Call( "SetControlValue", "CabLight", 0, 1 )
	Call( "SetControlValue", "Headlights", 0, 0 )
	Call( "SetControlValue", "PantographControl", 0, 0 )
	Call( "SetControlValue", "SCREENHIDE", 0, 1 )
	LCDDisplay( "","" )
elseif gBt == 1 then
Call( "SetControlValue", "Startup", 0, -1 )
Call( "SetControlValue", "HBU", 0, 0 )
Call( "SetControlValue", "Volt", 0, 0 )
Call( "SetControlValue", "SCREENHIDE", 0, 1 )
LCDDisplay( "","" )
if gPanto == 0 then
Call( "SetControlValue", "Startup", 0, -1 )
Call( "SetControlValue", "HBU", 0, 0 )
Call( "SetControlValue", "Volt", 0, 0 )
Call( "SetControlValue", "SCREENHIDE", 0, 1 )
elseif gPanto == 1 then
Call( "SetControlValue", "Startup", 0, -1 )
Call( "SetControlValue", "HBU", 0, 0 )
Call( "SetControlValue", "Volt", 0, 0 )
Call( "SetControlValue", "SCREENHIDE", 0, 1 )
if gMCB == 0 then
Call( "SetControlValue", "Startup", 0, -1 )
Call( "SetControlValue", "HBU", 0, 0 )
Call( "SetControlValue", "Volt", 0, 0 )
Call( "SetControlValue", "SCREENHIDE", 0, 1 )
elseif gMCB == 1 then
Call( "SetControlValue", "Startup", 0, 1 )
Call( "SetControlValue", "HBU", 0, 8 )
Call( "SetControlValue", "Volt", 0, 25 )
Call( "SetControlValue", "SCREENHIDE", 0, 1 )
end
end
end

Call( "SetControlValue", "aiCabVolume", 0, 0.6 )
Call( "SetControlValue", "LKJATSTOP", 0, 1 )
Call( "SetControlValue", "LKJATSPEED", 0, 1 )
--Call( "SetControlValue", "HBU", 0, 7 )
--Call( "SetControlValue", "HBU", 0, 8 )

if Call( "SendConsistMessage", ENGINE_CONNECT, "", 1 ) == 0 then
LCDDisplay("LAST ENGINE","1")
Call( "SendConsistMessage", PANTO_HEI, gPHSEL, 0 )
Call( "SendConsistMessage", PANTO_SEL, gPSEL, 0 )
Call( "SendConsistMessage", PANTO_SW, gPR, 0 )
Call( "SendConsistMessage", BATT_SW, gBt, 0 )
Call( "SendConsistMessage", PANTO_HEI, gPHSEL, 1 )
Call( "SendConsistMessage", PANTO_SEL, gPSEL, 1 )
Call( "SendConsistMessage", PANTO_SW, gPR, 1 )
Call( "SendConsistMessage", BATT_SW, gBt, 1 )
LASTE = true
end
if Call( "SendConsistMessage", ENGINE_CONNECT, "", 0 ) == 0 then
LCDDisplay("LEAD ENGINE","1")
Call( "SendConsistMessage", PANTO_HEI, gPHSEL, 1 )
Call( "SendConsistMessage", PANTO_SEL, gPSEL, 1 )
Call( "SendConsistMessage", PANTO_SW, gPR, 1 )
Call( "SendConsistMessage", BATT_SW, gBt, 1 )
Call( "SendConsistMessage", PANTO_HEI, gPHSEL, 0 )
Call( "SendConsistMessage", PANTO_SEL, gPSEL, 0 )
Call( "SendConsistMessage", PANTO_SW, gPR, 0 )
Call( "SendConsistMessage", BATT_SW, gBt, 0 )
LEADE = true
end
  gMRP = Call("*:GetControlValue", "MainReservoirPressureBAR", 0)
  gERP = Call("*:GetControlValue", "TrainBrakeCylinderPressureBAR", 0)
  gABP = Call("*:GetControlValue", "BrakePipePressureBAR", 0)
  gLBP = Call("*:GetControlValue", "LocoBrakeCylinderPressureBAR", 0)
  
  Call("DGSound1:SetParameter" ,"LocoBrakeCylinderPressureBAR",gLBP)
  Call("DGSound2:SetParameter" ,"LocoBrakeCylinderPressureBAR",gLBP)

  gMRPKpa = gMRP*100
  gERPKpa = gERP*100
  gABPKpa = gABP*100
  gLBPKpa = gLBP*100

  Call("SetControlValue", "MainReservoirPressureKPA", 0,  gMRPKpa)
  Call("SetControlValue", "TrainBrakeCylinderPressureKPA", 0,  gERPKpa)
  Call("SetControlValue", "BrakePipePressureKPA", 0,  gABPKpa)
  Call("SetControlValue", "LocoBrakeCylinderPressureKPA", 0,  gLBPKpa)

  
Thr = Call("*:GetControlValue", "Regulator", 0)
Dyn = Call("*:GetControlValue", "DynamicBrake", 0)
Hdr = Call("*:GetControlValue", "HandBrake", 0)
if Dyn == 0 and Thr == 0 then
Call("*:SetControlValue", "TractiveEffortPreOutput", 0, 0 )
elseif Thr > 0 then
Call("*:SetControlValue", "TractiveEffortPreOutput", 0, Thr )
elseif Dyn > 0 then
Dyn = -Dyn
Call("*:SetControlValue", "TractiveEffortPreOutput", 0, Dyn )
end

Cru = Call("GetCurvature")
Call("DGSound1:SetParameter" ,"Curvature",Cru)
Call("DGSound2:SetParameter" ,"Curvature",Cru)
--ammeter
Amp = Call("*:GetControlValue", "Ammeter", 0)
Amp2= math.abs(Amp)
Call("DGSound1:SetParameter" ,"Ammeter",Amp)
Call("DGSound2:SetParameter" ,"Ammeter",Amp)
if Amp >= 0 then
Call("*:SetControlValue", "Ammeter2", 0, Amp2 )
Call("*:SetControlValue", "Ammeter3", 0, 0 )
AmpD = math.floor(Amp2)
gSPdecimal = math.floor( math.mod( AmpD, 10 ))
    gUnits = math.floor( math.mod( AmpD/10, 10 ))
    gTens = math.floor( math.mod( AmpD/100, 10 ))
    gHundreds = math.floor( AmpD/1000 )
	 if gTens == 0 then
      gTens = -1
      if gUnits == 0 then
        gUnits = -1
      end
    end
Call( "AMPU:SetText", gSPdecimal , PRIMARY_TEXT )
Call( "AMPT:SetText", gUnits , PRIMARY_TEXT )
Call( "AMPH:SetText", gTens , PRIMARY_TEXT )
end
Amp3= math.abs(Amp)
if Amp <= 0 then
Call("*:SetControlValue", "Ammeter3", 0, Amp3 )
Call("*:SetControlValue", "Ammeter2", 0, 0 )
end

if Call("GetIsDeadEngine") == 1 then
Call("*:SetControlValue", "Startup", 0, -1 )
end

if (Fr == true)and(Be == false) then
result, state, distance, proState = Call("GetNextRestrictiveSignal",0,0,10000)
type, speedn, distancen = Call( "GetNextSpeedLimit" ,0,0,9999)
elseif (Fr==false)and(Be == true) then
result, state, distance, proState = Call("GetNextRestrictiveSignal",1,0,10000)
type, speedn, distancen = Call( "GetNextSpeedLimit" ,1,0,9999)
end
	gDistance = distance
	gDistance2 = math.floor(distance)
	gSigMode = Call("*:GetControlValue", "sigch", 0)
	 if gDistance2 >= 10000 then
	 Call( "DisFU:SetText", "-" , PRIMARY_TEXT )
     Call( "DisFT:SetText", "-" , PRIMARY_TEXT )
     Call( "DisFH:SetText", "-" , PRIMARY_TEXT )
     Call( "DisFTH:SetText", "-" , PRIMARY_TEXT )
	 Call( "DISLU:SetText", "-" , PRIMARY_TEXT )
     Call( "DISLT:SetText", "-" , PRIMARY_TEXT )
     Call( "DISLH:SetText", "-" , PRIMARY_TEXT )
     Call( "DISLTH:SetText", "-" , PRIMARY_TEXT )
	 else
	gSPdecimal3 = math.floor( math.mod( gDistance2, 10 ))
    gUnits3 = math.floor( math.mod( gDistance2/10, 10 ))
    gTens3 = math.floor( math.mod( gDistance2/100, 10 ))
    gHundreds3 = math.floor( gDistance2/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if gHundreds3 == 0 then
	  gHundreds3 = -1
	 if gTens3 == 0 then
      gTens3 = -1
      if gUnits3 == 0 then
        gUnits3 = -1
      end
    end
   end
   end
Call( "DisFU:SetText", gSPdecimal3 , PRIMARY_TEXT )
Call( "DisFT:SetText", gUnits3 , PRIMARY_TEXT )
Call( "DisFH:SetText", gTens3 , PRIMARY_TEXT )
Call( "DisFTH:SetText", gHundreds3 , PRIMARY_TEXT )

trackLimit = Call("GetCurrentSpeedLimit")
speedn2 = math.floor( speedn * 3.6 )
	gSpeedo4 = 3.6*trackLimit
	gSpeedo4 = math.floor(gSpeedo4)
  Call( "SetControlValue", "SpdLimitInd", 0, gSpeedo4 )
  
  gSPdecimal = math.floor( math.mod( speedn2, 10 ))
    gUnits = math.floor( math.mod( speedn2/10, 10 ))
    gTens = math.floor( math.mod( speedn2/100, 10 ))
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	 if gTens == 0 then
      gTens = -1
      if gUnits == 0 then
        gUnits = -1
      end
    end
	
	gSPdecimal4 = math.floor( math.mod( distancen, 10 ))
    gUnits4 = math.floor( math.mod( distancen/10, 10 ))
    gTens4 = math.floor( math.mod( distancen/100, 10 ))
    gHundreds4 = math.floor( distancen/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if gHundreds4 == 0 then
	  gHundreds4 = -1
	 if gTens4 == 0 then
      gTens4 = -1
      if gUnits4 == 0 then
        gUnits4 = -1
      end
    end
   end
	
	
	 gSPdecimal1 = math.floor( math.mod( gSpeedo4, 10 ))
    gUnits1 = math.floor( math.mod( gSpeedo4/10, 10 ))
    gTens1 = math.floor( math.mod( gSpeedo4/100, 10 ))
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	 if gTens1 == 0 then
      gTens1 = -1
      if gUnits1 == 0 then
        gUnits1 = -1
      end
    end
	
	gSpeedlimitFlashTime = gSpeedlimitFlashTime + time
	if (distancen>1900)and(distancen<2100) then
	 if gSpeedlimitFlashTime > 1 then
		gSpeedlimitFlashTime = 0
		if gSpeedlimitIsFlash == false then
		gSpeedlimitIsFlash = true
		Call( "SPDLLFU:SetText", gSPdecimal , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens , PRIMARY_TEXT )
		Call( "DISLU:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLT:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLH:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", 2 , PRIMARY_TEXT )
		else
		gSpeedlimitIsFlash = false
		Call( "SPDLLFU:SetText", gSPdecimal1 , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits1 , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens1 , PRIMARY_TEXT )
		Call( "DISLU:SetText", gSPdecimal3 , PRIMARY_TEXT )
        Call( "DISLT:SetText", gUnits3 , PRIMARY_TEXT )
        Call( "DISLH:SetText", gTens3 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", gHundreds3 , PRIMARY_TEXT )
		end
	end
	elseif (distancen<1100)and(distancen>900) then
	if gSpeedlimitFlashTime > 1 then
		gSpeedlimitFlashTime = 0
		if gSpeedlimitIsFlash == false then
		gSpeedlimitIsFlash = true
		Call( "SPDLLFU:SetText", gSPdecimal , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens , PRIMARY_TEXT )
		Call( "DISLU:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLT:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLH:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", 1 , PRIMARY_TEXT )
		else
		gSpeedlimitIsFlash = false
		Call( "SPDLLFU:SetText", gSPdecimal1 , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits1 , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens1 , PRIMARY_TEXT )
		Call( "DISLU:SetText", gSPdecimal3 , PRIMARY_TEXT )
        Call( "DISLT:SetText", gUnits3 , PRIMARY_TEXT )
        Call( "DISLH:SetText", gTens3 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", gHundreds3 , PRIMARY_TEXT )
		end
	end
	elseif (distancen>450) and(distancen<550) then
	if gSpeedlimitFlashTime > 1 then
		gSpeedlimitFlashTime = 0
		if gSpeedlimitIsFlash == false then
		gSpeedlimitIsFlash = true
		Call( "SPDLLFU:SetText", gSPdecimal , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens , PRIMARY_TEXT )
		Call( "DISLU:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLT:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLH:SetText", 5 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", "" , PRIMARY_TEXT )
		else
		gSpeedlimitIsFlash = false
		Call( "SPDLLFU:SetText", gSPdecimal1 , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits1 , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens1 , PRIMARY_TEXT )
		Call( "DISLU:SetText", gSPdecimal3 , PRIMARY_TEXT )
        Call( "DISLT:SetText", gUnits3 , PRIMARY_TEXT )
        Call( "DISLH:SetText", gTens3 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", gHundreds3 , PRIMARY_TEXT )
		end
	end
	elseif (distancen>190) and(distancen<80) then
	if gSpeedlimitFlashTime > 1 then
		gSpeedlimitFlashTime = 0
		if gSpeedlimitIsFlash == false then
		gSpeedlimitIsFlash = true
		Call( "SPDLLFU:SetText", gSPdecimal , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens , PRIMARY_TEXT )
		Call( "DISLU:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLT:SetText", 0 , PRIMARY_TEXT )
        Call( "DISLH:SetText", 1 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", "" , PRIMARY_TEXT )
		else
		gSpeedlimitIsFlash = false
		Call( "SPDLLFU:SetText", gSPdecimal1 , PRIMARY_TEXT )
        Call( "SPDLLFT:SetText", gUnits1 , PRIMARY_TEXT )
        Call( "SPDLLFH:SetText", gTens1 , PRIMARY_TEXT )
		Call( "DISLU:SetText", gSPdecimal3 , PRIMARY_TEXT )
        Call( "DISLT:SetText", gUnits3 , PRIMARY_TEXT )
        Call( "DISLH:SetText", gTens3 , PRIMARY_TEXT )
        Call( "DISLTH:SetText", gHundreds3 , PRIMARY_TEXT )
		end
	end
	else
	Call( "SPDLLFU:SetText", gSPdecimal1 , PRIMARY_TEXT )
    Call( "SPDLLFT:SetText", gUnits1 , PRIMARY_TEXT )
    Call( "SPDLLFH:SetText", gTens1 , PRIMARY_TEXT )
	Call( "DISLU:SetText", gSPdecimal3 , PRIMARY_TEXT )
    Call( "DISLT:SetText", gUnits3 , PRIMARY_TEXT )
    Call( "DISLH:SetText", gTens3 , PRIMARY_TEXT )
    Call( "DISLTH:SetText", gHundreds3 , PRIMARY_TEXT )
	end


gSpeed = Call("*:GetControlValue", "SpeedometerKPH", 0)
gSpeed2 = math.floor(gSpeed)
Call( "SetControlValue", "SpeedometerS", 0, gSpeed2 )
   gSPdecimal = math.floor( math.mod( gSpeed2, 10 ))
    gUnits = math.floor( math.mod( gSpeed2/10, 10 ))
    gTens = math.floor( math.mod( gSpeed2/100, 10 ))
    gHundreds = math.floor( gSpeed2/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	 if gTens == 0 then
      gTens = -1
      if gUnits == 0 then
        gUnits = -1
      end
    end
Call( "ASpdU:SetText", gSPdecimal , PRIMARY_TEXT )
Call( "ASpdT:SetText", gUnits , PRIMARY_TEXT )
Call( "ASpdH:SetText", gTens , PRIMARY_TEXT )
    gSpeedFlashTime = gSpeedFlashTime + time
	if gSpeed2 > gSpeedo4 + 0.5 then
	 if gSpeedFlashTime > 0.5 then
		gSpeedFlashTime = 0
		if gSpeedIsFlash == false then
		gSpeedIsFlash = true
		Call( "SPDLFU:SetText", -1 , PRIMARY_TEXT )
        Call( "SPDLFT:SetText", -1 , PRIMARY_TEXT )
        Call( "SPDLFH:SetText", -1 , PRIMARY_TEXT )
		else
		gSpeedIsFlash = false
		Call( "SPDLFU:SetText", gSPdecimal , PRIMARY_TEXT )
        Call( "SPDLFT:SetText", gUnits , PRIMARY_TEXT )
        Call( "SPDLFH:SetText", gTens , PRIMARY_TEXT )
		end
	end
	else
	Call( "SPDLFU:SetText", gSPdecimal , PRIMARY_TEXT )
    Call( "SPDLFT:SetText", gUnits , PRIMARY_TEXT )
    Call( "SPDLFH:SetText", gTens , PRIMARY_TEXT )
	end
	
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
	
	gS1 = math.floor( math.mod( gSec, 10 ))
    gS2 = math.floor( math.mod( gSec/10, 10 ))

Call( "TimeHU:SetText", gH1 , PRIMARY_TEXT )
Call( "TimeHT:SetText", gH2 , PRIMARY_TEXT )
Call( "TimeMU:SetText", gM1 , PRIMARY_TEXT )
Call( "TimeMT:SetText", gM2 , PRIMARY_TEXT )
Call( "TimeSU:SetText", gS1 , PRIMARY_TEXT )
Call( "TimeST:SetText", gS2 , PRIMARY_TEXT )
--clock end


gSpeed3 = math.abs(gSpeed2)
gTime = Call("*:GetSimulationTime")
gDISRUN = (1*math.floor(gSpeed3/3.6))+gTime
gDISRUN2 = 0
gDISRUN = math.floor(gDISRUN)
gDISRUN = math.abs(gDISRUN)

gSPdecimal = math.floor( math.mod( gDISRUN, 10 ))
    gUnits = math.floor( math.mod( gDISRUN/10, 10 ))
    gTens = math.floor( math.mod( gDISRUN/100, 10 ))
    gHundreds = math.floor( gDISRUN/1000 )
	gTH = math.floor( gDISRUN/10000 )
Call( "DisRU:SetText", "-" , PRIMARY_TEXT )
Call( "DisRT:SetText", "-" , PRIMARY_TEXT )
Call( "DisRH:SetText", "-" , PRIMARY_TEXT )
Call( "DisRTH:SetText", "-" , PRIMARY_TEXT )
Call( "DisRTHR:SetText", "-" , PRIMARY_TEXT )

  
if gSpeed2 > 1 and  Hdr == 1 then
Call( "SetControlValue", "HBNR", 0, 1 )
else
Call( "SetControlValue", "HBNR", 0, 0 )
end
  
if gSpeed2 > gSpeedo4 then
Call( "SetControlValue", "Speeding", 0, 1 )
else
Call( "SetControlValue", "Speeding", 0, 0 )
end

Emergency2 = Call( "*:GetControlValue", "EmergencyBrake", 0 )

gMonRel = Call( "*:GetControlValue", "MonRel", 0 )

if gMonRel == 0 then

if (gSpeed2  >= AL_MIN_ALERT_SPEED) and ( Emergency2 == 0) then
  
      gALtimeout = gALtimeout + time
      
      if gALtimeout >= AL_VISUAL_TIME_DELAY then
        ALflashVisualAlerter( time )
        gALstate = AL_STATE_ALARM
      elseif gALstate == AL_STATE_NORMAL then
        Call( "*:SetControlValue", "AWSInd", 0, 0 )
      end
      
      if gALtimeout >= ( AL_VISUAL_TIME_DELAY + AL_AUDIBLE_TIME_DELAY ) then
        Call( "*:SetControlValue", "AlerterAudible", 0, 1 )
      end

      if gALtimeout >= ( AL_VISUAL_TIME_DELAY + AL_AUDIBLE_TIME_DELAY + AL_SHUTDOWN_TIME_DELAY ) then
        Call( "*:SetControlValue", "EmergencyBrake", 0, 1 )
		ALresetAlerter( 0 )
      end
    
    else
      ALresetAlerter( 0 )
      
    end
    
    -- Also reset alerter on change of either brake-handle position
    
    newbrake = Call( "*:GetControlValue", "TrainBrakeControl", 0 )
    if newbrake ~= gTrainBrakeValue and gALstate == AL_STATE_NORMAL then
      ALresetAlerter( 0 )
      gTrainBrakeValue = newbrake
    end
      
    newbrake = Call( "*:GetControlValue", "EngineBrakeControl", 0 )
    if newbrake ~= gEngineBrakeValue and gALstate == AL_STATE_NORMAL then
      ALresetAlerter( 0 )
      gEngineBrakeValue = newbrake
    end

elseif gMonRel == 1 then
ALresetAlerter( 0 )
end



--wiper
gDP = Call("*:GetControlValue", "DriverPosition", 0)
gWP = Call("*:GetControlValue", "Wipers", 0)
gblr = Call("*:GetControlValue", "Blind_r", 0)
gbll = Call("*:GetControlValue", "Blind_l", 0)
if CamLe == true then

 if gDP == -1 then
 if gWP == 0 then
 Call( "SetControlValue", "WipersFront", 0, 0 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 elseif gWP == 1 then
 Call( "SetControlValue", "WipersFront", 0, 0 )
 Call( "SetControlValue", "WipersRear", 0, 1 )
 end
 elseif gDP == 1 then
 if gWP == 0 then
 Call( "SetControlValue", "WipersFront", 0, 0 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 elseif gWP == 1 then
 Call( "SetControlValue", "WipersFront", 0, 1 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 end
 end
 
elseif CamLe == false then

if gDP == -1 then
 if gWP == 0 then
 Call( "SetControlValue", "WipersFront", 0, 0 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 elseif gWP == 1 then
 Call( "SetControlValue", "WipersFront", 0, 1 )
 Call( "SetControlValue", "WipersRear", 0, 1 )
 end
 elseif gDP == 1 then
 if gWP == 0 then
 Call( "SetControlValue", "WipersFront", 0, 0 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 elseif gWP == 1 then
 Call( "SetControlValue", "WipersFront", 0, 1 )
 Call( "SetControlValue", "WipersRear", 0, 0 )
 end
 end
 
end

--blend
if gDP == 1 and gblr > 0 then
Call( "*:SetTime", "BlindFR", gblr )
elseif gDP == 1 and gbll > 0 then
Call( "*:SetTime", "BlindFL", gbll )
elseif gDP == -1 and gbll > 0 then
Call( "*:SetTime", "BlindRL", gbll )
elseif gDP == -1 and gblr > 0 then
Call( "*:SetTime", "BlindRR", gblr )
end

gAFB = Call("*:GetControlValue", "AFB", 0)
if gAFB > 0 then
Call( "SetControlValue", "AfbInd", 0, gAFB )
else
Call( "SetControlValue", "AfbInd", 0, 0 )
end

 gRe = Call("*:GetControlValue", "Regulator", 0)
 gRe2 = Call("*:GetControlValue", "SimpleThrottle", 0)
 gTr = Call("*:GetControlValue", "Accelerometer", 0)
 gTr2 = Call("*:GetControlValue", "TractiveEffort", 0)
 if gSpeed2 == 0 then
 Call( "SetControlValue", "zAccelerometer", 0, 0 )
 Call( "SetControlValue", "bAccelerometer", 0, 0 )
 end
 if (Fr == true) and (Be == false) then
 if gTr2 > 0 then
 Call( "SetControlValue", "zAccelerometer", 0, gTr2 )
 Call( "SetControlValue", "bAccelerometer", 0, 0 )
 elseif gTr < 0 then
 gTr = math.abs(gTr)
 Call( "SetControlValue", "bAccelerometer", 0, gTr )
 if gRe == 0 and gRE2 == 0 then
 Call( "SetControlValue", "zAccelerometer", 0, 0 )
 end
 end
 elseif (Fr == false) and (Be == true) then
 if gTr > 0 then
 Call( "SetControlValue", "zAccelerometer", 0, 0 )
 Call( "SetControlValue", "bAccelerometer", 0, gTr )
 elseif gTr < 0 then
 gTr = math.abs(gTr)
 Call( "SetControlValue", "zAccelerometer", 0, gTr )
 Call( "SetControlValue", "bAccelerometer", 0, 0 )
 if gRe == 0 and gRE2 == 0 then
 Call( "SetControlValue", "zAccelerometer", 0, 0 )
 end
 end
 end
 
gMas = Call("GetConsistTotalMass")

gSPdecimal = math.floor( math.mod( gMas, 10 ))
    gUnits = math.floor( math.mod( gMas/10, 10 ))
    gTens = math.floor( math.mod( gMas/100, 10 ))
    gHundreds = math.floor( gMas/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if gHundreds == 0 then
	  gHundreds = -1
	 if gTens == 0 then
      gTens = -1
      if gUnits == 0 then
        gUnits = -1
      end
    end
   end
Call( "WEIU:SetText", gSPdecimal , PRIMARY_TEXT )
Call( "WEIT:SetText", gUnits , PRIMARY_TEXT )
Call( "WEIH:SetText", gTens , PRIMARY_TEXT )
Call( "WEITH:SetText", gHundreds , PRIMARY_TEXT )

gLen = Call("GetConsistLength")

gSPdecimal = math.floor( math.mod( gLen, 10 ))
    gUnits = math.floor( math.mod( gLen/10, 10 ))
    gTens = math.floor( math.mod( gLen/100, 10 ))
    gHundreds = math.floor( gLen/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if gHundreds == 0 then
	  gHundreds = -1
	 if gTens == 0 then
      gTens = -1
      if gUnits == 0 then
        gUnits = -1
      end
    end
   end
Call( "LENU:SetText", gSPdecimal , PRIMARY_TEXT )
Call( "LENT:SetText", gUnits , PRIMARY_TEXT )
Call( "LENH:SetText", gTens , PRIMARY_TEXT )
Call( "LENTH:SetText", gHundreds , PRIMARY_TEXT )
 
---AFB定速，大闸扣电制动，单独电制动和紧急制动部分
    BrakeHandle = Call( "*:GetControlValue", "VirtualBrake", 0 )
	DynoHandle = Call( "*:GetControlValue", "VirtualDynamicBrake", 0 )
	Emergency = Call( "*:GetControlValue", "EmergencyBrake", 0 )
    PowerHandle = Call( "*:GetControlValue", "VirtualThrottle", 0 )
	AFBHandle = Call( "*:GetControlValue", "AFB", 0 )
	Reverser = Call( "*:GetControlValue", "Reverser", 0 )
	CurrentSpeed = Call( "*:GetControlValue", "SpeedometerKPH", 0 )
	TargetSpeed = Call( "*:GetControlValue", "AFB", 0 )
    CUR = Call( "*:GetControlValue", "AFB_SW", 0 )
	Acceleration = Call( "*:GetAcceleration" )

	if Emergency == 1 then
	Call( "*:SetControlValue", "Reverser", 0 , 0)
    Call( "*:SetControlValue", "VirtualThrottle", 0, 0 )
    Call( "*:SetControlValue", "Regulator", 0, 0 )
	Call( "*:SetControlValue", "AFB_SW", 0, 0 )
	Call( "*:SetControlValue", "VirtualBrake", 0, 1 )
	Call( "*:SetControlValue", "VirtualDynamicBrake", 0, 1 )
	Call( "*:SetControlValue", "TrainBrakeControl", 0, 1 )
	Call( "*:SetControlValue", "DynamicBrake", 0, 1 )
	ALresetAlerter( 0 )
	CUR = 0
	end
	
	
	if CUR == 1 then
		if AFBHandle > 1 then
			SpeedError = math.abs( TargetSpeed - CurrentSpeed - 2 )
			SpeedErrorSign = ( TargetSpeed - CurrentSpeed - 2 ) / SpeedError -- Positive if current speed is too low.
 
			if SpeedError > 10 then

				if ( SpeedErrorSign == -1 ) then 
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 1
					gAFBBrake = 0.5

				else 
					gAFBDynamic = 0
					gAFBBrake = 0
					PowerIncrement = 0
					gAFBRegulator = 1
				end

			elseif SpeedError > 5 then

				if ( SpeedErrorSign == -1 ) then 
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 0.8
					gAFBBrake = 0.2

				else
					gAFBDynamic = 0
					gAFBBrake = 0
					if Acceleration < 0.1 then
						PowerIncrement = 0.03
					elseif Acceleration > 0.4 then
						PowerIncrement = -0.03
					else
						PowerIncrement = 0
					end
				end

			elseif SpeedError > 1 then

				if ( SpeedErrorSign == -1 ) then 
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 0.4
					gAFBBrake = 0

				else 
					gAFBDynamic = 0
					gAFBBrake = 0
					if Acceleration < 0.07 then
						PowerIncrement = 0.02
					elseif Acceleration > 0.2 then
						PowerIncrement = -0.02
					else
						PowerIncrement = 0
					end
				end

			elseif SpeedError > 0.5 then

				if ( SpeedErrorSign == -1 ) then 
					gAFBDynamic = 0
					gAFBBrake = 0
					if Acceleration < -0.04 then
						PowerIncrement = 0.01
					elseif Acceleration > -0.1 then
						PowerIncrement = -0.01
					else
						PowerIncrement = 0
					end
				else 
					gAFBDynamic = 0
					gAFBBrake = 0
					if Acceleration < 0.01 then
						PowerIncrement = 0.01
					elseif Acceleration > 0.05 then
						PowerIncrement = -0.01
					else
						PowerIncrement = 0
					end
				end

			else
				PowerIncrement = 0
			end
				
			gAFBRegulator = gAFBRegulator + PowerIncrement

			if gAFBRegulator < 0 then
				gAFBRegulator = 0
			elseif gAFBRegulator > 1 then
				gAFBRegulator = 1
			end

				Call( "*:SetControlValue", "Regulator", 0, gAFBRegulator )
                Call( "*:SetControlValue", "DynamicBrake", 0, gAFBDynamic )
				Call( "*:SetControlValue", "TrainBrakeControl", 0, gAFBBrake )

		else

			gAFBRegulator = 0
			gAFBDynamic = 0
			gAFBBrake = 0
			Call( "*:SetControlValue", "Regulator", 0, PowerHandle )

		end
else

        Thrr = tonumber(Call("*:GetControlValue", "VirtualThrottle", 0))
        Call( "SetControlValue", "Regulator", 0, Thrr )

        DynBr = tonumber(Call("*:GetControlValue", "VirtualBrake", 0))

        if DynBr == 0 then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0 )
        elseif ( DynBr >= 0.13 ) and ( DynBr <= 0.16 ) then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.142 )
        elseif ( DynBr >= 0.34 ) and ( DynBr <= 0.37 ) then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.35 )
        elseif (DynBr >= 0.47 ) and (DynBr <= 0.50)then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.48 )
        elseif (DynBr >= 0.60) and  (DynBr <= 0.63) then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.61 )
        elseif (DynBr >= 0.73) and (DynBr <= 0.76) then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.74 )
        elseif (DynBr >= 0.86)and (DynBr <= 0.89)then
        Call( "SetControlValue", "TrainBrakeControl", 0, 0.87 )
        elseif DynBr == 1 then
        Call( "SetControlValue", "TrainBrakeControl", 0, 1 )
		Call( "SetControlValue", "EmergencyBrake", 0, 1 )
end

DynBr2 = tonumber(Call("*:GetControlValue", "VirtualDynamicBrake", 0))
Call("SetControlValue", "DynamicBrake" , 0, DynBr2 )

end

            if DynoHandle ~= gLastDyno then
		       gDynoCoupled = 0
	        end

			if gDynoCoupled == 1 then
			Dyn225 = BrakeHandle
			Call( "*:SetControlValue", "VirtualDynamicBrake", 0, Dyn225 )
			end

			if (BrakeHandle == 0) and (DynoHandle == 0) then
		        gDynoCoupled = 1
	        end

			
			gLastBrake = BrakeHandle
	        gLastDyno = Call( "*:GetControlValue", "VirtualDynamicBrake", 0 )
----部分完	

if gSpeed > 5 or gSparkStorm == true then

		if gTime > gTimeSpark then
			if Call("*:GetControlValue", "RearPantographC", 0) == 1 then
			    gSparkFactor = 50
				gSpark = math.random(1, gSparkFactor)
				if gSpark == 1 then
				Call( "Spark21:Activate", 1 )
				Call( "SparkLR:Activate", 1 )
				else
				Call( "Spark21:Activate", 0 )
				Call( "SparkLR:Activate", 0 )
				end
				if gSpark == 2 then
				Call( "Spark22:Activate", 1 )
				Call( "SparkLR:Activate", 1 )
				else
				Call( "Spark22:Activate", 0 )
				Call( "SparkLR:Activate", 0 )
				end
			end

			if Call("*:GetControlValue", "FrontPantographC", 0) == 1 then
				gSparkFactor = 50
				gSpark = math.random(1, gSparkFactor)
				if gSpark == 1 then
				Call( "Spark11:Activate", 1 )
				Call( "SparkLF:Activate", 1 )
				else
				Call( "Spark11:Activate", 0 )
				Call( "SparkLF:Activate", 0 )
				end
				if gSpark == 2 then
				Call( "Spark12:Activate", 1 )
				Call( "SparkLF:Activate", 1 )
				else
				Call( "Spark12:Activate", 0 )
				Call( "SparkLF:Activate", 0 )
				end
			end			
			gTimeSpark = gTime + 0.005
		end		
else
Call( "Spark11:Activate", 0 )
Call( "Spark12:Activate", 0 )
Call( "Spark21:Activate", 0 )
Call( "Spark22:Activate", 0 )
Call( "SparkLF:Activate", 0 )
Call( "SparkLR:Activate", 0 )
end

if gSparkStorm == true then

	if gTime > gSparkStormTime then
		gSparkFactor = gSparkFactor + 10
		if gSparkFactor > 400 then
			gSparkStorm = false

		end
		gSparkStormTime = gTime + 0.05
	end
else
gSparkFactor = ((200 - gSpeed) + 100) - (math.abs(gTilt) * 2.5)
end

if gHba > 0 then
		Call( "SetControlValue", "HandBrake", 0, 1 )
		Call( "SendConsistMessage", HANDBRAKE_APP, "", 0 )
		Call( "SendConsistMessage", HANDBRAKE_APP, "", 1 )
elseif gHbr > 0 then
		Call( "SetControlValue", "HandBrake", 0, 0 )
		Call( "SendConsistMessage", HANDBRAKE_REL, "", 0 )
		Call( "SendConsistMessage", HANDBRAKE_REL, "", 1 )
end

gSigMode = Call("*:GetControlValue", "sigch", 0)
 if gSigMode == 0 then
 if (distance <= 10) and (gCSaspect == 90) then
 Call( "*:SetControlValue", "CabSig", 0, 99 )
 else
 Call( "*:SetControlValue", "CabSig", 0, gCSaspect )
 end
 end
 
 end

 if Call( "GetIsPlayer" ) == 0 then
 Call( "Spark11:Activate", 0 )
Call( "Spark12:Activate", 0 )
Call( "Spark21:Activate", 0 )
Call( "Spark22:Activate", 0 )
Call( "SparkLF:Activate", 0 )
Call( "SparkLR:Activate", 0 )
Call( "FwdHeadlight01:Activate", 0 )
Call( "FwdHeadlight02:Activate", 0 )
Call( "FwdHeadlight03:Activate", 0 )
Call( "FwdHeadlight04:Activate", 0 )
Call( "BwdHeadlight01:Activate", 0 )
Call( "BwdHeadlight02:Activate", 0 )
Call( "BwdHeadlight03:Activate", 0 )
Call( "BwdHeadlight04:Activate", 0 )
Call( "FLightFR:Activate", 0 )
Call( "FLightRR:Activate", 0 )
Call( "FLightFL:Activate", 0 )
Call( "FLightRL:Activate", 0 )
Call( "FwdTaillight01:Activate", 0 )
Call( "BwdTaillight01:Activate", 0 )
Call( "BwdTaillight02:Activate", 0 )
Call( "FwdTaillight02:Activate", 0 )
 end
 
 gSigIso = Call("*:GetControlValue", "SigRel", 0)
 if gSigIso == 1 then
 Call( "*:SetControlValue", "CabSig", 0, 1 )
 Call( "*:SetControlValue", "CabSigSound", 0, 0 )
 end
 
 UN_number = Call( "GetRVNumber" )
UN_number = tostring(UN_number)
A = string.sub(UN_number, 5,5)
B = string.sub(UN_number, 4,4)
C = string.sub(UN_number, 3,3)
D = string.sub(UN_number, 2,2)
E = string.sub(UN_number, 1,1)
F = string.sub(UN_number, 6,6)

I1 = string.sub(UN_number, 7,7)
I2 = string.sub(UN_number, 8,8)
I3 = string.sub(UN_number, 9,9)
I4 = string.sub(UN_number, 10,10)

Call( "DestinationBoard1:SetText", A , PRIMARY_TEXT )
Call( "DestinationBoard2:SetText", B , PRIMARY_TEXT )
Call( "DestinationBoard3:SetText", C , PRIMARY_TEXT )
Call( "DestinationBoard4:SetText", D , PRIMARY_TEXT )
Call( "DestinationBoard5:SetText", E , PRIMARY_TEXT )
Call( "DestinationBoard1:SetText", F , SECONDARY_TEXT )

Call( "LOCONU:SetText", I4 , PRIMARY_TEXT )
Call( "LOCONT:SetText", I3 , PRIMARY_TEXT )
Call( "LOCONH:SetText", I2 , PRIMARY_TEXT )
Call( "LOCONTH:SetText", I1 , PRIMARY_TEXT )

A = string.byte(A)
B = string.byte(B)
C = string.byte(C)
D = string.byte(D)
E = string.byte(E)
F = string.byte(F)

if A == 35 then
Call( "DestinationBoard1:ActivateNode", "primarydigits_1", 0 )
elseif B == 35 then
Call( "DestinationBoard2:ActivateNode", "primarydigits_1", 0 )
elseif C == 35 then
Call( "DestinationBoard3:ActivateNode", "primarydigits_1", 0 )
elseif D == 35 then
Call( "DestinationBoard4:ActivateNode", "primarydigits_1", 0 )
elseif E == 35 then
Call( "DestinationBoard5:ActivateNode", "primarydigits_1", 0 )
elseif F == 35 then
Call( "DestinationBoard1:ActivateNode", "secondarydigits_1", 0 )
end
end

function OnConsistMessage ( msg, argument, direction )

if (LASTE == true) and (LEADE == false) then
Panto (1)
if msg == PANTO_HEI then 
  Call("SetControlValue", "pantohei", 0, argument )
end

if msg == PANTO_SEL then 
  Call("SetControlValue", "pantosel", 0, argument )
end

if msg == PANTO_SW then 
  Call("SetControlValue", "PantographControl", 0, argument )
end

if msg == BATT_SW then
  Call("SetControlValue", "battsw2", 0, argument )
end

if msg == HANDBRAKE_REL then
  Call("SetControlValue", "HandBrake", 0, 0 )
end

if msg == HANDBRAKE_APP then
  Call("SetControlValue", "HandBrake", 0, 1 )
end


end

if (LASTE == false) and (LEADE == false) then
Panto (0)
if msg == HANDBRAKE_REL then
  Call("SetControlValue", "HandBrake", 0, 0 )
end

if msg == HANDBRAKE_APP then
  Call("SetControlValue", "HandBrake", 0, 1 )
end

if msg == PANTO_SW then 
  Call("SetControlValue", "PantographControl", 0, argument )
end

if msg == BATT_SW then
  Call("SetControlValue", "battsw2", 0, argument )
end

end

if (LASTE == false) and (LEADE == true) then
Panto (1)

end

Call( "SendConsistMessage", msg, argument, direction )

end


function ALresetAlerter(sender)

  if gALstate == AL_STATE_ALARM and sender == 1 then
    gALtimeout = 0.0
    gALstate = AL_STATE_NORMAL
  elseif gALstate == AL_STATE_NORMAL then
    gALtimeout = 0.0
  end
  
  Call( "*:SetControlValue", "AWSInd", 0, 0 )
  Call( "*:SetControlValue", "AlerterAudible", 0, 0 )
  
  

end

--------------------------------------------
-- ALflashVisualAlerter
function ALflashVisualAlerter( time )

  gALflashinterval = gALflashinterval + time
  
  if gALflashinterval >= AL_FLASH_INTERVAL_SECS then
    gALflashstate = math.abs( gALflashstate - 1 )
    Call( "*:SetControlValue", "AWSInd", 0, gALflashstate )
    gALflashinterval = 0.0
  end
  
end

--LCD Display Unit
function LCDDisplay( line1t,line2t )

line1t = tostring(line1t)
A1 = string.sub(line1t, 1,1)
A2 = string.sub(line1t, 2,2)
A3 = string.sub(line1t, 3,3)
A4 = string.sub(line1t, 4,4)
A5 = string.sub(line1t, 5,5)
A6 = string.sub(line1t, 6,6)
A7 = string.sub(line1t, 7,7)
A8 = string.sub(line1t, 8,8)
A9 = string.sub(line1t, 9,9)
A10 = string.sub(line1t, 10,10)
A11 = string.sub(line1t, 11,11)
A12 = string.sub(line1t, 12,12)
A13 = string.sub(line1t, 13,13)
A14 = string.sub(line1t, 14,14)
A15 = string.sub(line1t, 15,15)
A16 = string.sub(line1t, 16,16)

line2t = tostring(line2t)
B1 = string.sub(line2t, 1,1)
B2 = string.sub(line2t, 2,2)
B3 = string.sub(line2t, 3,3)
B4 = string.sub(line2t, 4,4)
B5 = string.sub(line2t, 5,5)
B6 = string.sub(line2t, 6,6)
B7 = string.sub(line2t, 7,7)
B8 = string.sub(line2t, 8,8)
B9 = string.sub(line2t, 9,9)
B10 = string.sub(line2t, 10,10)
B11 = string.sub(line2t, 11,11)
B12 = string.sub(line2t, 12,12)
B13 = string.sub(line2t, 13,13)
B14 = string.sub(line2t, 14,14)
B15 = string.sub(line2t, 15,15)
B16 = string.sub(line2t, 16,16)

Call( "1602-1-1:SetText", A1 , PRIMARY_TEXT )
Call( "1602-1-2:SetText", A2 , PRIMARY_TEXT )
Call( "1602-1-3:SetText", A3 , PRIMARY_TEXT )
Call( "1602-1-4:SetText", A4 , PRIMARY_TEXT )
Call( "1602-1-5:SetText", A5 , PRIMARY_TEXT )
Call( "1602-1-6:SetText", A6 , PRIMARY_TEXT )
Call( "1602-1-7:SetText", A7 , PRIMARY_TEXT )
Call( "1602-1-8:SetText", A8 , PRIMARY_TEXT )
Call( "1602-1-9:SetText", A9 , PRIMARY_TEXT )
Call( "1602-1-10:SetText", A10 , PRIMARY_TEXT )
Call( "1602-1-11:SetText", A11 , PRIMARY_TEXT )
Call( "1602-1-12:SetText", A12 , PRIMARY_TEXT )
Call( "1602-1-13:SetText", A13 , PRIMARY_TEXT )
Call( "1602-1-14:SetText", A14 , PRIMARY_TEXT )
Call( "1602-1-15:SetText", A15 , PRIMARY_TEXT )
Call( "1602-1-16:SetText", A16 , PRIMARY_TEXT )
Call( "1602-2-1:SetText", B1 , PRIMARY_TEXT )
Call( "1602-2-2:SetText", B2 , PRIMARY_TEXT )
Call( "1602-2-3:SetText", B3 , PRIMARY_TEXT )
Call( "1602-2-4:SetText", B4 , PRIMARY_TEXT )
Call( "1602-2-5:SetText", B5 , PRIMARY_TEXT )
Call( "1602-2-6:SetText", B6 , PRIMARY_TEXT )
Call( "1602-2-7:SetText", B7 , PRIMARY_TEXT )
Call( "1602-2-8:SetText", B8 , PRIMARY_TEXT )
Call( "1602-2-9:SetText", B9 , PRIMARY_TEXT )
Call( "1602-2-10:SetText", B10 , PRIMARY_TEXT )
Call( "1602-2-11:SetText", B11 , PRIMARY_TEXT )
Call( "1602-2-12:SetText", B12 , PRIMARY_TEXT )
Call( "1602-2-13:SetText", B13 , PRIMARY_TEXT )
Call( "1602-2-14:SetText", B14 , PRIMARY_TEXT )
Call( "1602-2-15:SetText", B15 , PRIMARY_TEXT )
Call( "1602-2-16:SetText", B16 , PRIMARY_TEXT )

end



function OnCustomSignalMessage( Southern )
gSigIso = Call("*:GetControlValue", "SigRel", 0)
if gSigIso == 0 then

gSigMode = Call("*:GetControlValue", "sigch", 0)
gSig = Call("*:GetControlValue", "CabSig", 0)

if gSigMode == 0 then
SouthernK1 = string.sub( Southern, 4, 5 )
gCSaspect = tonumber( SouthernK1 )
if gCSaspect == nil or 0 then
Call( "*:SetControlValue", "CabSig", 0, 86 )
end
if gSig == 99 then
Call( "*:SetControlValue", "CabSig", 0, 99 )
else
Call( "*:SetControlValue", "CabSig", 0, gCSaspect )
Call( "*:SetControlValue", "CabSigSound", 0, gCSaspect )
end

elseif gSigMode == 1 then
SouthernK2 = string.sub( Southern, 4, 4 )
gCSaspect = tonumber( SouthernK2 )
if gCSaspect == 1 then --绿
Call( "*:SetControlValue", "CabSig", 0, 81 )
Call( "*:SetControlValue", "CabSigSound", 0, 81 )
elseif gCSaspect == 2 then --绿
Call( "*:SetControlValue", "CabSig", 0, 82 )
Call( "*:SetControlValue", "CabSigSound", 0, 82 )
elseif gCSaspect == 3 then --？FlashY
Call( "*:SetControlValue", "CabSig", 0, 83 )
Call( "*:SetControlValue", "CabSigSound", 0, 83 )
elseif gCSaspect == 4 then --？FlashDY
Call( "*:SetControlValue", "CabSig", 0, 85 )
Call( "*:SetControlValue", "CabSigSound", 0, 85 )
elseif gCSaspect == 6 then --Y?
Call( "*:SetControlValue", "CabSig", 0, 90 )
Call( "*:SetControlValue", "CabSigSound", 0, 90 )
elseif gCSaspect == 5 then --DY?
Call( "*:SetControlValue", "CabSig", 0, 84 )
Call( "*:SetControlValue", "CabSigSound", 0, 84 )
elseif gCSaspect == 7 then --H
Call( "*:SetControlValue", "CabSig", 0, 99 )
Call( "*:SetControlValue", "CabSigSound", 0, 99 )
elseif gCSaspect == nil or 0 then
Call( "*:SetControlValue", "CabSig", 0, 86 )
Call( "*:SetControlValue", "CabSigSound", 0, 86 )
end

elseif gSigMode == 2 then
local SouthernK3 = Southern + 1
Southern = SouthernK3 - 1
if Southern == 10 then
Call( "*:SetControlValue", "CabSig", 0, 81 )
Call( "*:SetControlValue", "CabSigSound", 0, 81 )
elseif Southern == 9 then
Call( "*:SetControlValue", "CabSig", 0, 82 )
Call( "*:SetControlValue", "CabSigSound", 0, 82 )
elseif Southern == 8 then
Call( "*:SetControlValue", "CabSig", 0, 83 )
Call( "*:SetControlValue", "CabSigSound", 0, 83 )
elseif Southern == 6 then
Call( "*:SetControlValue", "CabSig", 0, 85 )
Call( "*:SetControlValue", "CabSigSound", 0, 85 )
elseif Southern == 4 then
Call( "*:SetControlValue", "CabSig", 0, 84 )
Call( "*:SetControlValue", "CabSigSound", 0, 84 )
elseif Southern == 2 then
Call( "*:SetControlValue", "CabSig", 0, 90 )
Call( "*:SetControlValue", "CabSigSound", 0, 90 )
elseif Southern == 1 then
Call( "*:SetControlValue", "CabSig", 0, 99 )
Call( "*:SetControlValue", "CabSigSound", 0, 99 )
elseif Southern == nil or 0 then
Call( "*:SetControlValue", "CabSig", 0, 86 )
Call( "*:SetControlValue", "CabSigSound", 0, 86 )
end
end

elseif gSigIso == 0 then
Call( "*:SetControlValue", "CabSig", 0, 1 )
Call( "*:SetControlValue", "CabSigSound", 0, 0 )
end

end