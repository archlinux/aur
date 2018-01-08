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
bashlink.module.import bashlink.core
# endregion
# region documentation
# shellcheck disable=SC2034
cli__doc__='
    This module provides variables for printing colorful and unicode glyphs.
    The Terminal features are detected automatically but can also be
    enabled/disabled manually (see
    [cli.enable_color](#function-cli_enable_color) and
    [cli.enable_unicode_glyphs](#function-cli_enable_unicode_glyphs)).
'
# endregion
# region variables
cli_color_enabled=false
# endregion
# region functions
cli_enable_color() {
    local __doc__='
        Enables color output explicitly.

        >>> cli.disable_color
        >>> cli.enable_color
        >>> echo -E $cli_color_red red $cli_color_default
        \033[0;31m red \033[0m
    '
    cli_color_enabled=true
    cli_color_default='\033[0m'

    cli_color_black='\033[0;30m'
    cli_color_red='\033[0;31m'
    cli_color_green='\033[0;32m'
    cli_color_yellow='\033[0;33m'
    cli_color_blue='\033[0;34m'
    cli_color_magenta='\033[0;35m'
    cli_color_cyan='\033[0;36m'
    cli_color_lightgray='\033[0;37m'

    cli_color_darkgray='\033[0;90m'
    cli_color_lightred='\033[0;91m'
    cli_color_lightgreen='\033[0;92m'
    cli_color_lightyellow='\033[0;93m'
    cli_color_lightblue='\033[0;94m'
    cli_color_lightmagenta='\033[0;95m'
    cli_color_lightcyan='\033[0;96m'
    cli_color_white='\033[0;97m'

    # flags
    cli_color_bold='\033[1m'
    cli_color_dim='\033[2m'
    cli_color_underline='\033[4m'
    cli_color_blink='\033[5m'
    cli_color_invert='\033[7m'
    cli_color_invisible='\033[8m'

    cli_color_nobold='\033[21m'
    cli_color_nodim='\033[22m'
    cli_color_nounderline='\033[24m'
    cli_color_noblink='\033[25m'
    cli_color_noinvert='\033[27m'
    cli_color_noinvisible='\033[28m'
}
alias cli.enable_color='cli_enable_color'
# shellcheck disable=SC2034
cli_disable_color() {
    local __doc__='
        Disables color output explicitly.

        >>> cli.enable_color
        >>> cli.disable_color
        >>> echo -E "$cli_color_red" red "$cli_color_default"
        red
    '
    cli_color_enabled=false
    cli_color_default=''

    cli_color_black=''
    cli_color_red=''
    cli_color_green=''
    cli_color_yellow=''
    cli_color_blue=''
    cli_color_magenta=''
    cli_color_cyan=''
    cli_color_lightgray=''

    cli_color_darkgray=''
    cli_color_lightred=''
    cli_color_lightgreen=''
    cli_color_lightyellow=''
    cli_color_lightblue=''
    cli_color_lightmagenta=''
    cli_color_lightcyan=''
    cli_color_white=''

    # flags
    cli_color_bold=''
    cli_color_dim=''
    cli_color_underline=''
    cli_color_blink=''
    cli_color_invert=''
    cli_color_invisible=''

    cli_color_nobold=''
    cli_color_nodim=''
    cli_color_nounderline=''
    cli_color_noblink=''
    cli_color_noinvert=''
    cli_color_noinvisible=''
}
alias cli.disable_color='cli_disable_color'
## region glyphs
# NOTE: use 'xfd -fa <font-name>' to watch glyphs
cli_unicode_enabled=false
cli_enable_unicode_glyphs() {
    local __doc__='
        Enables unicode glyphs explicitly.

        >>> cli.disable_unicode_glyphs
        >>> cli.enable_unicode_glyphs
        >>> echo -E "$cli_powerline_ok"
        \u2714
    '
    cli_unicode_enabled=true
    cli_powerline_pointingarrow='\u27a1'
    cli_powerline_arrowleft='\ue0b2'
    cli_powerline_arrowright='\ue0b0'
    cli_powerline_arrowrightdown='\u2198'
    cli_powerline_arrowdown='\u2b07'
    cli_powerline_plusminus='\ue00b1'
    cli_powerline_branch='\ue0a0'
    cli_powerline_refersto='\u27a6'
    cli_powerline_ok='\u2714'
    cli_powerline_fail='\u2718'
    cli_powerline_lightning='\u26a1'
    cli_powerline_cog='\u2699'
    cli_powerline_heart='\u2764'

    # colorful
    cli_powerline_star='\u2b50'
    cli_powerline_saxophone='\u1f3b7'
    cli_powerline_thumbsup='\u1f44d'
}
alias cli.enable_unicode_glyphs='cli_enable_unicode_glyphs'
# shellcheck disable=SC2034
cli_disable_unicode_glyphs() {
    local __doc__='
        Disables unicode glyphs explicitly.

        >>> cli.enable_unicode_glyphs
        >>> cli.disable_unicode_glyphs
        >>> echo -E "$cli_powerline_ok"
        +
    '
    cli_unicode_enabled=false
    cli_powerline_pointingarrow='~'
    cli_powerline_arrowleft='<'
    cli_powerline_arrowright='>'
    cli_powerline_arrowrightdown='>'
    cli_powerline_arrowdown='_'
    cli_powerline_plusminus='+-'
    cli_powerline_branch='|}'
    cli_powerline_refersto='*'
    cli_powerline_ok='+'
    cli_powerline_fail='x'
    cli_powerline_lightning='!'
    cli_powerline_cog='{*}'
    cli_powerline_heart='<3'

    # colorful
    cli_powerline_star='*'
    cli_powerline_saxophone='(yeah)'
    cli_powerline_thumbsup='(ok)'
}
alias cli.disable_unicode_glyphs='cli_disable_unicode_glyphs'
# TODO improve unicode detection
cli_glyph_available_in_font() {

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
    cli_enable_color
else
    cli_disable_color
fi
# TODO this breaks dracut (segfault)
#(echo -e $'\u1F3B7' | grep -v F3B7) &> /dev/null
if core.is_defined NO_UNICODE; then
    cli.disable_unicode_glyphs
else
    cli.enable_unicode_glyphs
fi
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
