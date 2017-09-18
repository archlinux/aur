#/bin/sh

#ANDROID_VER=android-8.0.0_r4
ANDROID_VER=master

git clone https://android.googlesource.com/platform/system/core -b $ANDROID_VER
git clone https://android.googlesource.com/platform/system/extras -b $ANDROID_VER
git clone https://android.googlesource.com/platform/external/selinux -b $ANDROID_VER
git clone https://android.googlesource.com/platform/external/f2fs-tools -b $ANDROID_VER

# building Android's boringssl is a pain, let's use upstream version + CMake
# TODO: instead of building with ninja here it makes sense to configure build as
# a `subninja`.

# keep the sha in sync with
# https://android.googlesource.com/platform/external/boringssl/+/master/BORINGSSL_REVISION
boringssl_sha=54c259dec395bd991cce5691723214ffe588e51d

git clone https://boringssl.googlesource.com/boringssl
(cd boringssl; git checkout $borinssl_sha; mkdir build; cd build; cmake -GNinja ..; ninja)


patch -p1 -d core < ./fix_build_core.patch
patch -p1 -d selinux < ./fix_build_selinux.patch
