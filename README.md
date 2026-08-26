# dislocker-mbedtls3

Read/write BitLocker-encrypted volumes. Drop-in for the official `dislocker` AUR
package, but built against the namespaced **mbedtls3** package instead of
`mbedtls`.

## Why this package exists

Arch's `mbedtls` package is on major version 4.x. mbedtls 4.x **removed the
public low-level crypto API** that dislocker 0.7.3 uses directly
(`mbedtls_aes_*`, `mbedtls_sha256`). Those headers moved into
`/usr/include/mbedtls/private/` under the `tf-psa-crypto` namespace, and the
official `dislocker` AUR package (and other variants) break with:

    fatal error: mbedtls/aes.h: No such file or directory

The official mbedtls 4.x low-level API is intentionally private and unstable,
so building against it is fragile. Instead this package links against
**mbedtls3**, a separate, stable, maintained Arch package that still ships the
classic low-level API in its own namespace:

- headers: `/usr/include/mbedtls3/mbedtls/...`
- library: `/usr/lib/mbedtls3/libmbedcrypto.so.16`

This works on any system, including those with mbedtls 4.x installed, and does
not rely on private/unsupported headers.

## Usage

Same as the official package (it `provides`/`conflicts` with `dislocker`):

```sh
sudo dislocker -f -u 'YOUR_PIN' -r -- /path/to/image /mnt/bitlocker
sudo mount -o ro /mnt/bitlocker/dislocker-file /mnt/decrypted
```

## Additional fixes over upstream

- `dislocker-find` crashes under Ruby >= 3.2 (`File.exists?` was removed).
  Patched to `File.exist?`.

## Maintenance notes

- On upstream `dislocker` release bump: update `pkgver`, source URL, and
  `sha256sums`.
- If the mbedtls3 API changes incompatibly, the sed fixes in `build()` may need
  adjustment.
- Rebuild check: `makepkg -f && makepkg --printsrcinfo > .SRCINFO`
