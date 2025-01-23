ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Start an action (gather, process, sell)
RegisterServerEvent('nxcqu_farming:startAction')
AddEventHandler('nxcqu_farming:startAction', function(action, route)
    local xPlayer = ESX.GetPlayerFromId(source)
    local routeConfig = Config.Routes[route]

    if action == 'gather' then
        local amount = math.random(routeConfig.GatherAmount.min, routeConfig.GatherAmount.max)
        xPlayer.addInventoryItem(routeConfig.GatherItem, amount)
        TriggerClientEvent('esx:showNotification', source, _U('item_collected', amount, routeConfig.GatherItem))
    elseif action == 'process' then
        local itemCount = xPlayer.getInventoryItem(routeConfig.GatherItem).count
        if itemCount >= routeConfig.ProcessAmount then
            xPlayer.removeInventoryItem(routeConfig.GatherItem, routeConfig.ProcessAmount)
            xPlayer.addInventoryItem(routeConfig.ProcessItem, 1)
            TriggerClientEvent('esx:showNotification', source, _U('item_processed', routeConfig.ProcessItem))
        else
            TriggerClientEvent('esx:showNotification', source, _U('not_enough_items'))
        end
    elseif action == 'sell' then
        local itemCount = xPlayer.getInventoryItem(routeConfig.ProcessItem).count
        if itemCount > 0 then
            local price = math.random(routeConfig.SellPrice.min, routeConfig.SellPrice.max) * itemCount
            xPlayer.removeInventoryItem(routeConfig.ProcessItem, itemCount)
            xPlayer.addMoney(price)
            TriggerClientEvent('esx:showNotification', source, _U('item_sold', itemCount, routeConfig.ProcessItem, price))
        else
            TriggerClientEvent('esx:showNotification', source, _U('nothing_to_sell'))
        end
    end
end)

RegisterServerEvent('nxcqu_farming:checkAd')
AddEventHandler('nxcqu_farming:checkAd', function(adExists)
    if not adExists then
        TriggerClientEvent('nxcqu_farming:blockClient', source, _U('ad_removed'))
    end
end)
