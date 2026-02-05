#!/bin/bash

# PKGBUILD
sed -i '' 's/pkgbase=ffmpeg/pkgbase=ffmpeg-libfdk_aac/g' "$1"
sed -i '' 's/pkgname=ffmpeg/pkgname=ffmpeg-libfdk_aac/g' "$1"
sed -i '' "s/pkgdesc='Complete solution to record, convert and stream audio and video'/pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'/g" "$1"

# .SRCINFO
sed -i '' 's/pkgbase = ffmpeg/pkgbase = ffmpeg-libfdk_aac/g' "$1"
sed -i '' 's/pkgname = ffmpeg/pkgname = ffmpeg-libfdk_aac/g' "$1"
sed -i '' 's/pkgdesc = Complete solution to record, convert and stream audio and video/pkgdesc = Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)/g' "$1"

# apply patch
git am "$1" || git am --abort
