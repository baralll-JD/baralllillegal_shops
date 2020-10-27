-- FAIT PAR BARALLL#0439
-- Pour la communaute de BaralllDeveloppement
-- Le discord: https://discord.gg/wdZfsHd


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('baralll', 'main', RageUI.CreateMenu("Vendeur Illegal", "~h~Fait toi plaisir"))
RMenu.Add('baralll', 'mecanqiue', RageUI.CreateSubMenu(RMenu:Get('baralll', 'main'), "~r~Mecanique", "~h~Aucun soucis technique"))
RMenu.Add('baralll', 'blackmarket', RageUI.CreateSubMenu(RMenu:Get('baralll', 'main'), "~r~Marche Noir", "~h~Les bonnes affaires"))
RMenu.Add('baralll', 'lunete', RageUI.CreateSubMenu(RMenu:Get('baralll', 'main'), "~r~Casque", "~h~C'est bien d'avoir plusieurs vues"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('baralll', 'main'), true, true, true, function()

            RageUI.Button("~o~Mecanique", "~p~Made in China !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('baralll', 'mecanqiue'))

            RageUI.Button("~y~Marche Noir", "~p~Prend le bon object !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('baralll', 'blackmarket'))

            RageUI.Button("~o~Casque", "~p~Choisi ton casque !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('baralll', 'lunete'))

        end, function()
        end)

              RageUI.IsVisible(RMenu:Get('baralll', 'mecanqiue'), true, true, true, function()

            RageUI.Button("~p~Kit de reparation", "~b~Peur des crevaisons ?", {RightLabel = "~g~15000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('baralll:Buykit')
                end
            end)
        end, function()
        end)

              RageUI.IsVisible(RMenu:Get('baralll', 'blackmarket'), true, true, true, function()

                RageUI.Button("~p~Cagoule", "~b~C'est sur il ne va rien voir !", {RightLabel = "~g~50000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:Buycagoule')
                    end
                end)

            RageUI.Button("~b~Menotte", "~p~Serre pas trop !", {RightLabel = "~g~30000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:Buymenotte')
                    end
                end)

            RageUI.Button("~p~Corde", "~b~Tu veux attacher ton mouton ?", {RightLabel = "~g~20000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:Buyrope')
                    end
                end)


            RageUI.Button("~b~Pilule de oubli", "~p~Cette pilule trop violente ...", {RightLabel = "~g~70000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:Buypilule')
                    end
                end)

                        
            end, function()
            end, 1)
    


            RageUI.IsVisible(RMenu:Get('baralll', 'lunete'), true, true, true, function()

             RageUI.Button("~b~Casque Thermique", "~p~Detecte chaque personnemmmmm !", {RightLabel = "~g~60000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:BuyThermique')
                    end
                end)

            RageUI.Button("~p~Casque Nocturne", "~b~Voir le jour comme si c'�tait la nuit !", {RightLabel = "~g~45000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('baralll:BuyNocturne')
                    end
                end)


            end, function()
            end, 1)


            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = 1354.85 , y = -1690.65, z = 60.49, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                        message = "Appuyez sur [~b~E~w~] pour parler au ~b~Vendeur",
                        time_display = 1
                    })
                   -- ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour parler au ~b~Vendeur")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('baralll', 'main'), not RageUI.Visible(RMenu:Get('baralll', 'main')))
                    end
                end
            end
        end
    end)
