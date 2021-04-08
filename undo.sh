#!/usr/bin/env sh

rm /usr/share/pixmaps/com.visualstudio.code.svg
# mv /usr/share/code-icons/code.png /usr/lib/code/resources/linux/code.png
mv /usr/share/code-icons/letterpress{,-dark,-hc}.svg /usr/lib/code/out/vs/workbench/browser/parts/editor/media/
sed -i 's/Icon=.*/Icon=com.visualstudio.code.oss/g' /usr/share/applications/code-oss.desktop
sed -i 's/Icon=.*/Icon=com.visualstudio.code.oss/g' /usr/share/applications/code-oss-url-handler.desktop

