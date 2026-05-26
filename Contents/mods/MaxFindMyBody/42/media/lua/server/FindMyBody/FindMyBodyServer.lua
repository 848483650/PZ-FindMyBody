FindMyBodyServer = {
    findBodymarker = nil
}
local px, py = nil, nil

---@param player IsoPlayer
function OnPlayerDeath(player)
    FindMyBodyServer.reset()
    px = player:getX()
    py = player:getY()

    if FindMyBodyServer.findBodymarker == nil then
        FindMyBodyServer.findBodymarker = FindMyBodyServer.addMarker(px, py)
    end
end

function FindMyBodyServer.reset()
    if FindMyBodyServer.findBodymarker ~= nil then FindMyBodyServer.removeMarker(FindMyBodyServer.findBodymarker) end
    FindMyBodyServer.findBodymarker = nil
    px, py = nil, nil
end

function FindMyBodyServer.addMarker(x, y)
    local mapAPI = ISWorldMap_instance.mapAPI;
    local markers = mapAPI:getMarkersAPI()

    -- x y radius red green blue alp
    return markers:addGridSquareMarker(x, y, 0.5, 0, 255, 0, 0.5)
end


function FindMyBodyServer.removeMarker(marker)
    local mapAPI = ISWorldMap_instance.mapAPI;
    local markers = mapAPI:getMarkersAPI();
    markers:removeMarker(marker);
end
Events.OnPlayerDeath.Add(OnPlayerDeath)