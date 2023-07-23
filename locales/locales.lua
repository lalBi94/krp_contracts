-- Author: General Zod (Owner)
-- Discord: bilaaaaaaaaaal
-- Date: written on 12/07/2023 at 07:40
-- Name: krp_contracts/locales/locales

--[[
    Non-Commercial Script License
    This script is licensed under the Non-Commercial Script License. You are free to use, copy, and modify 
    the script for non-commercial purposes only. You may not use this script or any derivative works for 
    commercial purposes, including but not limited to selling or distributing the script for a profit. 
    Any commercial use or sale of this script requires the express written permission of the author.
    THIS SCRIPT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT 
    LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
]]--

CurrentLocale = "fr"
Locales = {}
Locales.KRPContracts = {}

Locales.discord = {
    ["fr"] = "Lien vers le discord copie dans le presse papier !",
    ["en"] = "Discord's link copied in clipboard!"
}

Locales.KRPContracts.noPlayer = {
    ["fr"] = "~r~Rapporchez-vous d'un joueur !",
    ["en"] = "~r~No player around of you!"
}

Locales.KRPContracts.permission = {
    ["fr"] = "~r~Vous n'avez pas les priviliges necessaire pour recruter un joueur !",
    ["en"] = "~r~You don't have the permission to do contract!"
}

Locales.KRPContracts.jobSucces = {
    yes = {
        ["fr"] = "~g~Vous venez de rejoindre %s !", 
        ["en"] = "~g~You joined %s!"
    }, no = {
        ["fr"] = "~r~Vous faites deja parti de l'entreprise !",
        ["en"] = "~r~You already work for this compagny! !"
    }
}

Locales.KRPContracts.contract = {
    refuse = {
        ["fr"] = "~r~Contrat de travail refusé !",
        ["en"] = "~r~Contract refused!"
    }, accept = {
        ["fr"] = "~g~Contrat de travail accepté !",
        ["en"] = "~g~Contract accept!"
    }
}

Locales.KRPContracts.editor = {
    yes = {
        ["fr"] = "~g~Vous avez envoye le contrat !",
        ["en"] = "~g~Your send the contract!"
    }, no = {
        ["fr"] = "~r~Vous avez quitter l'editeur de contrat !",
        ["en"] = "~r~Your leave the contract editor!"
    }
}