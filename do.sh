#!/usr/bin/env sh

# mv /usr/lib/code/resources/linux/code.png /usr/share/code-icons/
mv /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress{,-dark,-hc}.svg /usr/share/code-icons/
cp /usr/share/code-icons/vscode-icons/com.visualstudio.code.svg /usr/share/pixmaps/
# cp /usr/share/code-icons/vscode-icons/com.visualstudio.code.svg /usr/lib/code/resources/linux/code.png
cp /usr/share/code-icons/vscode-icons/letterpress{,-dark,-hc}.svg /usr/lib/code/out/vs/workbench/browser/parts/editor/media/
sed -i 's/Icon=.*/Icon=com.visualstudio.code/g' /usr/share/applications/code-oss.desktop
sed -i 's/Icon=.*/Icon=com.visualstudio.code/g' /usr/share/applications/code-oss-url-handler.desktop

