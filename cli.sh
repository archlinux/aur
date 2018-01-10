#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.tools
# endregion
# region variables
# shellcheck disable=SC2034
bl_cli__doc__='
    This module provides variables for printing colorful and unicode glyphs.
    The Terminal features are detected automatically but can also be
    enabled/disabled manually (see
    [bl.cli.enable_color](#function-bl_cli_enable_color) and
    [bl.cli.enable_unicode_glyphs](#function-bl_cli_enable_unicode_glyphs)).
'
bl_cli_color_enabled=false
# endregion
# region functions
bl_cli_enable_color() {
    local __doc__='
        Enables color output explicitly.

        >>> bl.cli.disable_color
        >>> bl.cli.enable_color
        >>> echo -E $bl_cli_color_red red $bl_cli_color_default
        \033[0;31m red \033[0m
    '
    bl_cli_color_enabled=true
    bl_cli_color_default='\033[0m'

    bl_cli_color_black='\033[0;30m'
    bl_cli_color_red='\033[0;31m'
    bl_cli_color_green='\033[0;32m'
    bl_cli_color_yellow='\033[0;33m'
    bl_cli_color_blue='\033[0;34m'
    bl_cli_color_magenta='\033[0;35m'
    bl_cli_color_cyan='\033[0;36m'
    bl_cli_color_lightgray='\033[0;37m'

    bl_cli_color_darkgray='\033[0;90m'
    bl_cli_color_lightred='\033[0;91m'
    bl_cli_color_lightgreen='\033[0;92m'
    bl_cli_color_lightyellow='\033[0;93m'
    bl_cli_color_lightblue='\033[0;94m'
    bl_cli_color_lightmagenta='\033[0;95m'
    bl_cli_color_lightcyan='\033[0;96m'
    bl_cli_color_white='\033[0;97m'

    # flags
    bl_cli_color_bold='\033[1m'
    bl_cli_color_dim='\033[2m'
    bl_cli_color_underline='\033[4m'
    bl_cli_color_blink='\033[5m'
    bl_cli_color_invert='\033[7m'
    bl_cli_color_invisible='\033[8m'

    bl_cli_color_nobold='\033[21m'
    bl_cli_color_nodim='\033[22m'
    bl_cli_color_nounderline='\033[24m'
    bl_cli_color_noblink='\033[25m'
    bl_cli_color_noinvert='\033[27m'
    bl_cli_color_noinvisible='\033[28m'
}
alias bl.cli.enable_color='bl_cli_enable_color'
# shellcheck disable=SC2034
bl_cli_disable_color() {
    local __doc__='
        Disables color output explicitly.

        >>> bl.cli.enable_color
        >>> bl.cli.disable_color
        >>> echo -E "$bl_cli_color_red" red "$bl_cli_color_default"
        red
    '
    bl_cli_color_enabled=false
    bl_cli_color_default=''

    bl_cli_color_black=''
    bl_cli_color_red=''
    bl_cli_color_green=''
    bl_cli_color_yellow=''
    bl_cli_color_blue=''
    bl_cli_color_magenta=''
    bl_cli_color_cyan=''
    bl_cli_color_lightgray=''

    bl_cli_color_darkgray=''
    bl_cli_color_lightred=''
    bl_cli_color_lightgreen=''
    bl_cli_color_lightyellow=''
    bl_cli_color_lightblue=''
    bl_cli_color_lightmagenta=''
    bl_cli_color_lightcyan=''
    bl_cli_color_white=''

    # flags
    bl_cli_color_bold=''
    bl_cli_color_dim=''
    bl_cli_color_underline=''
    bl_cli_color_blink=''
    bl_cli_color_invert=''
    bl_cli_color_invisible=''

    bl_cli_color_nobold=''
    bl_cli_color_nodim=''
    bl_cli_color_nounderline=''
    bl_cli_color_noblink=''
    bl_cli_color_noinvert=''
    bl_cli_color_noinvisible=''
}
alias bl.cli.disable_color='bl_cli_disable_color'
## region glyphs
# NOTE: use 'xfd -fa <font-name>' to watch glyphs
bl_cli_unicode_enabled=false
bl_cli_enable_unicode_glyphs() {
    local __doc__='
        Enables unicode glyphs explicitly.

        >>> bl.cli.disable_unicode_glyphs
        >>> bl.cli.enable_unicode_glyphs
        >>> echo -E "$bl_cli_powerline_ok"
        \u2714
    '
    bl_cli_unicode_enabled=true
    bl_cli_powerline_pointingarrow='\u27a1'
    bl_cli_powerline_arrowleft='\ue0b2'
    bl_cli_powerline_arrowright='\ue0b0'
    bl_cli_powerline_arrowrightdown='\u2198'
    bl_cli_powerline_arrowdown='\u2b07'
    bl_cli_powerline_plusminus='\ue00b1'
    bl_cli_powerline_branch='\ue0a0'
    bl_cli_powerline_refersto='\u27a6'
    bl_cli_powerline_ok='\u2714'
    bl_cli_powerline_fail='\u2718'
    bl_cli_powerline_lightning='\u26a1'
    bl_cli_powerline_cog='\u2699'
    bl_cli_powerline_heart='\u2764'

    # colorful
    bl_cli_powerline_star='\u2b50'
    bl_cli_powerline_saxophone='\u1f3b7'
    bl_cli_powerline_thumbsup='\u1f44d'
}
alias bl.cli.enable_unicode_glyphs='bl_cli_enable_unicode_glyphs'
# shellcheck disable=SC2034
bl_cli_disable_unicode_glyphs() {
    local __doc__='
        Disables unicode glyphs explicitly.

        >>> bl.cli.enable_unicode_glyphs
        >>> bl.cli.disable_unicode_glyphs
        >>> echo -E "$bl_cli_powerline_ok"
        +
    '
    bl_cli_unicode_enabled=false
    bl_cli_powerline_pointingarrow='~'
    bl_cli_powerline_arrowleft='<'
    bl_cli_powerline_arrowright='>'
    bl_cli_powerline_arrowrightdown='>'
    bl_cli_powerline_arrowdown='_'
    bl_cli_powerline_plusminus='+-'
    bl_cli_powerline_branch='|}'
    bl_cli_powerline_refersto='*'
    bl_cli_powerline_ok='+'
    bl_cli_powerline_fail='x'
    bl_cli_powerline_lightning='!'
    bl_cli_powerline_cog='{*}'
    bl_cli_powerline_heart='<3'

    # colorful
    bl_cli_powerline_star='*'
    bl_cli_powerline_saxophone='(yeah)'
    bl_cli_powerline_thumbsup='(ok)'
}
alias bl.cli.disable_unicode_glyphs='bl_cli_disable_unicode_glyphs'
# TODO improve unicode detection
bl_cli_glyph_available_in_font() {

    #local font=$1
    local current_font
    current_font=$(xrdb -q| grep -i facename | cut -d: -f2)
    local font_file_name
    font_file_name=$(fc-match "$current_font" | cut -d: -f1)
    #font_path=$(fc-list "$current_font" | grep "$font_file_name" | cut -d: -f1)
    local font_file_extension="${font_file_name##*.}"

    # Alternative or to be sure
    #font_path=$(lsof -p $(ps -o ppid= -p $$) | grep fonts)

    if [[ $font_file_extension == otf ]]; then
        otfinfo /usr/share/fonts/OTF/Hack-Regular.otf -u | grep -i uni27a1
    elif [[ $font_file_extension == ttf ]]; then
        ttfdump -t cmap /usr/share/fonts/TTF/Hack-Regular.ttf 2>/dev/null| grep 'Char 0x27a1'
    else
        return 1
    fi
    return $?
}
## endregion
# endregion
# region detect terminal capabilities
if [[ "${TERM}" == *"xterm"* ]]; then
    bl_cli_enable_color
else
    bl_cli_disable_color
fi
# TODO this breaks dracut (segfault)
#(echo -e $'\u1F3B7' | grep -v F3B7) &> /dev/null
if bl.tools.is_defined NO_UNICODE; then
    bl.cli.disable_unicode_glyphs
else
    bl.cli.enable_unicode_glyphs
fi
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
