#!/usr/bin/env luajit

-- spinwheel - a terminal wheel spinner
-- license: GPL-3.0-or-later
-- https://codeberg.org/the-traveler/spinwheel

local config_dir  = os.getenv("HOME") .. "/.config/spinwheel"
local wheels_dir  = config_dir .. "/wheels"
local global_conf = config_dir .. "/spinwheel.conf"

math.randomseed(os.time() * 1000 + math.floor(os.clock() * 1000000))
for _ = 1, 5 do math.random() end

------------------------------------------------------------------------
-- UTILS
------------------------------------------------------------------------

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

local function iwrite(s)
    io.write(s)
    io.flush()
end

local function cmd_exists(cmd)
    return os.execute("command -v " .. cmd .. " > /dev/null 2>&1") == 0
end

------------------------------------------------------------------------
-- DISTRO DETECTION
------------------------------------------------------------------------

local DISTRO_MAP = {
    arch="arch", manjaro="arch", endeavouros="arch", cachyos="arch",
    garuda="arch", artix="arch", arcolinux="arch", blackarch="arch",
    debian="debian", ubuntu="debian", linuxmint="debian",
    ["linux mint"]="debian", pop="debian", elementary="debian",
    zorin="debian", kali="debian", parrot="debian", devuan="debian",
    mxlinux="debian", antix="debian", ["mx linux"]="debian",
    raspbian="debian", lmde="debian",
    fedora="fedora", rhel="fedora", centos="fedora",
    rocky="fedora", almalinux="fedora",
    ["opensuse-tumbleweed"]="opensuse", ["opensuse-leap"]="opensuse",
    opensuse="opensuse", sles="opensuse",
    gentoo="gentoo", calculate="gentoo", funtoo="gentoo",
    void="void", alpine="alpine", nixos="nixos",
}

local INSTALL_CMD = {
    arch="sudo pacman -S", debian="sudo apt install",
    fedora="sudo dnf install", opensuse="sudo zypper install",
    gentoo="sudo emerge", void="sudo xbps-install",
    alpine="sudo apk add", nixos="nix-env -iA nixpkgs.",
}

local function detect_distro()
    local f = io.open("/etc/os-release", "r")
    if not f then return nil end
    local id, id_like
    for line in f:lines() do
        local k, v = line:match('^([%w_]+)%s*=%s*"?([^"]*)"?')
        if k and v then
            if k == "ID"      then id      = v:lower() end
            if k == "ID_LIKE" then id_like = v:lower() end
        end
    end
    f:close()
    if id and DISTRO_MAP[id] then return DISTRO_MAP[id] end
    if id_like then
        for word in id_like:gmatch("%S+") do
            if DISTRO_MAP[word] then return DISTRO_MAP[word] end
        end
    end
    return nil
end

------------------------------------------------------------------------
-- WHEEL
------------------------------------------------------------------------

local function draw_wheel(options, highlighted)
    print(string.rep("-", 44))
    for i, opt in ipairs(options) do
        if i == highlighted then
            print(">>> " .. opt .. " <<<")
        else
            print("    " .. opt)
        end
    end
    print(string.rep("-", 44))
end

local function spin(options)
    local steps = math.random(25, 55)
    local current = math.random(1, #options)
    for i = 1, steps do
        clear()
        print("\n           |\n           v\n")
        draw_wheel(options, current)
        sleep(0.02 + (i / steps) * 0.18)
        current = (current % #options) + 1
    end
    clear()
    print("\n           |\n           v\n")
    draw_wheel(options, current)
    print("\nresult: " .. options[current]:upper() .. "\n")
    return options[current]
end

local function prompt_items()
    print("enter items separated by commas:")
    iwrite("> ")
    local input = io.read()
    if not input or trim(input) == "" then
        print("no items entered. exiting.")
        os.exit(1)
    end
    local opts = {}
    for item in input:gmatch("[^,]+") do
        local t = trim(item)
        if t ~= "" then table.insert(opts, t) end
    end
    if #opts < 2 then
        print("need at least 2 items.")
        os.exit(1)
    end
    return opts, input
end

local function temp_spin()
    local opts, _ = prompt_items()
    iwrite("press enter to spin")
    io.read()
    spin(opts)
end

local function parse_opts_line(line)
    local val = line:match('^OPTS%s*=%s*"(.+)"')
    if not val then return nil end
    local opts = {}
    for item in val:gmatch("[^,]+") do
        local t = trim(item)
        if t ~= "" then table.insert(opts, t) end
    end
    return #opts > 0 and opts or nil
end

local function wheel_path(name)
    return wheels_dir .. "/" .. name .. "-wheel.conf"
end

local function load_wheel(name)
    local path = wheel_path(name)
    local f = io.open(path, "r")
    if not f then print("no wheel found: " .. path) os.exit(1) end
    local opts
    for line in f:lines() do
        opts = parse_opts_line(line)
        if opts then break end
    end
    f:close()
    if not opts then print("wheel has no OPTS entry: " .. path) os.exit(1) end
    return opts
end

local function save_wheel(name, raw_input)
    os.execute('mkdir -p "' .. wheels_dir .. '"')
    local path = wheel_path(name)
    local f = io.open(path, "w")
    if not f then print("could not write to " .. path) os.exit(1) end
    f:write('OPTS="' .. raw_input .. '"\n')
    f:close()
    print("saved to " .. path)
end

------------------------------------------------------------------------
-- MODE: BPM-MATCH
-- spin a wheel of BPM values, then beat at the result.
-- spinwheel -m bpm-match          -> prompt for BPM values, spin, beat
-- spinwheel wheelname -m bpm-match -> load named wheel, spin, beat
------------------------------------------------------------------------

local function detect_player()
    if cmd_exists("pw-play") then return "pw-play" end
    if cmd_exists("paplay")  then return "paplay"  end
    return nil
end

local function check_audio_dep()
    local distro = detect_distro()
    if not distro then return end
    local dep_names = {
        arch="pipewire", debian="pipewire", opensuse="pipewire",
        fedora="pipewire", gentoo="media-video/pipewire",
        void="pipewire", alpine="pipewire", nixos="pipewire",
    }
    local dep = dep_names[distro]
    if not dep then return end
    if not detect_player() then
        print("bpm-match audio requires pipewire or pulseaudio.")
        iwrite("install " .. dep .. " now? [y/N]: ")
        local ans = trim(io.read()):lower()
        if ans == "y" then
            local cmd = INSTALL_CMD[distro]
            if distro == "nixos" then
                os.execute(cmd .. dep)
            else
                os.execute(cmd .. " " .. dep)
            end
        end
    end
end

local function run_metronome(bpm, audiofile)
    local interval = 60 / bpm
    local beat = 0
    local start = os.clock()

    if audiofile and audiofile ~= "" then
        check_audio_dep()
        local player = detect_player()
        if player then
            os.execute(player .. ' "' .. audiofile .. '" &')
        else
            print("warning: no audio player found.")
        end
    end

    clear()
    print("BPM: " .. bpm)
    print("interval: " .. string.format("%.3f", interval) .. "s per beat")
    print("q + enter to stop\n")

    -- set stdin non-blocking via stty
    os.execute("stty -echo -icanon min 0 time 0 2>/dev/null")

    while true do
        beat = beat + 1
        io.write("\027[7m  BEAT " .. beat .. "  \027[0m\r")
        io.flush()

        -- check for q keypress during the beat
        local key = io.read(1)
        if key and key:lower() == "q" then
            os.execute("stty echo icanon 2>/dev/null")
            os.exit(0)
        end

        sleep(interval * 0.1)
        io.write(string.rep(" ", 20) .. "\r")
        io.flush()

        key = io.read(1)
        if key and key:lower() == "q" then
            os.execute("stty echo icanon 2>/dev/null")
            os.exit(0)
        end

        sleep(interval * 0.9)
    end

    -- restore terminal
    os.execute("stty echo icanon 2>/dev/null")
end

local function mode_bpm_match(wheel_name)
    local opts

    if wheel_name then
        opts = load_wheel(wheel_name)
    else
        print("enter BPM values to spin (e.g. 120, 140, 180, 200):")
        local opts2, _ = prompt_items()
        opts = opts2
    end

    -- validate all entries are numeric BPMs
    for _, v in ipairs(opts) do
        local n = tonumber(v)
        if not n or n <= 0 then
            print("spinwheel: '" .. v .. "' is not a valid BPM.")
            os.exit(1)
        end
    end

    iwrite("audio file path (enter to skip): ")
    local audiofile = trim(io.read())

    iwrite("press enter to spin")
    io.read()

    local result = spin(opts)
    local bpm = tonumber(result)

    print("beating at " .. bpm .. " BPM...")
    sleep(1)

    run_metronome(bpm, audiofile)
end

------------------------------------------------------------------------
-- MODE: CMD
------------------------------------------------------------------------

local DANGEROUS_CMDS = {
    "rm","rmdir","wipefs","dd","mkfs","fdisk","gdisk","parted",
    "shred","wipe","mkswap","swapoff","umount","kill","killall",
    "pkill","shutdown","reboot","halt","poweroff","chmod","chown",
    "truncate","overwrite","blkdiscard","sgdisk","cfdisk","sfdisk",
    "partprobe","dmsetup","cryptsetup",
}

local function is_dangerous(cmd)
    local binary = cmd:match("^%s*(%S+)")
    if not binary then return false end
    binary = binary:match("([^/]+)$") or binary
    for _, d in ipairs(DANGEROUS_CMDS) do
        if binary == d then return true end
    end
    return false
end

local function mode_cmd()
    print("cmd mode: enter commands separated by commas.")
    print("WARNING: selected command will be run with sudo.\n")
    iwrite("commands: ")
    local input = io.read()
    if not input or trim(input) == "" then print("no commands.") os.exit(1) end

    local cmds = {}
    for item in input:gmatch("[^,]+") do
        local t = trim(item)
        if t ~= "" then table.insert(cmds, t) end
    end
    if #cmds < 2 then print("need at least 2 commands.") os.exit(1) end

    local result = spin(cmds)
    print("selected: sudo " .. result)

    if is_dangerous(result) then
        print("")
        print("  !! WARNING: this command is potentially destructive !!")
        print("")
        print("  to continue, type exactly:")
        print("  I promise i won't sue you lol")
        print("")
        iwrite("> ")
        local confirm = io.read()
        if trim(confirm) ~= "I promise i won't sue you lol" then
            print("confirmation failed. aborted.")
            os.exit(0)
        end
    else
        iwrite("continue? [y/N]: ")
        if trim(io.read()):lower() ~= "y" then
            print("aborted.")
            os.exit(0)
        end
    end

    os.execute("sudo " .. result)
end

------------------------------------------------------------------------
-- MODE: RIGGED
------------------------------------------------------------------------

local function mode_rigged()
    local opts, _ = prompt_items()
    print("\nrigged mode: pick the winner.")
    for i, v in ipairs(opts) do print(i .. ". " .. v) end
    iwrite("winner number: ")
    local choice = tonumber(io.read())
    if not choice or not opts[choice] then print("invalid choice.") os.exit(1) end

    local winner = opts[choice]
    local steps = math.random(25, 55)
    local current = math.random(1, #opts)

    iwrite("\npress enter to spin (totally random btw)")
    io.read()

    for i = 1, steps - 1 do
        clear()
        print("\n           |\n           v\n")
        draw_wheel(opts, current)
        sleep(0.02 + (i / steps) * 0.18)
        current = (current % #opts) + 1
    end

    clear()
    print("\n           |\n           v\n")
    draw_wheel(opts, choice)
    print("\nresult: " .. winner:upper())
    print("(totally random. definitely.)\n")
end

------------------------------------------------------------------------
-- MODE: GAMBLING
------------------------------------------------------------------------

local function mode_gambling()
    local symbols = {
        { name="7",      glyph="7"       },
        { name="dollar", glyph="💶"  },
        { name="star",   glyph="⭐"   },
        { name="heart",  glyph="❤"   },
        { name="bolt",   glyph="⚡"   },
        { name="bomb",   glyph="💢"   },
        { name="gift",   glyph="🎫"   },
    }

    local credits = 10
    print("SLOT MACHINE  🎰")
    print("starting credits: " .. credits)
    print("cost: 1 | pair = +2 | match 3 = +10 | 777 = +50\n")

    while credits > 0 do
        print("credits: " .. credits)
        iwrite("press enter to spin (q to quit): ")
        if trim(io.read()):lower() == "q" then break end
        credits = credits - 1

        local r1, r2, r3
        for i = 1, 20 do
            r1 = symbols[math.random(1, #symbols)]
            r2 = symbols[math.random(1, #symbols)]
            r3 = symbols[math.random(1, #symbols)]
            clear()
            print("SLOT MACHINE  🎰 | credits: " .. credits .. "\n")
            print(string.rep("=", 37))
            print(string.format("|  %-10s |  %-10s |  %-10s |",
                r1.glyph, r2.glyph, r3.glyph))
            print(string.rep("=", 37))
            sleep(0.05 + (i / 20) * 0.1)
        end

        r1 = symbols[math.random(1, #symbols)]
        r2 = symbols[math.random(1, #symbols)]
        r3 = symbols[math.random(1, #symbols)]

        clear()
        print("SLOT MACHINE  🎰 | credits: " .. credits .. "\n")
        print(string.rep("=", 37))
        print(string.format("|  %-10s |  %-10s |  %-10s |",
            r1.glyph, r2.glyph, r3.glyph))
        print(string.rep("=", 37) .. "\n")

        if r1.name == "7" and r2.name == "7" and r3.name == "7" then
            credits = credits + 50
            print("🎰  7 7 7  🎰  MEGA JACKPOT! +50 credits!")
        elseif r1.name == r2.name and r2.name == r3.name then
            credits = credits + 10
            print("⭐  JACKPOT! +10 credits!")
        elseif r1.name == r2.name or r2.name == r3.name or r1.name == r3.name then
            credits = credits + 2
            print("match! +2 credits.")
        else
            print("no match.")
        end
        print("")
    end

    if credits <= 0 then
        print("out of credits. game over.")
    else
        print("cashed out with " .. credits .. " credits.")
        print("(credits are not real)")
    end
end

------------------------------------------------------------------------
-- ARG PARSING
------------------------------------------------------------------------

local args        = arg or {}
local mode        = nil
local wheel_name  = nil
local remaining   = {}

local i = 1
while i <= #args do
    if args[i] == "-m" or args[i] == "--mode" then
        i = i + 1
        mode = args[i]
    else
        table.insert(remaining, args[i])
    end
    i = i + 1
end

-- clean exit on ctrl+c
local ok, _ = pcall(function()

    if mode then
        -- check if a wheel name was also passed
        if #remaining > 0 and remaining[1] ~= "--new" then
            wheel_name = remaining[1]
        end

        if mode == "bpm-match" then
            mode_bpm_match(wheel_name)
        elseif mode == "cmd" then
            mode_cmd()
        elseif mode == "rigged" then
            mode_rigged()
        elseif mode == "gambling" then
            mode_gambling()
        else
            print("spinwheel: unknown mode '" .. mode .. "'")
            print("available modes: bpm-match, cmd, rigged, gambling")
            os.exit(1)
        end

    elseif #remaining == 0 then
        temp_spin()

    elseif remaining[1] == "--new" then
        local name = remaining[2]
        if not name or trim(name) == "" then
            print("usage: spinwheel --new <n>")
            os.exit(1)
        end
        local opts, raw = prompt_items()
        save_wheel(name, raw)
        print("")
        iwrite("press enter to spin")
        io.read()
        spin(opts)

    else
        local opts = load_wheel(remaining[1])
        iwrite("press enter to spin")
        io.read()
        spin(opts)
    end

end)

-- restore terminal on any exit (ctrl+c or error)
os.execute("stty echo icanon 2>/dev/null")
if not ok then os.exit(0) end
