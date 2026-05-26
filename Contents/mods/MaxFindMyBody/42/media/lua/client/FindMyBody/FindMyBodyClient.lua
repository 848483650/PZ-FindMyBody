local ModOptions = require("FindMyBody/ModOptions")
local FindMyBodyServer = require("FindMyBody/FindMyBodyServer")

---@param key Integer
function OnKeyPressed(key)
    if key == ModOptions.KeyBindClear then
        local playerNum = getSpecificPlayer(0):getPlayerNum()
        local width, height = 350, 140
        local dialog = ISConfirmDialog:new(
        (getCore():getScreenWidth() / 2) - width / 2,
        (getCore():getScreenHeight() / 2) - height / 2,
        width, height, playerNum,
        function ()
            FindMyBodyServer.reset();
        end)
        dialog:initialise()
        dialog.moveWithMouse = true
        dialog:addToUIManager()
    end
end
Events.OnKeyPressed.Add(OnKeyPressed)