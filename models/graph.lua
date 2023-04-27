Graph = {
    arests = {},
    g_type = ""
}



function Graph:new(path)
    if type(path) ~= "string" then
        print "Invalid Path"
        return nil
    end
    for l in io.lines(path) do
        if string.find(l, "undirected") or string.find(l, "directed") then
            self.g_type = string.gsub(l, "\n", "");
            goto EOL
        end
        local lineFormatted = string.gsub(l, " ", ""):gsub("\n", "");
        if self.arests[lineFormatted:sub(1,1)] == nil then
            self.arests[lineFormatted:sub(1,1)] = {}
        end
        table.insert(self.arests[lineFormatted:sub(1,1)], lineFormatted:sub(2,2))
        ::EOL::
    end
    return self;
end


local function contains(list, el)
    for _, element in ipairs(list) do
        if element == el then
            return true
        end
    end
    return false
end


function Graph:vertexes()
    local vtxs = {}
    for k, v in pairs(self.arests) do
        if not contains(vtxs, k) then
            table.insert(vtxs, k);
        end
        for _, el in ipairs(v) do
            if not contains(vtxs, el) then
                table.insert(vtxs, el)
            end
        end
    end
    return vtxs
end







