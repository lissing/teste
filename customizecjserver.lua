root = getRootElement ()
players = {}
players = getElementsByType ( "player" )

function applyClothing ( incredibleTable )
	if getPlayerSkin ( source ) ~= 0 then
		 setPlayerSkin ( source, 0 )
	end

	count = 0
	while count ~= 9 do
		local c = count
		if(c > 3) then c = c+9 end
		if tostring(incredibleTable[count].storedValue) == "x" then
			removePlayerClothes ( source, c )
		elseif tostring(incredibleTable[count].storedValue) ~= "" then --blank fields do nothing
			local texture, model = getClothesByTypeIndex ( c, tostring(incredibleTable[count].storedValue) )
			addPlayerClothes ( source, texture, model, c )  
			--outputChatBox ( "texture: "..texture.."       model: "..model.."       count: "..count )
		end
		count = count + 1
	end
	if tostring(incredibleTable[9].storedValue) ~= "" then
		setPlayerStat ( source, 21, incredibleTable[9].storedValue )
		--outputChatBox ( "Fat stuff triggered" )
	end
	if tostring(incredibleTable[10].storedValue) ~= "" then
		setPlayerStat ( source, 23, incredibleTable[10].storedValue )
		--outputChatBox ( "Strong stuff triggered" )
	end	
end
addEvent("applyClothes", true, "incredibleTable" )
addEventHandler("applyClothes", getRootElement(), applyClothing)

--function consolePositionb ( player, commandName, indexxx )
--outputChatBox ( "inputindex: "..indexxx )
--textureee, modelll = getClothesByTypeIndex ( 16, indexxx )
--outputChatBox ( "texture: "..textureee.." model: "..modelll )
--addPlayerClothes ( player, textureee, modelll, 16 )
--end
--addCommandHandler ( "f", consolePositionb )           