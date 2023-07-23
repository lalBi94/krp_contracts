-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 12/07/2023 at 07:38
-- Name: krp_contracts/client/cl_uiFn

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--
    
ZODWorks = exports["ZODWorks"]:getSharedObject()

Citizen.CreateThread(function()
    while(onFocus) do
        Citizen.Wait(0)
        DisableControlAction(0, 142, onFocus)
        DisableControlAction(0, 18, onFocus)
        DisableControlAction(0, 322, onFocus)
        DisableControlAction(0, 106, onFocus)
    end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false, "contract_travail")
    SetDisplay(false, "editor_travail")
end)

RegisterNUICallback("discord", function(data)
    ZODWorks.Player:notify(Locales.discord[CurrentLocale])
end)

RegisterNUICallback("refuse", function(data)
    if(data.haveAccept == "no") then
        ZODWorks.Player:notify(Locales.KRPContracts.contract.refuse[CurrentLocale])
    else
        ZODWorks.Player:notify(Locales.KRPContracts.editor.no[CurrentLocale])
    end

    SetDisplay(false, "contract_travail")
    SetDisplay(false, "editor_travail")
end)

RegisterNUICallback("accept", function(data)
    if(data.haveAccept == "yes") then
        ZODWorks.KRPContracts:asignJob({
            name = data.job_name, label = data.job_label
        })

        ZODWorks.Player:notify(Locales.KRPContracts.contract.accept[CurrentLocale])
        SetDisplay(false, "contract_travail")
        SetDisplay(false, "editor_travail")
    else
        local nearPlayer = ZODWorks.Game:getClosestPlayer(1.5)
        ZODWorks.KRPContracts:sendContract(nearPlayer, data)
        ZODWorks.Player:notify(Locales.KRPContracts.editor.yes[CurrentLocale])
        SetDisplay(false, "contract_travail")
        SetDisplay(false, "editor_travail")
    end
end)

---Display the UI interface.
---@param bool boolean Set true for active.
---@param mode? string 2 choices, editor contracts or contracts
---@param data? table Data from editor
function SetDisplay(bool, mode, data)
    onFocus = bool
    SetNuiFocus(bool, bool)

    SendNUIMessage({
        type = "ui",
        status = bool,
        mode = mode or nil,
        data = data or nil
    })
end