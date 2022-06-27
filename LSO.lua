function BotSay(msg)
text='C:\\DiscordSendWebhook.exe -m "'..msg..'" -w "https://discord.com/api/webhooks/834917225583476755/AkB0xK4k1JA0hgY14JuBApLoTZ9pEMYnJS05YGfVYRK5FDUq2b9sCvQC-AOSkITPfPds"'
env.info(text)
os.execute(text)
end


SEH = EVENTHANDLER:New()
SEH:HandleEvent(EVENTS.LandingQualityMark)

function SEH:OnEventLandingQualityMark(EventData) 
	local	comment = EventData.comment
	local 	rodzaj = EventData.IniTypeName
	
	if rodzaj 		== "FA-18C_hornet" or rodzaj == "F/A-18C" 	then rodzaj = "F/A-18C Hornet" 
	elseif rodzaj 	== "A-4E-C" 								then rodzaj = "A-4E Skyhawk" 
	elseif rodzaj 	== "F-14A-135-GR" or rodzaj == "F-14A" 		then rodzaj = "F-14A Tomcat" 
	elseif rodzaj	== "F-14B" 									then rodzaj = "F-14B Tomcat"
	elseif rodzaj 	== "T-45"									then rodzaj = "T-45C Goshawk" 
	elseif rodzaj 	== "S-3B" or rodzaj == "S-3B Tanker"		then rodzaj = "S-3B Viking" 
	elseif rodzaj 	== "E-2C" 									then rodzaj = "E-2C Hawkeye" 
	elseif rodzaj 	== "C2A_Greyhound" 							then rodzaj = "C-2A Greyhound"
	else rodzaj = "nie wiadomo czym" 
	end
	
	local 	who = EventData.IniPlayerName
	
	if who ==nil then
	who = "Aik"
	else
	end
	
	local	where = EventData.PlaceName
	
	
	env.info(comment)
	--BotSay(comment..where)
	BotSay("Syria Range: **"..where.."**: "..who.." w "..rodzaj.." uzyskał:")
	BotSay(comment)
end
