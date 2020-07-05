#compdef tldr
#
# Zsh auto complete function for tldr
#

local state
_arguments \
{-l,--list}"[show all available pages]" \
{-p,--platform}"[show page from specific platform rather than autodetecting]:platforms:->platform" \
{-u,-c,--update}"[update, force retrieving latest copies of locally cached files]" \
": :->page"
case $state in
    (page)
        _values "Pages" $(tldr -l 2>/dev/null)
    ;;
    (platform)
        _values "Platforms" \
            'common[Common pages]' \
            'linux[Linux only pages]' \
            'osx[OS X only pages]' \
            'sunos[SunOS only pages]' \
            'windows[Windows only pages]'
    ;;
    (*) true
    ;;
esac
