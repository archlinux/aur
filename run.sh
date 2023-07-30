#!/usr/bin/bash
mkdir -p ~/.config/phira/data/ ~/.config/phira/cache/
bwrap --bind / / --tmpfs /usr/share/phira/ --ro-bind /usr/share/phira/phira-main /usr/share/phira/phira-main --ro-bind /usr/share/phira/assets/ /usr/share/phira/assets/ --bind ~/.config/phira/data/ /usr/share/phira/data/ --bind ~/.config/phira/cache/ /usr/share/phira/cache/ /usr/share/phira/phira-main