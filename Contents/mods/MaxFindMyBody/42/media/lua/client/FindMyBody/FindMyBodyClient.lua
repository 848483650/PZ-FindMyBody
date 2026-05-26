local ModOptions = require("FindMyBody/ModOptions")
FindMyBodyServer = require("FindMyBody/FindMyBodyServer")

---@param key Integer
function OnKeyPressed(key)
    if key == ModOptions.KeyBindClear and FindMyBodyServer.findBodymarker ~= nil then
        local playerNum = getSpecificPlayer(0):getPlayerNum()
        local width, height = 350, 140
        local dialog = ISConfirmDialog:new(
        (getCore():getScreenWidth() / 2) - width / 2,
        (getCore():getScreenHeight() / 2) - height / 2,
        width, height, playerNum,
        function ()
            FindMyBodyServer.reset();
            local player = getSpecificPlayer(0)
            player:Say(getText("IGUI_PlayerText_ClearMarker"))
        end)
        dialog:initialise()
        dialog.moveWithMouse = true
        dialog:addToUIManager()
    end
end
Events.OnKeyPressed.Add(OnKeyPressed)