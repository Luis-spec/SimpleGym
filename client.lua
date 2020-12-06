
local isNearExersices = false
local isAtExersice = false
local isTraining = false



Citizen.CreateThread(function()

	if Config.EnableBlip then
		local blip = AddBlipForCoord( Config.MapBlip.Pos.x,  Config.MapBlip.Pos.y,  Config.MapBlip.Pos.z)
		SetBlipSprite (blip,  Config.MapBlip.Sprite)
		SetBlipDisplay(blip,  Config.MapBlip.Display)
		SetBlipScale  (blip,  Config.MapBlip.Scale)
		SetBlipColour (blip,  Config.MapBlip.Colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.MapBlip.Name)
		EndTextCommandSetBlipName(blip)
	end

	while true do
		Citizen.Wait(350)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)

		isNearExersices = false
		isAtExersice = false

		for k, v in pairs(Config.Exersices) do
			local distance = Vdist(playerCoords, v.x, v.y, v.z)
			if distance < 20.0 then
				isNearExersices = true
			end
			if distance < 0.6 then
				isAtExersice = true
				currentExersice = v
			end
		end
		
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isNearExersices then
			for k, v in pairs(Config.Exersices) do
				DrawMarker(21, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 55, 55, 0, 0, 0, 0)
			end
		end

		if isAtExersice then
			if not isTraining then
				showInfobar(Config.ExersiceString .. '~y~' .. currentExersice.type)
			else
				showInfobar(Config.AbortString)
			end
			
			if IsControlJustReleased(0, Config.ExersiceKey) then
				
				if isTraining then
					isTraining = false	
					ClearPedTasksImmediately(PlayerPedId())
					ShowNotification(Config.FinishString)
				else
					if currentExersice.type == 'chins' then
						SetEntityCoords(PlayerPedId(), currentExersice.fixedChinPos.x, currentExersice.fixedChinPos.y, currentExersice.fixedChinPos.z - 1)
						SetEntityHeading(PlayerPedId(), currentExersice.fixedChinPos.rot)
					end
					isTraining = true
					TaskStartScenarioInPlace(PlayerPedId(), currentExersice.scenario, 0, true)
					--workOut()
				end
				
			end
		end
	end
end)

--[[function workOut()
	Citizen.Wait(Config.ExersiceDuration * 1000)
	ClearPedTasksImmediately(PlayerPedId())
	ShowNotification(Config.FinishString)
	isTraining = false
end--]]

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end