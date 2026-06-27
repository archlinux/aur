# lhdc-v5-helper

QEMU aarch64 stdio helper for an Android ARM64 LHDC v5 encoder library.

This repository intentionally does not include Savitech's closed
`liblhdcv5.so`. After installing the package, place a compatible ARM64 Android
library at:

```text
/usr/lib/lhdc-v5-helper/lib/liblhdcv5.so
```

or set `LHDCV5_LIB=/path/to/liblhdcv5.so`.

The helper reads 48 kHz stereo S16LE PCM blocks from stdin and writes framed
LHDC payloads to stdout for `pipewire-bluez5-lhdc-git`.
