local ModOptions = {
    KeyBindClear = Keyboard.KEY_C,
    KeyBindUpdate = Keyboard.KEY_U
}
local options = PZAPI.ModOptions:create("FindMyBody", getText("IGUI_ModOptions_FindMyBodyModName"))

---KEYBINDS
options:addDescription(getText("IGUI_ModOptions_FindMyBodyKeybindDesc"))
options:addKeyBind("FindMyBodyClearKey", getText("IGUI_ModOptions_FindMyBodyKeybind_Name"),ModOptions.KeyBindClear,"IGUI_ModOptions_FindMyBodyKeybind_Tooltip")

options:addKeyBind("FindMyBodyUpdateKey",getText("IGUI_ModOptions_FindMyBodyKeybindUpdate_Name"), ModOptions.KeyBindUpdate,"IGUI_ModOptions_FindMyBodyKeybindUpdate_Tooltip")

---This is a helper function that will automatically populate the "config" table.
---Retrieve each option from their `ID` with: `config.ID`
function options:apply()
    for k,v in pairs(self.dict) do
        if v.type == "multipletickbox" then
            ---@cast v umbrella.ModOptions.MultipleTickBox
            for i=1, #v.values do
                ModOptions[(k.."_"..tostring(i))] = v:getValue(i)
            end
        elseif v.type ~= "button" then
            ---@diagnostic disable-next-line
            ModOptions[k] = v:getValue()
        end
    end
end

---Init values
Events.OnMainMenuEnter.Add(function()
    options:apply()
end)

return ModOptions