-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 13/07/2023 at 01:50
-- Name: krp_contracts/AddOn/KRPContracts

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
ZODWorks.KRPContracts = {}

--- Send contract to a near player
---@param target number The id of the near player
---@param data table Data from editor contract
function ZODWorks.KRPContracts:sendContract(target, data)
    ZODWorks.Game:Trigger("zod::sendContract", target, data)
end

function ZODWorks.KRPContracts:asignJob(jobInfo)
    ZODWorks.Game:Trigger("zod::asignJob", jobInfo)
end

setmetatable(ZODWorks, { __index = ZODWorks.KRPContracts })