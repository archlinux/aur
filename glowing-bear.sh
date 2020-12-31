#!/bin/bash

mkdir -p "$HOME/.config/glowing-bear"
cd "$HOME/.config/glowing-bear"
exec electron /usr/share/webapps/glowing-bear "${@}"
