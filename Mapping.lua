local stringify = require(script.Parent.Stringify)

local Mapping = {}
      Mapping.__index = Mapping


function Mapping.new(mapping)
    mapping = mapping or {}

    return setmetatable({Internal = mapping}, Mapping)
end


function Mapping:__newindex(key, value)
    if self.Internal[key] then return end

    self.Internal[key] = value
end


function Mapping:__index(key)
    local internalFound = rawget(self, key)

    if internalFound then
        return internalFound
    end

    local internalMapping = rawget(self, "Internal")

    return internalMapping[key]
end


function Mapping:__tostring()
    local internalMapping = rawget(self, "Internal")

    return stringify(internalMapping)
end


return Mapping
