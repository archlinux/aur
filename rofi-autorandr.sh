#!/bin/bash

set -u
set -e

function get_layouts()
{
    autorandr
}

function main()
{
    local layouts="$(get_layouts)"

    local layout=$( (echo "${layouts}")  | rofi -dmenu -p "Layout:")
    local matching=$( (echo "${layouts}") | grep "^${layout}$")

    autorandr --load $matching
}

main
