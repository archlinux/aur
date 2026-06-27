# lhdc-v5-helper

QEMU aarch64 stdio helper for an Android ARM64 LHDC v5 encoder library.

This package installs:

- `lhdc-helper-stdio`, the ARM64 stdio bridge used by PipeWire
- Android symbol shims needed by the encoder library
- `liblhdcv5.so`, an ARM64 Android LHDC v5 encoder library downloaded from
  this package's GitHub repository during AUR build
- `lhdc-v5-install-lib`, a replacement helper for testing another encoder build

The encoder library is installed to:

```text
/usr/lib/lhdc-v5-helper/lib/liblhdcv5.so
```

The bundled `liblhdcv5.so` is an ARM64 Android shared object. The package runs
it with `qemu-aarch64` and small libc/libm/liblog shims.

To replace the bundled encoder library:

```sh
sudo lhdc-v5-install-lib /path/to/liblhdcv5.so
```

You can also set `LHDCV5_LIB=/path/to/liblhdcv5.so` to test another library
without replacing the installed file.

The helper reads 48 kHz stereo S16LE PCM blocks from stdin and writes framed
LHDC payloads to stdout for `pipewire-bluez5-lhdc-git`.
