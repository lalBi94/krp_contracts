-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 13/07/2023 at 01:50
-- Name: krp_contracts/AddOn/KRPContracts/SKRPContracts

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--
    
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("zod::sendContract", function(target, data) 
    TriggerClientEvent("zod::receiveContract", target, data)
end)

RegisterNetEvent("zod::asignJob", function(job) 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xJob = xPlayer.getJob()

    if(job and ESX.DoesJobExist(job.name, 0)) then
        if(xJob.name ~= job.name) then
	    xPlayer.setJob(job.name, 0)
            TriggerClientEvent("zod::jobSucces", _src, job.label)
        else
            TriggerClientEvent("zod::jobSucces", _src, nil)
        end
    end
end)