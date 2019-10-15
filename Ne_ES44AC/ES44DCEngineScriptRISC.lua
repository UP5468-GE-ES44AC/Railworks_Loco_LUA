gTimerS = 0
gNewTimerS = 0
gHundreds = 0
gTens = 0
gUnits = 0
gSpeedo = 0
gAmount = 0
gCSaspect = 0
gCSprevAspect = 0
-- How long to stay off/on in each flash cycle
LIGHT_FLASH_OFF_SECS = 0.5
LIGHT_FLASH_ON_SECS  = 0.5

-- State of flashing light
gTimeSinceLastFlash  = 0
gLightFlashOn        = false
gFirstLightFlash     = true
DEBUG = false
function DebugPrint( message )
	if (DEBUG) then
		Print( message )
	end
end

function Initialise ()
    Call( "dis:SetText", "", PRIMARY_TEXT )
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
	Call("cabsignal2:ActivateNode", "green1", 0)
	Call("cabsignal2:ActivateNode", "greeny1", 0)
	Call("cabsignal2:ActivateNode", "yellow1", 0)
	Call("cabsignal2:ActivateNode", "yellowt1", 0)
	Call("cabsignal2:ActivateNode", "redy1", 0)
	Call("cabsignal2:ActivateNode", "dyellow1", 0)
	Call("cabsignal2:ActivateNode", "red1", 0)
	Call("cabsignal2:ActivateNode", "white1", 0)
	Call("cabsignal2:ActivateNode", "green2", 0)
	Call("cabsignal2:ActivateNode", "greeny2", 0)
	Call("cabsignal2:ActivateNode", "yellow2", 0)
	Call("cabsignal2:ActivateNode", "yellowt2", 0)
	Call("cabsignal2:ActivateNode", "redy2", 0)
	Call("cabsignal2:ActivateNode", "dyellow2", 0)
	Call("cabsignal2:ActivateNode", "red2", 0)
	Call("cabsignal2:ActivateNode", "white2", 0)
	Call("cabsignal2:ActivateNode", "op", 1)
	Call("cabsignal2:ActivateNode", "zs1", 1)
	Call("cabsignal2:ActivateNode", "zs", 1)
	Call( "SetControlValue", "lkjspdunit", 0, 0 )
	Call( "SetControlValue", "lkjspdten", 0, -1 )
	Call( "SetControlValue", "lkjspdhund", 0, 0 )
	Call( "BeginUpdate" )
end

function OnControlValueChange ( name, index, value )
    if Call( "*:ControlExists", name, index ) then
       Call( "*:SetControlValue", name, index, value );
    end
	if name == "Headlights" then
		if value == 0 then
		  Call( "ActivateNode", "ditch_glass_R", 0 )
	      Call( "ActivateNode", "ditch_glass_L", 0 )
	      Call( "ActivateNode", "lights_revhead", 0 )
		  Call( "ActivateNode", "lights_fwdhead", 0 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 0 )
	      Call( "Headlight_02:Activate", 0 )
	      Call( "D_Headlight_03:Activate", 0 )
	      Call( "D_Headlight_04:Activate", 0 )
		elseif value == 1 then
		  Call( "ActivateNode", "ditch_glass_R", 1 )
	      Call( "ActivateNode", "ditch_glass_L", 1 )
	      Call( "ActivateNode", "lights_revhead", 0 )
		  Call( "ActivateNode", "lights_fwdhead", 1 )
		  Call( "B_Headlight_01:Activate", 0 )
		  Call( "B_Headlight_02:Activate", 0 )
		  Call( "Headlight_01:Activate", 1 )
	      Call( "Headlight_02:Activate", 1 )
	      Call( "D_Headlight_03:Activate", 1 )
	      Call( "D_Headlight_04:Activate", 1 )
		elseif value == 2 then
		  Call( "ActivateNode", "ditch_glass_R", 0 )
	      Call( "ActivateNode", "ditch_glass_L", 0 )
	      Call( "ActivateNode", "lights_revhead", 1 )
		  Call( "ActivateNode", "lights_fwdhead", 0 )
		  Call( "B_Headlight_01:Activate", 1 )
		  Call( "B_Headlight_02:Activate", 1 )
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
	--上下行指示
	if name == "Reverser" then
		if value == -1 then
	     Call("cabsignal2:ActivateNode", "up", 0)
	     Call("cabsignal2:ActivateNode", "dn", 1)
		 Call( "dis:SetText", "1", PRIMARY_TEXT )
		elseif value == 0 then
		Call("cabsignal2:ActivateNode", "up", 0)
	    Call("cabsignal2:ActivateNode", "dn", 0)
		Call( "dis:SetText", "2", PRIMARY_TEXT )
		elseif value == 1 then
		Call("cabsignal2:ActivateNode", "up", 1)
	    Call("cabsignal2:ActivateNode", "dn", 0)
		Call( "dis:SetText", "3", PRIMARY_TEXT )
		end
	end
	
	--紧急制动
	if name == "EmergencyBrake" then
		if value == 0 then
	      Call("SetControlValue", "EmergencyBrake", 0, 0 ) 
		elseif value == 1 then
		Call("SetControlValue", "EmergencyBrake", 0, 1 )
		SysCall("ScenarioManager:ShowAlertMessageExt", "SNL ES44AC WARN" , "紧急制动已触发！请等待停车后进行缓解操作！" , 3 )
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
  gSto = Call("*:GetControlValue", "StopButton", 0)
  Call( "SetControlValue", "RPM", 0, 0 )
  if gBt == 0 then
  Call( "SetControlValue", "Startup", 0, -1 )
  Call( "SetControlValue", "RPM", 0, 0 )
  elseif gBt == 1 then
  if gSta == 1 then
		Call( "SetControlValue", "Startup", 0, 1 )
  elseif gSto == 1 then
		Call( "SetControlValue", "Startup", 0, -1 )
	end
  end
  
  gInitialised = true
   Call( "dis:SetText", "5", PRIMARY_TEXT )
   cabligh = Call("*:GetControlValue", "Headlights", 0)
   if cabligh == 1 then
   -- If this is the first flash, reset time since last flash and light flash on
     if gFirstLightFlash then

          -- Reset flash state
          gTimeSinceLastFlash = 0
          gFirstLightFlash    = false
          gLightFlashOn       = false

     -- Otherwise...
     else

          -- Increment the timer by however much time has passed since the last update
          gTimeSinceLastFlash = gTimeSinceLastFlash + time

          -- If it's off and has been off long enough, switch on
          if (not gLightFlashOn) and gTimeSinceLastFlash >= LIGHT_FLASH_OFF_SECS then
               Call( "ActivateNode", "ditch_glass_R", 1 )
	           Call( "Fwd_Headlight_03:Activate", 1 )
			   Call( "Ditch_R:Activate", 1 )
	           Call( "Ditch_L:Activate", 0 )
			   Call( "Fwd_Headlight_04:Activate", 0 )
	           Call( "ActivateNode", "ditch_glass_L", 0 )
               gLightFlashOn = true
               gTimeSinceLastFlash = 0

          -- If it's on and has been on long enough, switch off
          elseif gLightFlashOn and gTimeSinceLastFlash >= LIGHT_FLASH_ON_SECS then
               Call( "ActivateNode", "ditch_glass_R", 0 )
	           Call( "Fwd_Headlight_03:Activate", 0 )
               Call( "Ditch_R:Activate", 0 )
	           Call( "Ditch_L:Activate", 1 )
			   Call( "Fwd_Headlight_04:Activate", 1 )
	           Call( "ActivateNode", "ditch_glass_L", 1 )
               gLightFlashOn = false
               gTimeSinceLastFlash = 0

          end

     end
    else
	Call( "ActivateNode", "ditch_glass_R", 0 )
	Call( "Fwd_Headlight_03:Activate", 0 )
	Call( "Fwd_Headlight_04:Activate", 0 )
	Call( "ActivateNode", "ditch_glass_L", 0 )
	end
	
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
	Call( "dis:SetText", tonumber(gUnits), PRIMARY_TEXT )
elseif Call("*:GetControlValue", "G_Speedo", 0) == 1 then
	Call("*:SetControlValue", "SPEED_units", 0,  tonumber(gUnits))
	Call("*:SetControlValue", "SPEED_tens", 0,  tonumber(gTens))
end 

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
	Call("SetControlValue", "Lkjspd_units", 0,  tonumber(gUnits))
	Call("SetControlValue", "Lkjspd_tens", 0,  tonumber(gTens))
	Call("SetControlValue", "Lkjspd_hundreds", 0, tonumber(gHundreds))

   
	
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
	Call("SetControlValue", "Lkjlim_units", 0,  tonumber(gUnits))
	Call("SetControlValue", "Lkjlim_tens", 0,  tonumber(gTens))
	Call("SetControlValue", "Lkjlim_hundreds", 0, tonumber(gHundreds))

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
	end
	
    -- Note: If RW adopts LUA 4 or higher, mod(a, b) becomes a % b

function OnCustomSignalMessage( Southern )
local SouthernK2 = Southern + 1
Call( "*:SetControlValue", "CabSig", 0, SouthernK2 )
Call("BeginUpdate")
end