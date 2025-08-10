#!/bin/bash
_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${1}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
for _h in libav{codec,format}/version_major.h libavutil/version.h; do
 curl -sL https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/${_commit}/${_h}?format=TEXT|base64 -d|grep -E 'VERSION_MAJOR +[0-9]'
done
