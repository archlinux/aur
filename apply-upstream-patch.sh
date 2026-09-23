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

perl -0777 -i'' -pe 's/@@ pkgbase = ffmpeg-libfdk_aac\n \tprovides = libavutil.so\n \tprovides = libswresample.so\n \tprovides = libswscale.so\n/@@ pkgbase = ffmpeg-libfdk_aac\n \tprovides = libswresample.so\n \tprovides = libswscale.so\n \tconflicts = ffmpeg\n/g' "$1.new"

# apply patch
git am "$1.new" || git am --abort
