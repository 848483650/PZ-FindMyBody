require "ISUI/ISModalDialog"

ISConfirmDialog = ISModalDialog:derive("ISConfirmDialog")

function ISConfirmDialog:onClickCallback(button)
    if self.onYesCallback and button.internal == "YES" then
        self.onYesCallback()
    elseif self.onNoCallback and button.internal == "NO" then
        self.onNoCallback()
    end
end

function ISConfirmDialog:new(x, y, width, height, player, onYesCallback, onNoCallback)
    local obj = ISModalDialog:new(
        x, y, width, height, getText("UI_FindMyBody_ConfirmClear"), true, nil, ISConfirmDialog.onClickCallback, player, nil, nil)
    setmetatable(obj, self)
    self.__index = self;

    obj.onYesCallback = onYesCallback
    obj.onNoCallback = onNoCallback
    obj.target = obj

    return obj
end