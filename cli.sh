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
bl_cli__documentation__='
    This module provides variables for printing colorful and unicode glyphs.
    The Terminal features are detected automatically but can also be
    enabled/disabled manually.

    [bl.cli.enable_color](#function-bl_cli_enable_color) and
    [bl.cli.enable_unicode_glyphs](#function-bl_cli_enable_unicode_glyphs)
'
bl_cli_color_enabled=false
# NOTE: Use 'xfd -fa <font-name>' to watch glyphs.
bl_cli_unicode_enabled=false
# endregion
# region functions
# TODO improve unicode detection
alias bl.cli.glyph_available_in_font=bl_cli_glyph_available_in_font
bl_cli_glyph_available_in_font() {
    local current_font
    current_font=$(xrdb -q | grep -i facename | cut -d: -f2)
    local font_file_name
    font_file_name=$(fc-match "$current_font" | cut -d: -f1)
    #font_path=$(fc-list "$current_font" | grep "$font_file_name" | cut -d: -f1)
    local font_file_extension="${font_file_name##*.}"
    # Alternative or to be sure
    #font_path=$(lsof -p $(ps -o ppid= -p $$) | grep fonts)
    if [[ $font_file_extension == otf ]]; then
        otfinfo /usr/share/fonts/OTF/Hack-Regular.otf -u | grep -i uni27a1
    elif [[ $font_file_extension == ttf ]]; then
        ttfdump -t cmap /usr/share/fonts/TTF/Hack-Regular.ttf 2>/dev/null | \
            grep 'Char 0x27a1'
    else
        return 1
    fi
    return $?
}
alias bl.cli.disable_color=bl_cli_disable_color
bl_cli_disable_color() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Disables color output explicitly.

        >>> bl.cli.enable_color
        >>> bl.cli.disable_color
        >>> echo -E "$bl_cli_color_red" red "$bl_cli_color_default"
        red
    '
    bl_cli_color_enabled=false
    local name
    for name in \
        black \
        blink \
        blue \
        bold \
        cyan \
        darkgray \
        default \
        dim \
        green \
        invert \
        invisible \
        lightblue \
        lightcyan \
        lightgray \
        lightgreen \
        lightmagenta \
        lightred \
        lightyellow \
        magenta \
        nodim \
        noblink \
        nobold \
        noinvert \
        noinvisible \
        nounderline \
        red \
        underline \
        white \
        yellow
    do
        eval "bl_cli_color_${name}=''"
    done
}
alias bl.cli.enable_color=bl_cli_enable_color
bl_cli_enable_color() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Enables color output explicitly.

        >>> bl.cli.disable_color
        >>> bl.cli.enable_color
        >>> echo -E $bl_cli_color_red red $bl_cli_color_default
        \033[0;31m red \033[0m
    '
    bl_cli_color_enabled=true
    local suffix
    for suffix in \
        "black='\033[0;30m'" \
        "blink='\033[5m'" \
        "blue='\033[0;34m'" \
        "bold='\033[1m'" \
        "cyan='\033[0;36m'" \
        "darkgray='\033[0;90m'" \
        "default='\033[0m'" \
        "dim='\033[2m'" \
        "green='\033[0;32m'" \
        "invert='\033[7m'" \
        "invisible='\033[8m'" \
        "lightblue='\033[0;94m'" \
        "lightcyan='\033[0;96m'" \
        "lightgray='\033[0;37m'" \
        "lightgreen='\033[0;92m'" \
        "lightmagenta='\033[0;95m'" \
        "lightred='\033[0;91m'" \
        "lightyellow='\033[0;93m'" \
        "magenta='\033[0;35m'" \
        "nodim='\033[22m'" \
        "noblink='\033[25m'" \
        "nobold='\033[21m'" \
        "noinvert='\033[27m'" \
        "noinvisible='\033[28m'" \
        "nounderline='\033[24m'" \
        "red='\033[0;31m'" \
        "underline='\033[4m'" \
        "white='\033[0;97m'" \
        "yellow='\033[0;33m'"
    do
        eval "bl_cli_color_${suffix}"
    done
}
## region glyphs
alias bl.cli.disable_unicode_glyphs=bl_cli_disable_unicode_glyphs
bl_cli_disable_unicode_glyphs() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Disables unicode glyphs explicitly.

        >>> bl.cli.enable_unicode_glyphs
        >>> bl.cli.disable_unicode_glyphs
        >>> echo -E "$bl_cli_powerline_ok"
        +
    '
    bl_cli_unicode_enabled=false
    local suffix
    for suffix in \
        "arrowdown='_'" \
        "arrowleft='<'" \
        "arrowright='>'" \
        "arrowrightdown='>'" \
        "branch='|}'" \
        "cog='{*}'" \
        "fail='x'" \
        "heart='<3'" \
        "lightning='!'" \
        "ok='+'" \
        "pointingarrow='~'" \
        "plusminus='+-'" \
        "refersto='*'" \
        "star='*'" \
        "saxophone='(yeah)'" \
        "thumbsup='(ok)'"
    do
        eval "bl_cli_powerline_${suffix}"
    done
}
alias bl.cli.enable_unicode_glyphs=bl_cli_enable_unicode_glyphs
bl_cli_enable_unicode_glyphs() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Enables unicode glyphs explicitly.

        >>> bl.cli.disable_unicode_glyphs
        >>> bl.cli.enable_unicode_glyphs
        >>> echo -E "$bl_cli_powerline_ok"
        \u2714
    '
    bl_cli_unicode_enabled=true
    local suffix
    for suffix in \
        "arrowdown='\u2b07'" \
        "arrowleft='\ue0b2'" \
        "arrowright='\ue0b0'" \
        "arrowrightdown='\u2198'" \
        "branch='\ue0a0'" \
        "cog='\u2699'" \
        "fail='\u2718'" \
        "heart='\u2764'" \
        "lightning='\u26a1'" \
        "ok='\u2714'" \
        "pointingarrow='\u27a1'" \
        "plusminus='\ue00b1'" \
        "refersto='\u27a6'" \
        "star='\u2b50'" \
        "saxophone='\u1f3b7'" \
        "thumbsup='\u1f44d'"
    do
        eval "bl_cli_powerline_${suffix}"
    done
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
