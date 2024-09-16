#!/usr/bin/evs -S nvim -l

local p = require("nvim-treesitter.parsers").get_parser_configs()
local sp = {}

for k,v in pairs(p) do
    table.insert(sp, { n = k, p = v })
end

table.sort(sp, function(a,b)
    return a.n < b.n
end)

local t = ""

for _,v in ipairs(sp) do
    local l = v.n

    if v.p.maintainers then
        t = t 
            .. 
            l 
            .. 
            "\n"
    end
end

f = io.open("langs.txt", "w")
f:write(t);
f:close()

vim.cmd "q"

