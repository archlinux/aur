#!/usr/bin/env sh
if [ "${1}" = "-R" ]; then
    sed -i -E 's/(\.monaco-workbench>\.notifications-toasts\.visible)\{[^\{\}]*\}/\1\{display:flex;flex-direction:column\}/;t;d' /usr/lib/code/out/vs/workbench/workbench.desktop.main.css
else
    sed -i -E 's/(\.monaco-workbench>\.notifications-toasts\.visible)\{[^\{\}]*\}/\1\{display:none\}/;t;d' /usr/lib/code/out/vs/workbench/workbench.desktop.main.css
fi