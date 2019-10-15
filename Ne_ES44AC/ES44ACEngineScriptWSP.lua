gTimerS = 0
gNewTimerS = 0
gHundreds = 0
gTens = 0
gUnits = 0
gSpeedo = 0
gAmount = 0
gCSaspect = 0
gCSprevAspect = 0
gLastBrake = 0
gLastAFBHandle = 0
gLastReverser = 0
TargetSpeed = 0
gRunTimer = 0
-- For AFB cruise control. The power and brake settings the cruise wants.
gAFBRegulator = 0
gAFBDynamic = 0
gAFBBrake = 0
gPdecimal = 0
gVigilTimer = 0
-- How long to stay off/on in each flash cycle
LIGHT_FLASH_OFF_SECS = 0.5
LIGHT_FLASH_ON_SECS  = 0.5
LOCOSTARTUP = 5468
LOCOSTARTUPED = 5469
PRIMARY_TEXT = 0
SECONDARY_TEXT = 1

-- State of flashing light
gTimeSinceLastFlash  = 0
gLightFlashOn        = false
gFirstLightFlash     = true
DEBUG = false
-- UpdateFuel
function DebugPrint( message )
	if (DEBUG) then
		Print( message )
	end
end

function Initialise ()
    Call( "SetControlValue", "cabsignal", 0, 1 )
	Call( "SetControlValue", "cabsignalsound", 0, 1 )
	Call( "ActivateNode", "ditch_glass_R", 0 )
	Call( "ActivateNode", "ditch_glass_L", 0 )
	Call( "ActivateNode", "glow_steps", 0 )
	Call( "ActivateNode", "front_glass", 0 )
	Call( "ActivateNode", "rear_glass", 0 )
	Call( "Ditch_L:Activate", 0 )
	Call( "Ditch_R:Activate", 0 )
	Call( "Ditch_L_Rear:Activate", 0 )
	Call( "Ditch_R_Rear:Activate", 0 )
	Call( "Steplight_FL:Activate", 0 )
	Call( "Steplight_FR:Activate", 0 )
	Call( "Steplight_RR:Activate", 0 )
	Call( "Steplight_RL:Activate", 0 )
	Call( "Cablight:Activate", 0 )
	SysCall("ScenarioManager:ShowAlertMessageExt", "SNL ES44AC" , "机车初始化完成！" , 5 )
	Call( "SetControlValue", "EngineStop", 0, 1 )
	Call( "SetControlValue", "EngineStart", 0, 0 )
	Call( "SetControlValue", "lkjspdunit", 0, 0 )
	Call( "SetControlValue", "lkjspdten", 0, -1 )
	Call( "SetControlValue", "lkjspdhund", 0, 0 )
	Call( "SetControlValue", "lkjspdunit", 0, 0 )
	Call( "SetControlValue", "lkjspdten", 0, -1 )
	Call( "SetControlValue", "lkjspdhund", 0, 0 )
	Call( "BeginUpdate" )
end

function OnControlValueChange ( name, index, value )
    if Call( "*:ControlExists", name, index ) then
       Call( "*:SetControlValue", name, index, value );
    end
	if name == "fwdh" then
		if value == 0 then
		  Call( "ActivateNode", "fwdheadlighton", 0 )
	      Call( "ActivateNode", "bwdheadlighton", 0 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 0 )
	      Call( "Headlight_02:Activate", 0 )
	      Call( "D_Headlight_03:Activate", 0 )
	      Call( "D_Headlight_04:Activate", 0 )
		elseif value == 1 then
		  Call( "ActivateNode", "fwdheadlighton", 1 )
	      Call( "ActivateNode", "bwdheadlighton", 0 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 1 )
	      Call( "Headlight_02:Activate", 1 )
	      Call( "D_Headlight_03:Activate", 1 )
	      Call( "D_Headlight_04:Activate", 1 )
		  Call( "Headlight_01:SetRange", 25 )
		  Call( "D_Headlight_03:SetRange", 25 )
	      Call( "D_Headlight_04:SetRange", 25 )
		elseif value == 2 then
		  Call( "ActivateNode", "fwdheadlighton", 1 )
	      Call( "ActivateNode", "bwdheadlighton", 0 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 1 )
	      Call( "Headlight_02:Activate", 1 )
	      Call( "D_Headlight_03:Activate", 1 )
	      Call( "D_Headlight_04:Activate", 1 )
		  Call( "Headlight_01:SetRange", 75 )
		  Call( "D_Headlight_03:SetRange", 75 )
	      Call( "D_Headlight_04:SetRange", 75 )
		end
	end
	
	if name == "bwdh" then
		if value == 0 then
		  Call( "ActivateNode", "fwdheadlighton", 0 )
	      Call( "ActivateNode", "bwdheadlighton", 0 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 0 )
	      Call( "Headlight_02:Activate", 0 )
	      Call( "D_Headlight_03:Activate", 0 )
	      Call( "D_Headlight_04:Activate", 0 )
		elseif value == 1 then
		  Call( "ActivateNode", "fwdheadlighton", 0 )
	      Call( "ActivateNode", "bwdheadlighton", 1 )
		  Call( "B_Headlight_01:Activate", 1 )
		  Call( "B_Headlight_02:Activate", 1 )
		  Call( "B_Headlight_01:SetRange", 25 )
		  Call( "Headlight_01:Activate", 0 )
	      Call( "Headlight_02:Activate", 0 )
	      Call( "D_Headlight_03:Activate", 0 )
	      Call( "D_Headlight_04:Activate", 0 )
		elseif value == 2 then
		  Call( "ActivateNode", "fwdheadlighton", 0 )
	      Call( "ActivateNode", "bwdheadlighton", 1 )
		  Call( "B_Headlight_01:Activate", 1 )
		  Call( "B_Headlight_02:Activate", 1 )
		   Call( "B_Headlight_01:SetRange", 75 )
		  Call( "Headlight_01:Activate", 0 )
	      Call( "Headlight_02:Activate", 0 )
	      Call( "D_Headlight_03:Activate", 0 )
	      Call( "D_Headlight_04:Activate", 0 )
		end
	end
	--台阶灯开关
	if name == "StepsLight" then
		if value == 0 then
	      Call( "ActivateNode", "glow_steps", 0 )
	      Call( "Steplight_FL:Activate", 0 )
	      Call( "Steplight_FR:Activate", 0 )
	      Call( "Steplight_RR:Activate", 0 )
	      Call( "Steplight_RL:Activate", 0 )
		elseif value == 1 then
		  Call( "ActivateNode", "glow_steps", 1 )
	      Call( "Steplight_FL:Activate", 1 )
	      Call( "Steplight_FR:Activate", 1 )
	      Call( "Steplight_RR:Activate", 1 )
	      Call( "Steplight_RL:Activate", 1 )
		end
	end
	if name == "Inst.Light" then
		if value == 0 then
		  Call( "instlight1:Activate", 0 )
		  Call( "instlight2:Activate", 0 )
         Call( "instlight3:Activate", 0 )
		elseif value == 1 then
		   Call( "instlight1:Activate", 1 )
		  Call( "instlight2:Activate", 1 )
         Call( "instlight3:Activate", 1 )
		end
	end
	
	if name == "ReadingLight" then
		if value == 0 then
		Call( "ReadingLight1:Activate", 0 )
		Call( "ReadingLight2:Activate", 0 )
		Call( "ReadingLight3:Activate", 0 )
		Call( "ReadingLight4:Activate", 0 )
		Call( "ReadingLight5:Activate", 0 )
		elseif value == 1 then
		Call( "ReadingLight1:Activate", 1 )
		Call( "ReadingLight2:Activate", 1 )
		Call( "ReadingLight3:Activate", 1 )
		Call( "ReadingLight4:Activate", 1 )
		Call( "ReadingLight5:Activate", 1 )
		end
	end
	--上下行指示
	if name == "Reverser" then
		if value == -1 then
	    Call("SetControlValue", "revind", 0, 1 )
		elseif value == 0 then
		Call("SetControlValue", "revind", 0, 0 )
		elseif value == 1 then
		Call("SetControlValue", "revind", 0, -1 )
		end
	end
	
	if name == "TrainBrakeControl" then
		if value == 0 then
	    Call("SetControlValue", "autoind", 0, 0 )
		elseif value == 0.2 then
		Call("SetControlValue", "autoind", 0, 0.2 )
		elseif value == 0.3 then
		Call("SetControlValue", "autoind", 0, 0.4 )
		elseif value == 0.6 then
		Call("SetControlValue", "autoind", 0, 0.6 )
		elseif value == 0.8 then
		Call("SetControlValue", "autoind", 0, 0.8 )
		elseif value == 1 then
		Call("SetControlValue", "autoind", 0, 1 )
		end
	end
	
	if name == "EngineBrakeControl" then
		if value == 0 then
	    Call("SetControlValue", "indind", 0, 0 )
		elseif value == 0.5 then
		Call("SetControlValue", "indind", 0, 0.5 )
		elseif value == 1 then
		Call("SetControlValue", "indind", 0, 1 )
		end
	end
	
	
	--紧急制动
	if name == "EmergencyBrake" then
		if value == 1 then
		SysCall("ScenarioManager:ShowAlertMessageExt", "SNL ES44AC WARN" , "紧急制动已触发！请等待停车后进行缓解操作！" , 3 )
		end
	end
	
	if name == "CUR_Control" then
		if value == 0 then
	    SysCall("ScenarioManager:ShowAlertMessageExt", "SNL ES44AC WARN" , "定速关" , 3 )
		elseif value == 1 then
		SysCall("ScenarioManager:ShowAlertMessageExt", "SNL ES44AC WARN" , "定速开" , 3 )
		end
	end
	
	--弱光灯开关
	--车内灯开关
	if name == "CabLight" then
		if value == 0 then
			Call( "Cablight:Activate", 0 )
			SysCall("ScenarioManager:ShowAlertMessageExt", "INFO" , "Cab Light Off" , 3 )
		elseif value == 1 then
			Call( "Cablight:Activate", 1 )
			SysCall("ScenarioManager:ShowAlertMessageExt", "INFO" , "Cab Light On" , 3 )
		end
	end
	--发动机开关
	

end

function Update ( time )
  gBt = Call("*:GetControlValue", "battsw", 0)
  gSta = Call("*:GetControlValue", "StartButton", 0)
  gStaT = Call("*:GetControlValue", "Startup", 0)
  gSto = Call("*:GetControlValue", "StopButton", 0)
  Call( "SetControlValue", "RPM", 0, 0 )
  if gBt == 0 then
  Call( "SetControlValue", "Startup", 0, -1 )
  Call( "SetControlValue", "RPM", 0, 0 )
  Call( "SetControlValue", "SCREENHIDE", 0, 0 )
  Call("SetControlValue", "CUR_Control", 0, 0 )
  Call("SetControlValue", "ThrottleAndBrake", 0, 0.5 )
  Call("SetControlValue", "fwdh", 0, 0 )
  Call("SetControlValue", "bwdh", 0, 0 )  
  Call("SetControlValue", "Sander", 0, 0 )
  Call("SetControlValue", "Bell", 0, 0 )
  Call("SetControlValue", "ReadingLight", 0, 0 )
  Call("SetControlValue", "Inst.Light", 0, 0 )
  Call("SetControlValue", "StepsLight", 0, 0 )
  Call("SetControlValue", "CabSig", 0, 1 )
  Call("SetControlValue", "Horn", 0, 0 )
  Call("SetControlValue", "CabLight", 0, 0 )
  Call("SetControlValue", "Reverser", 0, 0 )
  Call("SetControlValue", "Wipers", 0, 0 )
  elseif gBt == 1 then
  Call( "SetControlValue", "SCREENHIDE", 0, 1 )
  if gSta == 1 then
		Call( "SetControlValue", "Startup", 0, 1 )
  elseif gSto == 1 then
		Call( "SetControlValue", "Startup", 0, -1 )
		Call("SetControlValue", "CUR_Control", 0, 0 )
  end
  end
  
  if gStaT < 1 then
  Call("*:SetControlValue", "LocoBrakeCylinderPressurePSI", 0, 26)
  Call("*:SetControlValue", "MainReservoirPressurePSI", 0 ,140)
  Call("*:SetControlValue", "EqReservoirPressurePSI", 0,0)
  Call("*:SetControlValue", "AirBrakePipePressurePSI", 0,0)
  Call("*:SetControlValue", "TrainBrakeControl", 0,0.8)
  Call("SetControlValue", "EngineBrakeControl", 0, 0.3 )
  end
  
  gMRP = Call("*:GetControlValue", "MainReservoirPressurePSI", 0)
  gERP = Call("*:GetControlValue", "EqReservoirPressurePSI", 0)
  gABP = Call("*:GetControlValue", "AirBrakePipePressurePSI", 0)
  gLBP = Call("*:GetControlValue", "LocoBrakeCylinderPressurePSI", 0)
  
  Call("SetControlValue", "BPIND", 0,  gABP)
  Call("SetControlValue", "ERIND", 0,  gERP)
  
  gMRPKpa = gMRP*6.894757
  gERPKpa = gERP*6.894757
  gABPKpa = gABP*6.894757
  gLBPKpa = gLBP*6.894757
  
  Call("SetControlValue", "MainReservoirPressureKPA", 0,  gMRPKpa)
  Call("SetControlValue", "EqReservoirPressureKPA", 0,  gERPKpa)
  Call("SetControlValue", "AirBrakePipePressureKPA", 0,  gABPKpa)
  Call("SetControlValue", "LocoBrakeCylinderPressureKPA", 0,  gLBPKpa)
	
  gSpeedo = (math.floor(Call("*:GetControlValue", "SpeedometerMPH", 0)))
  gSpeedo = tostring(gSpeedo)
	if string.len(gSpeedo) == 1 then
		Call("*:SetControlValue", "G_Speedo", 0,  0)
		gSpeedo = ("0" .. gSpeedo)
	elseif string.len(gSpeedo) == 2 then
		Call("*:SetControlValue", "G_Speedo", 0,  1)
	end
	
_, _, gTens, gUnits, _ = string.find(gSpeedo, "(%d)(%d)")
if Call("*:GetControlValue", "G_Speedo", 0) == 0 then
	Call("*:SetControlValue", "SPEED_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "SPEED_tens", 0,  (-1))
elseif Call("*:GetControlValue", "G_Speedo", 0) == 1 then
	Call("*:SetControlValue", "SPEED_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "SPEED_tens", 0,  tonumber(gTens))
end 

	
	--完
	--数字制动管、均衡风缸压力计（单位PSI
	gER = (math.floor(Call("*:GetControlValue", "AirBrakePipePressurePSI", 0)))
    gER = tostring(gER)

	if string.len(gER) == 1 then
		Call("*:SetControlValue", "G_ER", 0,  0)
		gER = ("0" .. gER)
	elseif string.len(gER) == 2 then
		Call("*:SetControlValue", "G_ER", 0,  1)
	end
	
_, _, gTens, gUnits, _ = string.find(gER, "(%d)(%d)")

if Call("*:GetControlValue", "G_ER", 0) == 0 then
	Call("*:SetControlValue", "ER_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "ER_tens", 0,  (-1))
elseif Call("*:GetControlValue", "G_ER", 0) == 1 then
	Call("*:SetControlValue", "ER_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "ER_tens", 0,  tonumber(gTens))
end
	
	--数字总风缸压力计(单位PSI
	gMAIN = (math.floor(Call("*:GetControlValue", "MainReservoirPressurePSI", 0)))
    gMAIN = tostring(gMAIN)

	if string.len(gMAIN) == 1 then
		Call("*:SetControlValue", "G_MAIN", 0,  0)
		gMAIN = ("00" .. gMAIN)
	elseif string.len(gMAIN) == 2 then
		Call("*:SetControlValue", "G_MAIN", 0,  1)
		gMAIN = ("0" .. gMAIN)
		elseif string.len(gMAIN) == 3 then
		Call("*:SetControlValue", "G_MAIN", 0,  2)
	end
	
_, _, gHundreds, gTens, gUnits = string.find(gMAIN, "(%d)(%d)(%d)")

if Call("*:GetControlValue", "G_MAIN", 0) == 0 then
	Call("*:SetControlValue", "MAIN_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "MAIN_tens", 0, (-1))
	Call("*:SetControlValue", "MAIN_hundreds", 0, (-1))
elseif Call("*:GetControlValue", "G_MAIN", 0) == 1 then
	Call("*:SetControlValue", "MAIN_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "MAIN_tens", 0,  tonumber(gTens))
	Call("*:SetControlValue", "MAIN_hundreds", 0, (-1))
elseif Call("*:GetControlValue", "G_MAIN", 0) == 2 then
	Call("*:SetControlValue", "MAIN_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "MAIN_tens", 0,  tonumber(gTens))
	Call("*:SetControlValue", "MAIN_hundreds", 0, tonumber(gHundreds))
end
--完
	--数字制动风缸压力计(单位PSI
	
	gBC = (math.floor(Call("*:GetControlValue", "LocoBrakeCylinderPressurePSI", 0)))
    gBC = tostring(gBC)

	if string.len(gBC) == 1 then
		Call("*:SetControlValue", "G_BC", 0,  0)
		gBC = ("0" .. gBC)
	elseif string.len(gBC) == 2 then
		Call("*:SetControlValue", "G_BC", 0,  1)
	end
	
_, _, gTens, gUnits, _ = string.find(gBC, "(%d)(%d)")
if Call("*:GetControlValue", "G_BC", 0) == 0 then
	Call("*:SetControlValue", "BC_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "BC_tens", 0,  (-1))
elseif Call("*:GetControlValue", "G_BC", 0) == 1 then
	Call("*:SetControlValue", "BC_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "BC_tens", 0,  tonumber(gTens))
end
	
	
    local trackLimit, signalLimit = Call("GetCurrentSpeedLimit", 1)      
    gSpeedo3 = 10*(3.6*trackLimit)
	gSpeedo4 = 3.6*trackLimit
    gSPdecimal = math.floor( math.mod( gSpeedo3, 10 ))
    gUnits = math.floor( math.mod( gSpeedo3/10, 10 ))
    gTens = math.floor( math.mod( gSpeedo3/100, 10 ))
    gHundreds = math.floor( gSpeedo3/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if gHundreds == 0 then
      gHundreds = -1
      if gTens == 0 then
        gTens = -1
      end
    end
	Call( "SPDDUR:SetText", gUnits , PRIMARY_TEXT )
	Call( "SPDDTR:SetText", gTens , PRIMARY_TEXT )
	Call( "SPDDHR:SetText", gHundreds , PRIMARY_TEXT )
	
	gSpeedo2 = 10*( Call( "*:GetControlValue", "SpeedometerKPH", 0 )) 
    gSPdecimal = math.floor( math.mod( gSpeedo2, 10 ))
    gUnits = math.floor( math.mod( gSpeedo2/10, 10 ))
    gTens = math.floor( math.mod( gSpeedo2/100, 10 ))
    gHundreds = math.floor( gSpeedo2/1000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	 if gHundreds == 0 then
      gHundreds = -1
      if gTens == 0 then
        gTens = -1
      end
    end
	Call( "SPDDUG:SetText", gUnits , PRIMARY_TEXT )
	Call( "SPDDTG:SetText", gTens , PRIMARY_TEXT )
	Call( "SPDDHG:SetText", gHundreds , PRIMARY_TEXT )
	if gSpeedo2 > gSpeedo3 + 2 then
	Call( "SPDDU:SetText", gUnits , SECONDARY_TEXT )
	Call( "SPDDT:SetText", gTens , SECONDARY_TEXT )
	Call( "SPDDH:SetText", gHundreds , SECONDARY_TEXT )
	Call( "SPDDU:SetText", "" , PRIMARY_TEXT )
	Call( "SPDDT:SetText", "" , PRIMARY_TEXT )
	Call( "SPDDH:SetText", "" , PRIMARY_TEXT )
	else
	Call( "SPDDU:SetText", "" , SECONDARY_TEXT )
	Call( "SPDDT:SetText", "" , SECONDARY_TEXT )
	Call( "SPDDH:SetText", "" , SECONDARY_TEXT )
	Call( "SPDDU:SetText", gUnits , PRIMARY_TEXT )
	Call( "SPDDT:SetText", gTens , PRIMARY_TEXT )
	Call( "SPDDH:SetText", gHundreds , PRIMARY_TEXT )
	end
	

    UN_number = Call( "GetRVNumber" )
	UN_number = math.abs(UN_number)
	UN_number = math.floor(UN_number)
	UN_number = tostring(UN_number)
	if string.len(UN_number) == 1 then
		UN_number = ("000" .. UN_number)
	elseif string.len(UN_number) == 2 then
		UN_number = ("00" .. UN_number)
	elseif string.len(UN_number) == 3 then
		UN_number = ("0" .. UN_number)
	end
	_, _, gD, gC, gB, gA = string.find(UN_number, "(%d)(%d)(%d)(%d)")
	Call("SetControlValue", "UN_units", 0,  tonumber(gA))
	Call("SetControlValue", "UN_tens", 0,  tonumber(gB))
	Call("SetControlValue", "UN_hundreds", 0, tonumber(gC))
	Call("SetControlValue", "UN_thousands", 0, tonumber(gD))

local result, state, distance, proState = Call("GetNextRestrictiveSignal")
    if distance >= 10000 then
	Call("SetControlValue", "Lkjdis_B", 0, 1)
	Call("SetControlValue", "Lkjdis_units", 0, -1)
	Call("SetControlValue", "Lkjdis_tens", 0,  -1)
	Call("SetControlValue", "Lkjdis_hundreds", 0, -1)
	Call("SetControlValue", "Lkjdis_A", 0, -1)
	else
	Call("SetControlValue", "Lkjdis_B", 0, -1)
	distance = math.abs(distance)
	distance = math.floor(distance)
	distance = tostring(distance)
	if string.len(distance) == 1 then
		distance = ("000" .. distance)
	elseif string.len(distance) == 2 then
		distance = ("00" .. distance)
	elseif string.len(distance) == 3 then
		distance = ("0" .. distance)
	end
	_, _, gD, gC, gB, gA = string.find(distance, "(%d)(%d)(%d)(%d)")
	Call("SetControlValue", "Lkjdis_units", 0,  tonumber(gA))
	Call("SetControlValue", "Lkjdis_tens", 0,  tonumber(gB))
	Call("SetControlValue", "Lkjdis_hundreds", 0, tonumber(gC))
	Call("SetControlValue", "Lkjdis_A", 0, tonumber(gD))
	end
	
	BrakeHandle = Call( "*:GetControlValue", "TrainBrakeControl", 0 )
	Emergency = Call( "*:GetControlValue", "EmergencyBrake", 0 )
    PowerHandle = Call( "*:GetControlValue", "SimpleThrottle", 0 )
	AFBHandle = Call( "*:GetControlValue", "CUR_Control", 0 )
	Reverser = Call( "*:GetControlValue", "Reverser", 0 )
	CurrentSpeed = Call( "*:GetControlValue", "SpeedometerKPH", 0 )
	TargetSpeed = gSpeedo4
    CUR = Call( "*:GetControlValue", "CUR_Control", 0 )
	Acceleration = Call( "*:GetAcceleration" )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	if Emergency == 1 then
	Call("SetControlValue", "emerind", 0, 1 )
	Call("SetControlValue", "notracind", 0, 1 )
	Call("SetControlValue", "CUR_Control", 0, 0 )
	Call("SetControlValue", "ThrottleAndBrake", 0, 0.5 )
	else
	Call("SetControlValue", "emerind", 0, 0 )
	Call("SetControlValue", "notracind", 0, 0 )
	end
	
	gLen = 10*Call("GetConsistLength")
    gUnits = math.floor( math.mod( gLen/10, 10 ))
    gTens = math.floor( math.mod( gLen/100, 10 ))
    gHundreds = math.floor( gLen/1000 )
	gtH = math.floor( gLen/10000 )
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b
	Call( "DISUY:SetText", gUnits , PRIMARY_TEXT )
	Call( "DISTY:SetText", gTens , PRIMARY_TEXT )
	Call( "DISHY:SetText", gHundreds , PRIMARY_TEXT )
	Call( "DISTHY:SetText", gtH , PRIMARY_TEXT )
	Call( "DISMY:SetText", gE , PRIMARY_TEXT )
	Call( "DISBY:SetText", gF , PRIMARY_TEXT )
	
	
	
	
	
	if CUR == 1 then
		if AFBHandle > 0.5 then
			SpeedError = math.abs( TargetSpeed - CurrentSpeed - 2 )
			SpeedErrorSign = ( TargetSpeed - CurrentSpeed - 2 ) / SpeedError -- Positive if current speed is too low.
 
			if SpeedError > 10 then

				if ( SpeedErrorSign == -1 ) then -- Above required speed.
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 1
					gAFBBrake = 0.5

				else -- Below required speed.
					gAFBDynamic = 0
					gAFBBrake = 0
					PowerIncrement = 0
					gAFBRegulator = 1
				end

			elseif SpeedError > 5 then

				if ( SpeedErrorSign == -1 ) then -- Above required speed.
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 0.8
					gAFBBrake = 0.2

				else -- Below required speed.
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

				if ( SpeedErrorSign == -1 ) then -- Above required speed.
					PowerIncrement = 0
					gAFBRegulator = 0
					gAFBDynamic = 0.4
					gAFBBrake = 0

				else -- Below required speed.
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

				if ( SpeedErrorSign == -1 ) then -- Above required speed.
					gAFBDynamic = 0
					gAFBBrake = 0
					if Acceleration < -0.04 then
						PowerIncrement = 0.01
					elseif Acceleration > -0.1 then
						PowerIncrement = -0.01
					else
						PowerIncrement = 0
					end
				else -- Below required speed.
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

			if PowerHandle >= gAFBRegulator then

				Call( "*:SetControlValue", "Regulator", 0, gAFBRegulator )
			else
				Call( "*:SetControlValue", "Regulator", 0, PowerHandle )
			end




		else

			gAFBRegulator = 0
			gAFBDynamic = 0
			gAFBBrake = 0
			Call( "*:SetControlValue", "Regulator", 0, PowerHandle )

		end
else
        Call( "*:SetControlValue", "TrainBrakeControl", 0, BrakeLever )
		Call( "*:SetControlValue", "DynamicBrake", 0, DynamicSet )

end


-- Set train brake, including AFB control. Couple dynamic brake as well.
	
	if Emergency ~= 1 then

			if BrakeHandle == 0 then

				
				if ( AFBHandle > 0 ) and ( PowerHandle > 0 ) then
					Call( "*:SetControlValue", "DynamicBrake", 0, gAFBDynamic )
				else
					Call( "*:SetControlValue", "DynamicBrake", 0, 0 )
				end

			elseif (BrakeHandle >= 0.219) and (BrakeHandle <= 0.221) then

				if AFBHandle > 0 then -- AFB control of brakes in this position.

					if PowerHandle > 0 then
						Call( "*:SetControlValue", "DynamicBrake", 0, gAFBDynamic )
						
					end

				else
					if gLastAFBHandle > 0 then -- Make sure any AFB application is released.
						Call( "*:SetControlValue", "TrainBrakeControl", 0, 0 )
					end
					Call( "*:SetControlValue", "DynamicBrake", 0, 0 )
				end

			elseif (BrakeHandle >= 0.349) and (BrakeHandle <= 0.351) then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 0.3 )

			elseif (BrakeHandle >= 0.479) and (BrakeHandle <= 0.481) then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 0.5 )

			elseif (BrakeHandle >= 0.609) and (BrakeHandle <= 0.611) then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 0.6 )

			elseif (BrakeHandle >= 0.739) and (BrakeHandle <= 0.741) then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 0.7 )

			elseif (BrakeHandle >= 0.869) and (BrakeHandle <= 0.871) then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 0.85 )

			elseif BrakeHandle == 1 then

				
				Call( "*:SetControlValue", "DynamicBrake", 0, 1 )

			end
		end
	
end

function OnConsistMessage ( msg, argument, direction )

if (Call("*:GetControlValue", "battsw", 0) == 1) then
if msg == LOCOSTARTUP then 
  Call( "SendConsistMessage", msg, argument, direction )
  Call("SetControlValue", "CabLight", 0, 1 )
  Call("SetControlValue", "battsw", 0, 1 )
end	
end

if (Call("*:GetControlValue", "Startup", 0) == 1) then
if msg == LOCOSTARTUPED then
  Call( "SendConsistMessage", msg, argument, direction )
  Call( "SetControlValue", "Startup", 0, 1 )
Call("SetControlValue", "HandBrake", 0, 0 )
  Call("SetControlValue", "ThrottleAndBrake", 0, 0.5 )
end	
end
	


end

function OnCustomSignalMessage( Southern )


SouthernK2 = string.sub( Southern, 4, 5 )
gCSaspect = tonumber( SouthernK2 )
Call( "*:SetControlValue", "CabSig", 0, gCSaspect )
Call( "BeginUpdate" )
end