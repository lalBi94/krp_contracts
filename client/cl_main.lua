-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 12/07/2023 at 07:36
-- Name: krp_contracts/client/cl_main.lua

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
    print("^5?^1--------------------------------------^5?")
    print("^1| Script: ^5krp_contracts                ^1|")
    print("^1| ^7Author: bilaaaaaaaaaal (General ^3Zod^7) ^1|")
    print("^1| ^2Powered ^3by ZODWorks                  ^1|")
    print("^5?^1--------------------------------------^5?^7")
end)

RegisterNetEvent("zod::receiveContract", function(data)
    SetDisplay(true, "contract_travail", data)
end)

RegisterNetEvent("zod::jobSucces", function(data) 
    if(data) then
        ZODWorks.Player:notify((Locales.KRPContracts.jobSucces.yes[CurrentLocale]):format(data))
    else
        ZODWorks.Player:notify(Locales.KRPContracts.jobSucces.no[CurrentLocale])
    end
end)

RegisterCommand("contrat", function(a, r, raw)
    local job = ZODWorks.Player:getJob()
    local target = ZODWorks.Game:getClosestPlayer(2)

    if(not target) then
        ZODWorks.Player:notify(Locales.KRPContracts.noPlayer[CurrentLocale])
    elseif job.grade >= 3 then
        SetDisplay(true, "editor_travail", {
            job_name = job.name, 
            job_label = job.label
        })
    else
        ZODWorks.Player:notify(Locales.KRPContracts.permission[CurrentLocale])
    end
end, false)