local ModOptions = require("FindMyBody/ModOptions")

local FindMyBodyClient = {
}
local px, py, pz = nil, nil, nil
local marker = nil


function OnKeyPressed(key)
end

---@param player IsoPlayer
function OnPlayerDeath(player)
    px = player:getX()
    py = player:getY()
    pz = player:getZ()

    if ISWorldMap:isVisible() and marker == nil then
        marker = FindMyBodyClient.addMarker(px, py)
    end
end

function FindMyBodyClient.reset()
    if marker ~= nil then FindMyBodyClient.removeMarker(marker) end
    marker = nil
    px, py, pz = nil, nil, nil
end

function FindMyBodyClient.addMarker(x, y)
    local mapAPI = ISWorldMap.mapAPI
    local markers = mapAPI:getMarkersAPI()
    return markers:addGridSquareMarker(x, y, 0.1, 0, 0, 255, 0.5)
end

function FindMyBodyClient.removeMarker(marker)
        local mapAPI = ISWorldMap.mapAPI;
    local markers = mapAPI:getMarkersAPI();
    markers:removeMarker(marker);
end

Events.OnKeyPressed.Add(OnKeyPressed)
Events.OnPlayerDeath.Add(OnPlayerDeath)