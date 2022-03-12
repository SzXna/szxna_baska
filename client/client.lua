local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
    local coords = GetEntityCoords(PlayerPedId())
	local id = GetPlayerServerId(PlayerId())
			if GetDistanceBetweenCoords(coords, 306.49, -594.85, 43.28, true) < 5 then
				DrawText3DTest(306.49, -594.85, 43.28, '~w~[~p~E~w~] Opieka medyczna', 0.3)
			end
			if GetDistanceBetweenCoords(coords, 351.51, -588.41, 28.8, true) < 5 then
				DrawText3DTest(351.51, -588.41, 28.8, '~w~[~p~E~w~] Opieka medyczna', 0.3)
			end
			
  end
end)

function DrawText3DTest(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 55)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 68)
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x, _y)
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
				if GetDistanceBetweenCoords(coords, 306.49, -594.85, 43.28, true) < 1 then
					ESX.ShowHelpNotification('Nacisnij ~INPUT_CONTEXT~ aby korzystać z opieki medycznej za $' .. config.price)
					if IsControlJustReleased(0, Keys['E']) then
						if (GetEntityHealth(PlayerPedId()) < 200) then
							exports['progressBars']:startUI(5000, "Leczenie twojego ciała")
							Citizen.Wait(5000)
							TriggerServerEvent('szxna:leczenie', source)
						else
							ESX.ShowNotification('Nie możesz korzystać z opieki medycznej bo jesteś zdrowy')
						end
					end
				end
				if GetDistanceBetweenCoords(coords, 351.51, -588.41, 28.8, true) < 1 then
					ESX.ShowHelpNotification('Nacisnij ~INPUT_CONTEXT~ aby korzystać z opieki medycznej za $' .. config.price)
					if IsControlJustReleased(0, Keys['E']) then
						if (GetEntityHealth(PlayerPedId()) < 200) then
							exports['progressBars']:startUI(5000, "Leczenie twojego ciała")
							Citizen.Wait(5000)
							TriggerServerEvent('szxna:leczenie', source)
						else
							ESX.ShowNotification('Nie możesz korzystać z opieki medycznej bo jesteś zdrowy')
						end
					end
				end
	end
end)