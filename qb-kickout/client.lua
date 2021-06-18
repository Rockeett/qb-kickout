QBCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- kick car stealing cunts out of cop cars

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)

		local ped = PlayerPedId(-1)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local vehicleClass = GetVehicleClass(vehicle)
		local driver = GetPedInVehicleSeat(vehicle, -1)
		PlayerJob = QBCore.Functions.GetPlayerData().job

    	if PlayerJob.name ~= "police" or PlayerJob.name ~= "ambulance" or PlayerJob.name ~= "mechanic" then  

			if GetVehicleClass(vehicle) == 18 then
				if IsPedInAnyVehicle(PlayerPedId(-1), true) then

					TaskLeaveVehicle(ped, vehicle, 64)
					SetVehicleDoorsLocked(vehicle, 2)
					QBCore.Functions.Notify('You are not allowed to drive this vehicle', 'error')
					Citizen.Wait(500)
				end
			end
		end
	end
end)