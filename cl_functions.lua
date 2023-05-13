Total = function()
    local total = 0
    for _,v in pairs(RZS.Basket) do
        total = total + (v.price)
    end
    return total
end

Contains = function(table, element)
    for _, value in pairs(table) do
        if value.name == element then
            return true
        end
    end
    return false
end

DrawMaker = function(coords)
    DrawMarker(6, coords.x, coords.y, coords.z-0.97, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 255, 255, 150, false, false, 2,  false, nil, false)
    DrawMarker(1, coords.x, coords.y, coords.z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 255, 255, 255, 150, false, false, 2,  false, nil, false)
end

CheckPPACategorie = function(a, b)
    if a == true and b == false then
        return false
    else
        return true
    end
end
