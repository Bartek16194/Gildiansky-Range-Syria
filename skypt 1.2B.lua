-- Gildiansky Range by VladMordock
-- created for and copyrighted for gildia.org


--UŻYTKOWE
_SETTINGS:SetPlayerMenuOff()

	Texaco1	=SPAWN:New("Tanker 110Y Texaco 1")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()
	
	Texaco2	=SPAWN:New("Tanker 112Y Texaco 2")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()
	
	Texaco3	=SPAWN:New("Tanker 114Y Texaco 3")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()

	Shell1	=SPAWN:New("Tanker 111Y Shell 1")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()
	
	Shell2	=SPAWN:New("Tanker 113Y Shell 2")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()
	
	Shell3	=SPAWN:New("Tanker 115Y Shell 3")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()

	local Arco1=RECOVERYTANKER:New("CVN-71 Theodore Roosevelt", "Tanker 90Y Arco 1") -- Nazwa lotniskowca zależy od wybranego modelu
	Arco1:SetRadio(302):SetModex(510):SetTACAN(90, "AR1"):SetAltitude(5000):SetRacetrackDistances(15, 2):SetHomeBase("CVN-71 Theodore Roosevelt"):__Start(1)

	AWACSOverlord	=SPAWN:New("AWACS Overlord")	:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()
	AWACSMagic		=SPAWN:New("AWACS Magic")		:InitLimit( 1, 0 ):SpawnScheduled( 60, .1 ):InitRepeatOnLanding()

----- LOTNISKOWCE -----
----- B1 Roosevelt
--RESCUE HELO
B1Roosevelt_rescuehelo=RESCUEHELO:New("CVN-71 Theodore Roosevelt", "B1 Roosevelt Guard")
B1Roosevelt_rescuehelo:SetHomeBase(AIRBASE:FindByName("CVN-71 Theodore Roosevelt")) -- wybrany okręt
B1Roosevelt_rescuehelo:SetModex(71)
B1Roosevelt_rescuehelo:__Start(1)

----- B2 Tarawa
--RESCUE HELO
B2Tarawa_rescuehelo=RESCUEHELO:New("LHA-1 Tarawa", "B2 Tarawa Guard")
B2Tarawa_rescuehelo:SetHomeBase(AIRBASE:FindByName("LHA-1 Tarawa")) -- wybrany okręt
B2Tarawa_rescuehelo:SetModex(71)
B2Tarawa_rescuehelo:__Start(1)

----- B3 Kuzniecov
--RESCUE HELO
B3Kuzniecov_rescuehelo=RESCUEHELO:New("CV 1143.5 Admiral Kuznietsov", "B3 Kuzniecov Guard")
B3Kuzniecov_rescuehelo:SetHomeBase(AIRBASE:FindByName("CV 1143.5 Admiral Kuznietsov")) -- wybrany okręt
B3Kuzniecov_rescuehelo:SetModex(71)
B3Kuzniecov_rescuehelo:__Start(1)



--A2A POLIGONY -----------------------------------------------------------------------------------------------------------------

	Syria_CAP_Palmyra = ZONE_POLYGON:New( "PALMYRA CAP", GROUP:FindByName( "PALMYRA CAP" ) )
	Syria_CAP_H4 = ZONE_POLYGON:New( "H4 CAP", GROUP:FindByName( "H4 CAP" ) )

	Syria_CAP_Detection_Units = SET_GROUP:New()
	Syria_CAP_Detection_Units:FilterPrefixes( { "RED","DEF"} )
	Syria_CAP_Detection_Units:FilterStart()
	Syria_CAP_Detection = DETECTION_AREAS:New( Syria_CAP_Detection_Units, 300000 )
	
	Syria_CAP_Border = ZONE_POLYGON:New( "A2A BORDER", GROUP:FindByName( "A2A BORDER" ) )
	
	A2A_CAP = AI_A2A_DISPATCHER:New( Syria_CAP_Detection )
	A2A_CAP:SetBorderZone( Syria_CAP_Border )

	A2A_CAP:SetSquadron( "Palmyra CAP", AIRBASE.Syria.Palmyra, {"RED JF17 CAP", "RED M20005 CAP"})
	A2A_CAP:SetSquadronCap( "Palmyra CAP", Syria_CAP_Palmyra, UTILS.FeetToMeters(21000), UTILS.FeetToMeters(27000), UTILS.KnotsToKmph(270), UTILS.KnotsToKmph(320), UTILS.KnotsToKmph(270), UTILS.KnotsToKmph(900), "BARO" )
	A2A_CAP:SetSquadronCapRacetrack( "Palmyra CAP", UTILS.FeetToMeters(21000), UTILS.FeetToMeters(27000), 240, 60, 20*60, 40*60)
	A2A_CAP:SetSquadronCapInterval( "Palmyra CAP", 2, 30, 90, 1 )
	A2A_CAP:SetSquadronGci( "Palmyra CAP", 900, 1200 )


	A2A_CAP:SetSquadron( "H4 CAP", AIRBASE.Syria.H4, {"RED MiG-25 CAP", "RED MiG-29 CAP"})
	A2A_CAP:SetSquadronCap( "H4 CAP", Syria_CAP_H4, UTILS.FeetToMeters(19000), UTILS.FeetToMeters(27000), UTILS.KnotsToKmph(270), UTILS.KnotsToKmph(320), UTILS.KnotsToKmph(270), UTILS.KnotsToKmph(900), "BARO" )
	A2A_CAP:SetSquadronCapRacetrack( "H4 CAP", UTILS.FeetToMeters(19000), UTILS.FeetToMeters(27000), 120, 305, 20*60, 40*60)
	A2A_CAP:SetSquadronCapInterval( "H4 CAP", 2, 30, 90, 1 )
	A2A_CAP:SetSquadronGci( "H4 CAP", 900, 1200 )
	

	A2A_CAP:SetDefaultOverhead(1.25)
	A2A_CAP:SetEngageRadius(100000)
	A2A_CAP:SetDefaultTakeoffFromParkingHot()
	A2A_CAP:SetDefaultLandingNearAirbase ()
	A2A_CAP:SetDefaultFuelThreshold(0.20)
	A2A_CAP:SetDefaultGrouping(2)
	A2A_CAP:SetDefaultDamageThreshold( 0.90 )
	A2A_CAP:SetDefaultCapLimit(6)
	A2A_CAP:SetGciRadius( 125000 )
	
	A2A_CAP:SetTacticalDisplay( false )





-- POLGONY A2G-------------

-- A2G 01 Lotnisko + Samy		   
function Poligon_A2G_01_Spawner()
	A2G01_1= SPAWN:New( "A2G 01 01" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G01_2= SPAWN:New( "A2G 01 02" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G01_3= SPAWN:New( "A2G 01 03" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G01_4= SPAWN:New( "A2G 01 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G01_5= SPAWN:New( "A2G 01 05" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G01_6= SPAWN:New( "A2G 01 06" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G01_7= SPAWN:New( "A2G 01 07" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G01_8= SPAWN:New( "A2G 01 08" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	A2G01_9= SPAWN:New( "A2G 01 09" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	A2G01_10= SPAWN:New( "A2G 01 10" )	:InitLimit( 2, 0 )	:SpawnScheduled(3600, 1)
	A2G01_11= SPAWN:New( "A2G 01 11" )	:InitLimit( 2, 0 )	:SpawnScheduled(3600, 1)
	A2G01_12= SPAWN:New( "A2G 01 12" )	:InitLimit( 2, 0 )	:SpawnScheduled(3600, 1)
	A2G01_13= SPAWN:New( "A2G 01 13" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	A2G01_14= SPAWN:New( "A2G 01 14" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	A2G01_15= SPAWN:New( "A2G 01 15" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	A2G01_16= SPAWN:New( "A2G 01 16" )	:InitLimit( 1, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G01_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 01 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 01 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G01_Na_mapie = true
	end
	
end

-- A2G 02 Lotnisko + cele dla F14	  
function Poligon_A2G_02_Spawner()
	A2G02_1= SPAWN:New( "A2G 02 01" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_2= SPAWN:New( "A2G 02 02" )	:InitLimit( 7, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_3= SPAWN:New( "A2G 02 03" )	:InitLimit( 13, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_4= SPAWN:New( "A2G 02 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_5= SPAWN:New( "A2G 02 05" )	:InitLimit( 7, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_6= SPAWN:New( "A2G 02 06" )	:InitLimit( 13, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_7= SPAWN:New( "A2G 02 07" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	A2G02_8= SPAWN:New( "A2G 02 08" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1):InitUnControlled(UnControlled)
	
	if A2G02_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 02 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 02 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G02_Na_mapie = true
	end
	
end

-- A2G 03 Tama	
function Poligon_A2G_03_Spawner()
	A2G03_1= SPAWN:New( "A2G 03 01" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G03_2= SPAWN:New( "A2G 03 02" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G03_3= SPAWN:New( "A2G 03 03" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G03_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 03 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 03 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G03_Na_mapie = true
	end
	
end

-- A2G 04 Chinole	 
function Poligon_A2G_04_Spawner()
	A2G04_1= SPAWN:New( "A2G 04 01" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G04_2= SPAWN:New( "A2G 04 02" )	:InitLimit( 5, 0 )	:SpawnScheduled(3600, 1)
	A2G04_3= SPAWN:New( "A2G 04 03" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G04_4= SPAWN:New( "A2G 04 04" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G04_5= SPAWN:New( "A2G 04 05" )	:InitLimit( 5, 0 )	:SpawnScheduled(3600, 1)
	A2G04_6= SPAWN:New( "A2G 04 06" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G04_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 04 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 04 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G04_Na_mapie = true
	end
	
end

-- A2G 05 Lotnisko po południe od damaszku	
function Poligon_A2G_05_Spawner()
	A2G05_1= SPAWN:New( "A2G 05 01" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_2= SPAWN:New( "A2G 05 02" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_3= SPAWN:New( "A2G 05 03" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_4= SPAWN:New( "A2G 05 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_5= SPAWN:New( "A2G 05 05" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_6= SPAWN:New( "A2G 05 06" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G05_7= SPAWN:New( "A2G 05 07" )	:InitLimit( 2, 0 )	:SpawnScheduled(3600, 1)
	A2G05_8= SPAWN:New( "A2G 05 08" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G05_9= SPAWN:New( "A2G 05 09" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G05_10= SPAWN:New( "A2G 05 10" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G05_11= SPAWN:New( "A2G 05 11" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G05_12= SPAWN:New( "A2G 05 12" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G05_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 05 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 05 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G05_Na_mapie = true
	end
	
	end

-- A2G 06 Posterunek na drodze	  
function Poligon_A2G_06_Spawner()
	A2G06_1= SPAWN:New( "A2G 06 01" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G06_2= SPAWN:New( "A2G 06 02" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G06_3= SPAWN:New( "A2G 06 03" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G06_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 06 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 06 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G06_Na_mapie = true
	end
	
	end

-- A2G 07 Wioska SEAD 
function Poligon_A2G_07_Spawner()
	A2G07_1= SPAWN:New( "A2G 07 01" )	:InitLimit( 5, 0 )	:SpawnScheduled(3600, 1)
	A2G07_2= SPAWN:New( "A2G 07 02" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G07_3= SPAWN:New( "A2G 07 03" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G07_4= SPAWN:New( "A2G 07 04" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G07_5= SPAWN:New( "A2G 07 05" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G07_6= SPAWN:New( "A2G 07 06" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G07_7= SPAWN:New( "A2G 07 07" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G07_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 07 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 07 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G07_Na_mapie = true
	end
	
	end

-- A2G 08 Skład paliwowy 
function Poligon_A2G_08_Spawner()
	A2G08_1= SPAWN:New( "A2G 08 01" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_2= SPAWN:New( "A2G 08 02" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_3= SPAWN:New( "A2G 08 03" )	:InitLimit( 7, 0 )	:SpawnScheduled(3600, 1)
	A2G08_4= SPAWN:New( "A2G 08 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_5= SPAWN:New( "A2G 08 05" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_6= SPAWN:New( "A2G 08 06" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_7= SPAWN:New( "A2G 08 07" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_8= SPAWN:New( "A2G 08 08" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G08_9= SPAWN:New( "A2G 08 09" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G08_10= SPAWN:New( "A2G 08 10" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G08_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 08 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 08 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G08_Na_mapie = true
	end
	
	end

-- A2G 09 zajete miastko
function Poligon_A2G_09_Spawner()
	A2G09_1= SPAWN:New( "A2G 09 01" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G09_2= SPAWN:New( "A2G 09 02" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G09_3= SPAWN:New( "A2G 09 03" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G09_4= SPAWN:New( "A2G  09 04" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G09_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 09 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 09 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G09_Na_mapie = true
	end
	
	end

-- A2G 10 Baza w lesie
function Poligon_A2G_10_Spawner()
	A2G10_1= SPAWN:New( "A2G 10 01" )	:InitLimit( 9, 0 )	:SpawnScheduled(3600, 1)
	A2G10_2= SPAWN:New( "A2G 10 02" )	:InitLimit( 9, 0 )	:SpawnScheduled(3600, 1)
	A2G10_3= SPAWN:New( "A2G 10 03" )	:InitLimit( 9, 0 )	:SpawnScheduled(3600, 1)
	A2G10_4= SPAWN:New( "A2G 10 04" )	:InitLimit( 14, 0 )	:SpawnScheduled(3600, 1)
	A2G10_5= SPAWN:New( "A2G 10 05" )	:InitLimit( 9, 0 )	:SpawnScheduled(3600, 1)
	A2G10_6= SPAWN:New( "A2G 10 06" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G10_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 10 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 10 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G10_Na_mapie = true
	end
	
	end

-- A2G 11 Mini skład
function Poligon_A2G_11_Spawner()
	A2G11_1= SPAWN:New( "A2G 11 01" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G11_2= SPAWN:New( "A2G 11 02" )	:InitLimit( 3, 0 )	:SpawnScheduled(3600, 1)
	A2G11_3= SPAWN:New( "A2G 11 03" )	:InitLimit( 3, 0 )	:SpawnScheduled(3600, 1)
	A2G11_4= SPAWN:New( "A2G 11 04" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G11_5= SPAWN:New( "A2G 11 05" )	:InitLimit( 5, 0 )	:SpawnScheduled(3600, 1)
	A2G11_6= SPAWN:New( "A2G 11 06" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G11_7= SPAWN:New( "A2G 11 07" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G11_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 11 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 11 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G11_Na_mapie = true
	end
	
	end

-- A2G 12 Desantt w Bejrucie
function Poligon_A2G_12_Spawner()
	A2G12_1= SPAWN:New( "A2G 12 01" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G12_2= SPAWN:New( "A2G 12 02" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G12_3= SPAWN:New( "A2G 12 03" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G12_4= SPAWN:New( "A2G 12 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G12_5= SPAWN:New( "A2G 12 05" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G12_6= SPAWN:New( "A2G 12 06" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G12_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 12 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 12 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G12_Na_mapie = true
	end
	
	end

-- A2G 13 Port w Bejrucie
function Poligon_A2G_13_Spawner()
	A2G13_1= SPAWN:New( "A2G 13 01" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G13_2= SPAWN:New( "A2G 13 02" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G13_3= SPAWN:New( "A2G 13 03" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G13_4= SPAWN:New( "A2G 13 04" )	:InitLimit( 2, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G13_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 13 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 13 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G13_Na_mapie = true
	end
	
	end

-- A2G 14 Nieaktywna SA-10 
function Poligon_A2G_14_Spawner()
	A2G14_1= SPAWN:New( "A2G 14 01" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G14_2= SPAWN:New( "A2G 14 02" )	:InitLimit( 3, 0 )	:SpawnScheduled(3600, 1) 
	
	if A2G14_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 14 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 14 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G14_Na_mapie = true
	end
	
	end

-- A2G 15 Aktywna SA-10
function Poligon_A2G_15_Spawner()
	A2G15_1= SPAWN:New( "A2G 15 01" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G15_2= SPAWN:New( "A2G 15 02" )	:InitLimit( 3, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G15_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 15 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 15 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G15_Na_mapie = true
	end
	
	end

-- A2G 16 Aktywna SA-2/3
function Poligon_A2G_16_Spawner()
	A2G16_1= SPAWN:New( "A2G 16 01" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G16_2= SPAWN:New( "A2G 16 02" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G16_3= SPAWN:New( "A2G 16 03" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G16_4= SPAWN:New( "A2G 16 04" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G16_5= SPAWN:New( "A2G 16 05" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	A2G16_6= SPAWN:New( "A2G 16 06" )	:InitLimit( 4, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G16_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 16 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 16 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G16_Na_mapie = true
	end
	
	end

-- A2G 17 Aktywna SA-2/3
function Poligon_A2G_17_Spawner()
	A2G17_1= SPAWN:New( "A2G 17 01" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G17_2= SPAWN:New( "A2G 17 02" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G17_3= SPAWN:New( "A2G 17 03" )	:InitLimit( 11, 0 )	:SpawnScheduled(3600, 1)
	A2G17_4= SPAWN:New( "A2G 17 04" )	:InitLimit( 12, 0 )	:SpawnScheduled(3600, 1)
	A2G17_5= SPAWN:New( "A2G 17 05" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G17_6= SPAWN:New( "A2G 17 06" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G17_7= SPAWN:New( "A2G 17 07" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	A2G17_8= SPAWN:New( "A2G 17 08" )	:InitLimit( 10, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G17_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 17 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 17 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G17_Na_mapie = true
	end
	
	end

-- A2G 18 Turecka wioska
function Poligon_A2G_18_Spawner()
	A2G18_1= SPAWN:New( "A2G 18 01" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G18_2= SPAWN:New( "A2G 18 02" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G18_3= SPAWN:New( "A2G 18 03" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G18_4= SPAWN:New( "A2G 18 04" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G18_5= SPAWN:New( "A2G 18 05" )	:InitLimit( 13, 0 )	:SpawnScheduled(3600, 1)
	A2G18_6= SPAWN:New( "A2G 18 06" )	:InitLimit( 13, 0 )	:SpawnScheduled(3600, 1)
	A2G18_7= SPAWN:New( "A2G 18 07" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G18_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 18 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 18 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G18_Na_mapie = true
	end
	
	end

-- A2G 19 Port EWR
function Poligon_A2G_19_Spawner()
	A2G19_1= SPAWN:New( "A2G 19 01" )	:InitLimit( 15, 0 )	:SpawnScheduled(3600, 1)
	A2G19_2= SPAWN:New( "A2G 19 02" )	:InitLimit( 3, 0 )	:SpawnScheduled(3600, 1)
	A2G19_3= SPAWN:New( "A2G 19 03" )	:InitLimit( 6, 0 )	:SpawnScheduled(3600, 1)
	A2G19_4= SPAWN:New( "A2G 19 04" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	A2G19_5= SPAWN:New( "A2G 19 05" )	:InitLimit( 8, 0 )	:SpawnScheduled(3600, 1)
	
	if A2G19_Na_mapie == true then 
		MESSAGE:New("Poligon A2G 19 został zrespawnowany.", 5):ToCoalition( coalition.side.BLUE )
	else
		MESSAGE:New("Poligon A2G 19 został uruchomiony.", 5):ToCoalition( coalition.side.BLUE )
		A2G19_Na_mapie = true
	end
	
	end



-- Menu spawn

	Spawner_Main = MENU_COALITION:New( coalition.side.BLUE, "Włączanie poligonów" )

	Spawner_Main_A2G_Pierwsze = MENU_COALITION:New( coalition.side.BLUE, "Lądowe część pierwsza" , Spawner_Main)
	Spawner_Main_A2G_Drugie = MENU_COALITION:New( coalition.side.BLUE, "Lądowe część druga" , Spawner_Main)
	Spawner_Main_A2G_Trzecie = MENU_COALITION:New( coalition.side.BLUE, "Lądowe część trzecia" , Spawner_Main)


	Spawner_Main_A2G_01 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 01", Spawner_Main_A2G_Pierwsze, Poligon_A2G_01_Spawner)
	Spawner_Main_A2G_02 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 02", Spawner_Main_A2G_Pierwsze, Poligon_A2G_02_Spawner)
	Spawner_Main_A2G_03 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 03", Spawner_Main_A2G_Pierwsze, Poligon_A2G_03_Spawner)
	Spawner_Main_A2G_04 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 04", Spawner_Main_A2G_Pierwsze, Poligon_A2G_04_Spawner)
	Spawner_Main_A2G_05 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 05", Spawner_Main_A2G_Pierwsze, Poligon_A2G_05_Spawner)
	Spawner_Main_A2G_06 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 06", Spawner_Main_A2G_Pierwsze, Poligon_A2G_06_Spawner)
	Spawner_Main_A2G_07 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 07", Spawner_Main_A2G_Pierwsze, Poligon_A2G_07_Spawner)
	Spawner_Main_A2G_08 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 08", Spawner_Main_A2G_Pierwsze, Poligon_A2G_08_Spawner)
	Spawner_Main_A2G_09 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 09", Spawner_Main_A2G_Pierwsze, Poligon_A2G_09_Spawner)
	Spawner_Main_A2G_10 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 10", Spawner_Main_A2G_Drugie, Poligon_A2G_10_Spawner)
	Spawner_Main_A2G_11 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 11", Spawner_Main_A2G_Drugie, Poligon_A2G_11_Spawner)
	Spawner_Main_A2G_12 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 12", Spawner_Main_A2G_Drugie, Poligon_A2G_12_Spawner)
	Spawner_Main_A2G_13 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 13", Spawner_Main_A2G_Drugie, Poligon_A2G_13_Spawner)
	Spawner_Main_A2G_14 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 14", Spawner_Main_A2G_Drugie, Poligon_A2G_14_Spawner)
	Spawner_Main_A2G_15 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 15", Spawner_Main_A2G_Drugie, Poligon_A2G_15_Spawner)
	Spawner_Main_A2G_16 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 16", Spawner_Main_A2G_Drugie, Poligon_A2G_16_Spawner)
	Spawner_Main_A2G_17 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 17", Spawner_Main_A2G_Drugie, Poligon_A2G_17_Spawner)
	Spawner_Main_A2G_18 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 18", Spawner_Main_A2G_Drugie, Poligon_A2G_18_Spawner)
	Spawner_Main_A2G_19 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "A2G 19", Spawner_Main_A2G_Trzecie, Poligon_A2G_19_Spawner)
