# liblhdcv5

Linux build wrapper and packaging source for the AOSP LHDC v5 Bluetooth encoder.

The `aosp/` directory contains the Android 17
`system/audio/codecs/lhdcv5` source. The encoder implementation is Rust; the
public C ABI is the AOSP `lhdcv5BT.h` wrapper. The Linux build links both into
one shared library for desktop audio stacks.

```sh
make
sudo make install
```

Installed interface:

```text
/usr/lib/liblhdcv5.so
/usr/include/lhdcv5/lhdcv5BT.h
/usr/include/lhdcv5/lhdcv5_api.h
/usr/lib/pkgconfig/lhdcv5.pc
```

Source:

```text
https://android.googlesource.com/platform/packages/modules/Bluetooth
tag: android-17.0.0_r1
commit: c77db469de80f86660bc053bec4dee0c5d4b947c
path: system/audio/codecs/lhdcv5
license: Apache-2.0
```
