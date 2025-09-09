#!/bin/bash
cd /opt/zoom
# Remove libs but supress pacman's warning
for _b in qt.conf libOpenCL.so* libmpg123.so* libavcodec.so* libavformat.so* libavutil.so* libswresample.so* cef/libsqlite3.so* cef/libvulkan.so*
 do ln -sf /dev/null $_b
done
ln -sf /usr/lib/libquazip1-qt5.so libquazip.so*
ln -sf /usr/lib/chromium/chrome-sandbox cef/chrome_sandbox
rm -rf Qt translations # needs NoExtract
install -d Qt/libs
# Use native libs
for _b in zoom zopen Zoom{Launcher,WebviewHost} aomhost libaomagent.so
 do patchelf --remove-rpath $_b $(nm -D "$_b"|grep @Qt_5|sed 's/@Qt_5.*//;s/^\s*U/--clear-symbol-version/'|tr '\n' ' ')
done
