require("models.graph")


local g = Graph:new "graph.txt"

for _, el in ipairs(g.arests['a']) do
    print(el);
end


for _, el in ipairs(g.arests['c']) do
    print(el)
end

