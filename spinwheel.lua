#!/usr/bin/env lua

-- spinwheel-empty - just a wheel. nothing else.
-- license: GPL-3.0-or-later

math.randomseed(os.time() + math.floor(os.clock() * 1000000))
math.random() math.random() math.random()

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local function sleep(t)
    local e = os.clock() + t
    while os.clock() < e do end
end

local function clear()
    io.write("\027[2J\027[H")
    io.flush()
end

-- get items
print("enter items separated by commas:")
io.write("> ")
io.flush()
local input = io.read()
if not input or trim(input) == "" then os.exit(1) end

local options = {}
for item in input:gmatch("[^,]+") do
    local t = trim(item)
    if t ~= "" then table.insert(options, t) end
end

if #options < 2 then
    print("need at least 2 items.")
    os.exit(1)
end

-- spin
io.write("press enter to spin")
io.flush()
io.read()

local steps = math.random(25, 55)
local current = math.random(1, #options)

for i = 1, steps do
    clear()
    print("\n           |\n           v\n")
    print(string.rep("-", 44))
    for j, opt in ipairs(options) do
        if j == current then
            print(">>> " .. opt .. " <<<")
        else
            print("    " .. opt)
        end
    end
    print(string.rep("-", 44))
    sleep(0.02 + (i / steps) * 0.18)
    current = (current % #options) + 1
end

clear()
print("\n           |\n           v\n")
print(string.rep("-", 44))
for j, opt in ipairs(options) do
    if j == current then
        print(">>> " .. opt .. " <<<")
    else
        print("    " .. opt)
    end
end
print(string.rep("-", 44))
print("\nresult: " .. options[current]:upper() .. "\n")
