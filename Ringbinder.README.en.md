# Ringbinder — source build on Cosmoe/Hokku

This directory contains the `ringbinder` Arch package built entirely from source in the same split PKGBUILD as `easypaint`, `hokku-runtime` and `hokku-lib`. The application runs on Hokku (a Cosmoe fork providing the Haiku/BeOS API on Linux) and uses the shared packages instead of the fallbacks bundled in the AppImage.

Verified versions:

- Ringbinder `v1.3.0` (`77f02358acbfcc4b162da5c9e655edcb13d44c4c`)
- Hokku: `517999b3ab8263c8ed49a492558f8ef0749fa515`

## What is changed

- **Source build instead of AppImage.** No glibc 2.43 from Ubuntu 26.04 is needed; the app is linked against system Hokku. Google sync uses system `curl`.
- **Shared Hokku packages.** Libraries and all addons (`/usr/lib/hokku/lib/addons`: image translators and control looks) come from `hokku-lib`; headers, tools (`rc`, `linkcatkeys`, `dumpcatalog`), artwork and catalogs come from `hokku-runtime`. Only `hokku-lib` is needed to launch Ringbinder; `hokku-runtime` is an `optdepend` but is required for building.
- **Russian localization.** Upstream has no `B_TRANSLATE()` calls, so `ringbinder-localize.py` adds `<Catalog.h>`, translation contexts and wraps 197 user-facing strings. `Ringbinder.ru.catkeys` is compiled into `x-vnd.Ringbinder/ru.catalog`.
- **Localized `.desktop`.** `GenericName` and `Comment` are translated to ru, uk, de, es, fr, it, pl, pt_BR, zh_CN and ja.
- **Private app directory.** The binary lives in `/usr/lib/ringbinder/bin`; `/usr/bin/ringbinder` only sets `LD_LIBRARY_PATH` and `TRANSLATORS`.
- **Correct About version.** `Ringbinder.rdef` says 1.3.0 while the hardcoded dialog said 1.0; the patch changes it to 1.3.0.
- **Compact packaging.** `xz -9e`, `!debug`, `!lto`; the stock sync tests are run via `make test`.

## Build

In this sandbox `hokku-lib` and `hokku-runtime` are not installed system-wide, so Hokku is built by the same PKGBUILD:

```
makepkg --printsrcinfo > .SRCINFO
export PKG_CONFIG_PATH=/tmp/archdeps/pc
makepkg -d -f
```

Result: `ringbinder-0.2.0+1.3.0-1-x86_64.pkg.tar.xz`. After changing `PKGBUILD` or source files, regenerate `.SRCINFO`.

## Adding another language

Ringbinder uses Haiku `BCatalog`, not gettext. A finished catalog must be installed as:

```
/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.Ringbinder/<code>.catalog
```

To add a language:

1. Copy `Ringbinder.ru.catkeys` to `Ringbinder.<code>.catkeys`.
2. Put the language name in the second column of the header; fill the fourth column of each line with the translation. Do not change the first three columns or the tabs.
3. Add the file to `source=()` and its sha256 to `sha256sums=()`.
4. In `package_ringbinder()`, call `linkcatkeys -s x-vnd.Ringbinder -l <code> ...` and install `<code>.catalog` next to `ru.catalog`.

Headless catalog check:

```
LC_ALL=ru_RU.UTF-8 LANG=ru_RU.UTF-8 ringbinder
```

Or use a minimal program with `BCatalog("x-vnd.Ringbinder")`: with `LC_ALL=ru_RU.UTF-8` it returns, for example, `Сохранить`, `Календарь`, `Новая встреча`; with `LC_ALL=C` it returns the English strings. `LC_ALL` takes precedence over `LANG`, so set it explicitly for headless checks.
