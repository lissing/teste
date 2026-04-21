root = getRootElement ()
outputChatBox ( "Press F2 or type /custom to change CJ clothes!" )

-- 1. put all the stat names as they appear in the gui
x = ""
defaultSettings = {
	["shirt"] = x,
	["hair"] = x,
	["pants"] = x,
	["shoes"] = x,
	["necklace"] = x,
	["watch"] = x,
	["glasses"] = x,
	["hat"] = x,
	["extracjskins"] = x,
	["fatstat"] = x,
	["musclestat"] = x
	-- .... etc
}

function activateMenu ( player, key )
	if (mainWindow) then
		guiSetVisible ( mainWindow, true )
	else
		local settingsFile = xmlLoadFile( "settings.xml" )
		if not settingsFile then
			settingsFile = xmlCreateFile( "settings.xml", "settings" )
			
			-- 2. this will create the default file, use the same fields you put in the default table
			local shirtChild = xmlCreateChild( settingsFile, "Shirt" )
			xmlNodeSetValue( shirtChild, tostring( defaultSettings.shirt ) )
			local hairChild = xmlCreateChild( settingsFile, "Hair" )
			xmlNodeSetValue( hairChild, tostring( defaultSettings.hair ) )
			local pantsChild = xmlCreateChild( settingsFile, "Pants" )
			xmlNodeSetValue( pantsChild, tostring( defaultSettings.pants ) )
			local shoesChild = xmlCreateChild( settingsFile, "Shoes" )
			xmlNodeSetValue( shoesChild, tostring( defaultSettings.shoes ) )
			local hatChild = xmlCreateChild( settingsFile, "Hat" )
			xmlNodeSetValue( hatChild, tostring( defaultSettings.hat ) )
			local glassesChild = xmlCreateChild( settingsFile, "Glasses" )
			xmlNodeSetValue( glassesChild, tostring( defaultSettings.glasses ) )
			local necklaceChild = xmlCreateChild( settingsFile, "Necklace" )
			xmlNodeSetValue( necklaceChild, tostring( defaultSettings.necklace ) )
			local watchChild = xmlCreateChild( settingsFile, "Watch" )
			xmlNodeSetValue( watchChild, tostring( defaultSettings.watch ) )
			local extracjskinsChild = xmlCreateChild( settingsFile, "ExtraCJSkins" )
			xmlNodeSetValue( extracjskinsChild, tostring( defaultSettings.extracjskins ) )
			local fatstatChild = xmlCreateChild( settingsFile, "FatStat" )
			xmlNodeSetValue( fatstatChild, tostring( defaultSettings.fatstat ) )
			local musclestatChild = xmlCreateChild( settingsFile, "MuscleStat" )
			xmlNodeSetValue( musclestatChild, tostring( defaultSettings.musclestat ) )
			-- ... etc
			
			xmlSaveFile( settingsFile )
		end
			
		mainWindow = guiCreateWindow( 0.1898,0.2288,0.2242,0.5125, "CJ Customization", true )
		guiCreateStaticImage( 0.0314,0.7878,0.7596,0.1902, "images/img.png",true, mainWindow )
		guiCreateLabel( 0.0523,0.0732,0.3484,0.0415, "Shirt", true, mainWindow )
		guiCreateLabel( 0.0523,0.1317,0.223,0.0317, "Hair", true, mainWindow )
		guiCreateLabel( 0.0488,0.1805,0.2021,0.0341, "Pants", true, mainWindow )
		guiCreateLabel( 0.0453,0.2268,0.1289,0.0415, "Shoes", true, mainWindow )
		guiCreateLabel( 0.0488,0.2707,0.1463,0.039, "Necklace", true, mainWindow )
		guiCreateLabel( 0.0453,0.3122,0.23,0.0341, "Watch", true, mainWindow )
		guiCreateLabel( 0.0453,0.3561,0.1707,0.0317, "Glasses", true, mainWindow )
		guiCreateLabel( 0.0453,0.4,0.1742,0.0317, "Hat", true, mainWindow )
		guiCreateLabel( 0.0453,0.4463,0.2474,0.0366, "ExtraCJSkins", true, mainWindow )
		guiCreateLabel( 0.0453,0.4927,0.2718,0.0366, "FatStat", true, mainWindow )
		guiCreateLabel( 0.0418,0.539,0.2439,0.0341, "MuscleStat", true, mainWindow )
			

		
		local shirtChild = xmlFindChild( settingsFile, "Shirt", 0 )
		local hairChild = xmlFindChild( settingsFile, "Hair", 0 )
		local pantsChild = xmlFindChild( settingsFile, "Pants", 0 )
		local shoesChild = xmlFindChild( settingsFile, "Shoes", 0 )
		local hatChild = xmlFindChild( settingsFile, "Hat", 0 )
		local glassesChild = xmlFindChild( settingsFile, "Glasses", 0 )
		local necklaceChild = xmlFindChild( settingsFile, "Necklace", 0 )
		local watchChild = xmlFindChild( settingsFile, "Watch", 0 )
		local extracjskinsChild = xmlFindChild( settingsFile, "ExtraCJSkins", 0 )
		local fatstatChild = xmlFindChild( settingsFile, "FatStat", 0 )
		local musclestatChild = xmlFindChild( settingsFile, "MuscleStat", 0 )

	-- ...
		local shirt = xmlNodeGetValue( shirtChild )
		local hair = xmlNodeGetValue( hairChild )
		local pants = xmlNodeGetValue( pantsChild )
		local shoes = xmlNodeGetValue( shoesChild )
		local hat = xmlNodeGetValue( hatChild )
		local glasses = xmlNodeGetValue( glassesChild )
		local necklace = xmlNodeGetValue( necklaceChild )
		local watch = xmlNodeGetValue( watchChild )
		local extracjskins = xmlNodeGetValue( extracjskinsChild )
		local fatstat = xmlNodeGetValue( fatstatChild )
		local musclestat = xmlNodeGetValue( musclestatChild )
		
						defaultSettings = {
	["shirt"] = x,
	["hair"] = x,
	["pants"] = x,
	["shoes"] = x,
	["necklace"] = x,
	["watch"] = x,
	["glasses"] = x,
	["hat"] = x,
	["extracjskins"] = x,
	["fatstat"] = x,
	["musclestat"] = x
	-- .... etc
}
	 
		-- ...
		editA = guiCreateEdit( 0.453,0.078,0.1672,0.0439, shirt, true, mainWindow )
		editB = guiCreateEdit( 0.453,0.1293,0.1672,0.0439, hair, true, mainWindow )
		editC = guiCreateEdit( 0.453,0.178,0.1672,0.0439, pants, true, mainWindow )
		editD = guiCreateEdit( 0.453,0.222,0.1672,0.0439, shoes,true, mainWindow )
		editQ = guiCreateEdit( 0.453,0.2707,0.1672,0.0439, necklace, true, mainWindow )
		editP = guiCreateEdit( 0.453,0.3171,0.1672,0.0439, watch, true, mainWindow )
		editN = guiCreateEdit( 0.453,0.3585,0.1672,0.0439, glasses, true, mainWindow )
		editO = guiCreateEdit( 0.453,0.3976,0.1672,0.0439, hat, true, mainWindow )
		editR = guiCreateEdit( 0.453,0.4415,0.1672,0.0439, extracjskins, true, mainWindow )
		editS = guiCreateEdit( 0.4564,0.4902,0.1672,0.0439, fatstat, true, mainWindow )
		editT = guiCreateEdit( 0.4564,0.5366,0.1672,0.0439, musclestat, true, mainWindow )
		applyButton = guiCreateButton( 0.0767,0.6171,0.3659,0.0829, "Apply", true, mainWindow )
		exitButton = guiCreateButton( 0.4983,0.6171,0.3659,0.0829, "Cancel", true, mainWindow )
		guiCreateLabel( 0.0314,0.6951,0.5157,0.0902, "/saveskin", true, mainWindow )
		guiCreateLabel( 0.8188,0.9366,0.1498,0.0366, "v0.02b", true, mainWindow )
		guiCreateLabel( 0.5958,0.7537,0.3206,0.0293, "beta version", true, mainWindow )
		
	end 
	showCursor ( true ) 
end
addCommandHandler ( "custom", activateMenu )
bindKey ( "F2", "down", activateMenu )

function clickedButtonCheck ( element )
	if source == applyButton then  
		incredibleTable = {	--the order is mixed because i sorted GUI menu better than type listings in code
			[0] = { storedValue = guiGetText ( editA )
			},
			[1] = { storedValue = guiGetText ( editB )
			},
			[2] = { storedValue = guiGetText ( editC )
			},
			[3] = { storedValue = guiGetText ( editD )
			},
			[4] = { storedValue = guiGetText ( editQ )
			},
			[5] = { storedValue = guiGetText ( editP )
			},
			[6] = { storedValue = guiGetText ( editN )
			},
			[7] = { storedValue = guiGetText ( editO )
			},
			[8] = { storedValue = guiGetText ( editR )
			},
			[9] = { storedValue = guiGetText ( editS ) --Fat Stat
	  		},
			[10] = { storedValue = guiGetText ( editT ) --Muscle Stat
			}
		}
		triggerServerEvent ( "applyClothes", getLocalPlayer (), incredibleTable )
		outputChatBox ( "Now type /saveskin to save your entered values!" )
		elseif source == exitButton then
		guiSetVisible ( mainWindow, false )
		showCursor ( false ) 
	end 
	 
end
addEventHandler ( "onClientGUIClick", root, clickedButtonCheck )

function saveSettings()

	-- 3. same as the default table except with nil values
	local userSettings = {
			["Shirt"] = nil,
	        ["Hair"] = nil,
	        ["Pants"] = nil,
	        ["Shoes"] = nil,
			["Necklace"] = nil,
	        ["Watch"] = nil,
			["Glasses"] = nil,
	        ["Hat"] = nil,
	        ["ExtraCJSkins"] = nil,
	        ["FatStat"] = nil,
	        ["MuscleStat"] = nil
		-- etc
	}
	
	-- 4. this will get the data from the gui
	userSettings.shirt = guiGetText ( editA ) or defaultSettings.shirt
	userSettings.hair = guiGetText ( editB ) or defaultSettings.hair
	userSettings.pants = guiGetText ( editC ) or defaultSettings.pants
	userSettings.shoes = guiGetText ( editD ) or defaultSettings.shoes
	userSettings.necklace = guiGetText ( editQ ) or defaultSettings.hat
	userSettings.watch = guiGetText ( editP ) or defaultSettings.glasses
	userSettings.glasses = guiGetText ( editN ) or defaultSettings.necklace
	userSettings.hat = guiGetText ( editO ) or defaultSettings.watch
	userSettings.extracjskins = guiGetText ( editR ) or defaultSettings.extracjskins
	userSettings.fatstat = guiGetText ( editS ) or defaultSettings.fatstat
	userSettings.musclestat = guiGetText ( editT ) or defaultSettings.musclestat
	
	-- etc..
	
	saveSettingsToFile( userSettings )
end

function saveSettingsToFile ( settingsTable )
	local settingsFile = xmlLoadFile( "settings.xml" )
	if not settingsFile then
		outputChatBox ("There was a problem with saving the settings, try deleting settings.xml and rejoin!")
	end
	
	-- 5. get all children nodes in the file
	local shirtChild = xmlFindChild( settingsFile, "Shirt", 0 )
	local hairChild = xmlFindChild( settingsFile, "Hair", 0 )
	local pantsChild = xmlFindChild( settingsFile, "Pants", 0 )
	local shoesChild = xmlFindChild( settingsFile, "Shoes", 0 )
	local hatChild = xmlFindChild( settingsFile, "Hat", 0 )
	local glassesChild = xmlFindChild( settingsFile, "Glasses", 0 )
	local necklaceChild = xmlFindChild( settingsFile, "Necklace", 0 )
	local watchChild = xmlFindChild( settingsFile, "Watch", 0 )
	local extracjskinsChild = xmlFindChild( settingsFile, "ExtraCJSkins", 0 )
	local fatstatChild = xmlFindChild( settingsFile, "FatStat", 0 )
	local musclestatChild = xmlFindChild( settingsFile, "MuscleStat", 0 )
	-- etc..

	-- 6. set the new values
	xmlNodeSetValue( shirtChild, tostring( settingsTable.shirt ) )
	xmlNodeSetValue( hairChild, tostring( settingsTable.hair ) )
	xmlNodeSetValue( pantsChild, tostring( settingsTable.pants ) )
	xmlNodeSetValue( shoesChild, tostring( settingsTable.shoes ) )
	xmlNodeSetValue( hatChild, tostring( settingsTable.hat ) )
	xmlNodeSetValue( glassesChild, tostring( settingsTable.glasses ) )
	xmlNodeSetValue( necklaceChild, tostring( settingsTable.necklace ) )
	xmlNodeSetValue( watchChild, tostring( settingsTable.watch ) )
	xmlNodeSetValue( extracjskinsChild, tostring( settingsTable.extracjskins ) )
	xmlNodeSetValue( fatstatChild, tostring( settingsTable.fatstat ) )
	xmlNodeSetValue( musclestatChild, tostring( settingsTable.musclestat ) )
	-- etc..
	
	xmlSaveFile( settingsFile )
	xmlUnloadFile( settingsFile )
	outputChatBox ( "Settings saved!" )
end

addCommandHandler ( "saveskin", saveSettings )
function clickedButtonCheck ( element )
	if source == applyButton then  
		incredibleTable = {	--the order is mixed because i sorted GUI menu better than type listings in code
			[0] = { storedValue = guiGetText ( editA )
			},
			[1] = { storedValue = guiGetText ( editB )
			},
			[2] = { storedValue = guiGetText ( editC )
			},
			[3] = { storedValue = guiGetText ( editD )
			},
			[4] = { storedValue = guiGetText ( editQ )
			},
			[5] = { storedValue = guiGetText ( editP )
			},
			[6] = { storedValue = guiGetText ( editN )
			},
			[7] = { storedValue = guiGetText ( editO )
			},
			[8] = { storedValue = guiGetText ( editR )
			},
			[9] = { storedValue = guiGetText ( editS ) --Fat Stat
	  		},
			[10] = { storedValue = guiGetText ( editT ) --Muscle Stat
			}
		}
	end	
    end
	function sendSettings() 
		triggerServerEvent ( "applyClothes", getLocalPlayer (), incredibleTable )
	end
	addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), sendSettings )