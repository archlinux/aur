local git_ref = '72658cc5d8e0d48ef323d0cd16ad2a95bbc4954d'
local modrev = 'scm'
local specrev = '1'

local repo_url = 'https://git.ignore.pl/lua-dottify'

rockspec_format = '3.0'
package = 'dottify'
version = modrev .. '-' .. specrev

description = {
    summary = 'generate a graphviz graph from a lua table structure',
    detailed = '',
    labels = { 'lua' },
    homepage = 'https://git.ignore.pl/lua-dottify',
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
        lua = {
            dottify = 'dottify.lua'
        },
    },
}
