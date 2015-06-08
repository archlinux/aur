--[[-- This file shows examples of settings you can adjust.

Configuration files with preferences are loaded in the following order:
1. cfg/user.lua (system-wide configuration)
2. HOME/.zbstudio/user.lua (per-user configuration)
3. -cfg <lua code fragment|filename> (command line configuration)

See [configuration](http://studio.zerobrane.com/doc-configuration.html) page for information about location of configuration files.

--]]--

-- to specify full path to lua interpreter if you need to use your own version
path.lua = '/usr/bin/lua'
path.lua52 = '/usr/bin/lua'
