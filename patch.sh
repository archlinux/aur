#!/usr/bin/env sh

if [ "${1}" = "-u" ]; then
  rm /usr/share/pixmaps/com.visualstudio.code.png
  mv /usr/share/code-icons/code.png /usr/lib/code/resources/linux/code.png
  mv /usr/share/code-icons/letterpress.svg.bak /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress.svg
  mv /usr/share/code-icons/letterpress-dark.svg.bak /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-dark.svg
  mv /usr/share/code-icons/letterpress-hc.svg.bak /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-hc.svg
  patch -R /usr/share/applications/code-oss.desktop </usr/share/code-icons/code-oss.desktop.diff
  patch -R /usr/share/applications/code-oss-url-handler.desktop </usr/share/code-icons/code-oss-url-handler.desktop.diff
else
  cp /usr/share/code-icons/com.visualstudio.code.png /usr/share/pixmaps/com.visualstudio.code.png
  mv /usr/lib/code/resources/linux/code.png /usr/share/code-icons/code.png 
  cp /usr/share/code-icons/com.visualstudio.code.png /usr/lib/code/resources/linux/code.png
  mv /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress.svg /usr/share/code-icons/letterpress.svg.bak
  cp /usr/share/code-icons/letterpress.svg /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress.svg
  mv /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-dark.svg /usr/share/code-icons/letterpress-dark.svg.bak
  cp /usr/share/code-icons/letterpress-dark.svg /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-dark.svg
  mv /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-hc.svg /usr/share/code-icons/letterpress-hc.svg.bak
  cp /usr/share/code-icons/letterpress-hc.svg /usr/lib/code/out/vs/workbench/browser/parts/editor/media/letterpress-hc.svg
  patch /usr/share/applications/code-oss.desktop </usr/share/code-icons/code-oss.desktop.diff
  patch /usr/share/applications/code-oss-url-handler.desktop </usr/share/code-icons/code-oss-url-handler.desktop.diff
fi
