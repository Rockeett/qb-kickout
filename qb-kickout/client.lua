QBCore = nil

Citizen.CreateThread(function() 
    while QBCore == nil do
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
        Citizen.Wait(200)
    end
end)

-- code

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local ped = PlayerPedId(-1)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local vehicleClass = GetVehicleClass(vehicle)
		local playerSeat = GetLastPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
		local PlayerJob = QBCore.Functions.GetPlayerData().job

    	if PlayerJob.name ~= "police" or PlayerJob.name ~= "ambulance" or PlayerJob.name ~= "mechanic" then  

			if GetVehicleClass(vehicle) == 18 then
				if GetLastPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1) == true then

					if IsPedInAnyVehicle(PlayerPedId(-1), true) then
						TaskLeaveVehicle(ped, vehicle, 64)
						SetVehicleDoorsLocked(vehicle, 2)
						QBCore.Functions.Notify('Are you a cop? dickhead..', 'error')
						Citizen.Wait(1500)
					end
				end
			end
		end
	end
end)
