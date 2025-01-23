Config = {}

-- General Settings
Config.ActionDuration = 5000 -- Time (ms) to perform actions (gather, process, sell)
Config.AdCheckInterval = 43200000 -- Time (ms) to check advertisement integrity

-- Farming Routes Configuration
Config.Routes = {
    Weed = {
        GatherLocation = vector3(1903.5, 4921.4, 48.8),
        ProcessLocation = vector3(2563.5, 4685.4, 33.1),
        SellLocation = vector3(-1172.2, -1571.4, 4.6),
        GatherItem = 'weed_buds',
        ProcessItem = 'weed',
        GatherAmount = {min = 1, max = 3},
        ProcessAmount = 5,
        SellPrice = {min = 200, max = 250},
        BlipColor = 2,
        BlipName = 'Weed Farming'
    },
    Wine = {
        GatherLocation = vector3(1958.5, 5171.5, 47.9),
        ProcessLocation = vector3(-1885.3, 2073.2, 140.9),
        SellLocation = vector3(-1514.2, -429.4, 35.4),
        GatherItem = 'grapes',
        ProcessItem = 'wine',
        GatherAmount = {min = 3, max = 5},
        ProcessAmount = 10,
        SellPrice = {min = 50, max = 80},
        BlipColor = 3,
        BlipName = 'Wine Production'
    },
    Iron = {
        GatherLocation = vector3(2954.5, 2788.2, 40.9),
        ProcessLocation = vector3(1028.4, -3101.5, 5.9),
        SellLocation = vector3(-534.3, -171.6, 38.2),
        GatherItem = 'iron_ore',
        ProcessItem = 'iron_bar',
        GatherAmount = {min = 2, max = 4},
        ProcessAmount = 5,
        SellPrice = {min = 100, max = 150},
        BlipColor = 4,
        BlipName = 'Iron Mining'
    }
}
