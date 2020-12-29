#!/bin/bash

mkdir -p "$HOME/.config/glowing-bear"
cd "$HOME/.config/glowing-bear"
electron /usr/lib/glowing-bear "${@}"
