local git_ref = '8ac84a37cbb00dd2defbcdade70cb07036323fb8'
local modrev = 'scm'
local specrev = '1'

local repo_url = 'https://github.com/Neopallium/LuaNativeObjects'

rockspec_format = '3.0'
package = 'native-objects'
version = modrev .. '-' .. specrev

description = {
    summary = 'A Lua bindings generator written in Lua',
    detailed = 'A Lua bindings generator written in Lua',
    labels = { 'lua' },
    homepage = 'https://github.com/Neopallium/LuaNativeObjects',
    license = 'GPL-3.0'
}

dependencies = { 'lua >= 5.1' }

test_dependencies = {}

source = {
    url = repo_url .. '/archive/' .. git_ref .. '.zip',
}

if modrev == 'scm' or modrev == 'dev' then
    source = {
        url = repo_url:gsub('^', 'git+')
    }
end

build = {
    type = 'builtin',
    install = {
        bin = {
            ["native_objects.lua"] = 'native_objects.lua'
        },
    },
}
