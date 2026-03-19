#!/bin/bash

# copy file
cp "$1" "$1.new"

# PKGBUILD
sed -i '' 's/pkgbase=ffmpeg/pkgbase=ffmpeg-libfdk_aac/g' "$1.new"
sed -i '' 's/pkgname=ffmpeg/pkgname=ffmpeg-libfdk_aac/g' "$1.new"
sed -i '' "s/pkgdesc='Complete solution to record, convert and stream audio and video'/pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'/g" "$1.new"

# .SRCINFO
sed -i '' 's/pkgbase = ffmpeg/pkgbase = ffmpeg-libfdk_aac/g' "$1.new"
sed -i '' 's/pkgname = ffmpeg/pkgname = ffmpeg-libfdk_aac/g' "$1.new"
sed -i '' 's/pkgdesc = Complete solution to record, convert and stream audio and video/pkgdesc = Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)/g' "$1.new"

# apply patch
git am "$1.new" || git am --abort
