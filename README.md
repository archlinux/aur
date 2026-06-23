# python-pykrx (AUR)

AUR packaging for [pykrx](https://github.com/sharebook-kr/pykrx) — a Python
library for scraping stock and bond data from the Korea Exchange (KRX) and Naver.

## Files

| File        | Purpose                                                        |
| ----------- | ------------------------------------------------------------- |
| `PKGBUILD`  | The package recipe (the only file `makepkg` reads).           |
| `.SRCINFO`  | Generated metadata the AUR uses for search/deps. Keep in sync.|
| `update.sh` | Helper to bump to a new upstream release.                     |

## Building / installing locally

```bash
makepkg -si
```

## Updating to a new release

The whole bump is automated:

```bash
./update.sh            # detect & apply the latest PyPI release
# or
./update.sh 1.2.9      # pin a specific version
```

It sets `pkgver`, resets `pkgrel`, refreshes `sha256sums`, regenerates
`.SRCINFO`, and runs a test build. Then commit and push:

```bash
git add PKGBUILD .SRCINFO
git commit -m 'Update to 1.2.9'
git push
```

### Doing it by hand

```bash
# 1. edit pkgver in PKGBUILD, set pkgrel=1
# 2. refresh checksums
updpkgsums
# 3. regenerate metadata
makepkg --printsrcinfo > .SRCINFO
# 4. sanity build
makepkg -f
```

> **Note:** `.SRCINFO` must always match `PKGBUILD` before pushing — the AUR
> rejects pushes whose `.SRCINFO` is missing or out of date.

## Notes

- The source is the PyPI sdist; the `source/` redirect URL means the download
  link does not need editing on every version bump (only `pkgver`).
- Upstream declares the MIT license in metadata but ships no `LICENSE` file, so
  there is none to install.
