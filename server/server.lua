ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('szxna:leczenie')
AddEventHandler('szxna:leczenie', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= config.price then
		xPlayer.removeMoney(config.price)
		TriggerClientEvent('esx:showNotification', source, 'Zapłaciłeś za leczenie $' .. config.price)
		TriggerClientEvent('esx_ambulancejob:revive', source)
	else
		xPlayer.removeBank(config.price)
		TriggerClientEvent('esx:showNotification', source, 'Pobrano $' .. config.price .. ' z banku')
		TriggerClientEvent('esx_ambulancejob:revive', source)
	end
end)