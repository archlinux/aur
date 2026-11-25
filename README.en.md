# EasyPaint — source build on Cosmoe/Hokku

This directory contains Arch packages for `easypaint`, `hokku-runtime`, `hokku-lib` and `ringbinder` built from one PKGBUILD. The apps run on Hokku (a Cosmoe fork that provides the Haiku/BeOS API on Linux), but do not ship a whole AppImage: ICU, Pango, Cairo, X11/Wayland and the image codecs come from system dependencies. The split is: `hokku-lib` — libraries and all `/usr/lib/hokku/lib/addons`, `hokku-runtime` — optional headers, tools, artwork and catalogs, `easypaint` and `ringbinder` — only the applications.

Verified versions:

- EasyPaint `v0.2.0` (`8255f9ae37d53842005b0e33cf80e097c51db209`)
- Ringbinder `v1.3.0` (`77f02358acbfcc4b162da5c9e655edcb13d44c4c`)
- Hokku `517999b3ab8263c8ed49a492558f8ef0749fa515`

## What was changed

- **Source build instead of unpacking the AppImage.** One PKGBUILD builds four packages: `hokku-lib` (libraries, `liblocalestub.a` and all addons), `hokku-runtime` (headers, tools, artwork and Hokku catalogs), `easypaint` and `ringbinder` (only binaries, catalogs and launchers).
- **Russian UI translation.** All 116 EasyPaint and 197 Ringbinder strings are translated through Haiku `BCatalog`: the catkeys are compiled into `x-vnd.EasyPaint/ru.catalog` and `x-vnd.Ringbinder/ru.catalog`. Ready-made `ru.catalog` files for libbe, libtracker and the image translators are included in `hokku-runtime`.
- **Minimal dependencies.** Only `hokku-lib` is required to launch either app, and it now contains the image translators and control looks. `hokku-runtime` is an `optdepend` that adds catalogs, artwork and `hokku-ui-font`. The launcher calls the font setter only when it is installed.
- **Static `liblocalestub.a`.** The `B_TRANSLATE()` macro calls `BLocaleRoster::GetCatalog()`, which Hokku provides only in `liblocalestub.a`; `BCatalog` itself lives in `libbe.so`. Without the archive, applications using `B_TRANSLATE()` do not link.
- **Localized `.desktop` entry.** `GenericName` and `Comment` are provided for ru, uk, de, es, fr, it, pl, pt_BR, zh_CN and ja; English remains the default.
- **Fixed Russian text input.** The X11 and Wayland backends treated the first UTF-8 byte as a character code, and `BWindow::SendKeyEvent()` forwarded only one byte. `utf8-keys.patch` fixes both places and is applied idempotently from `prepare()`.
- **UI font setter.** `hokku-ui-font` (with an `easypaint-ui-font` compatibility alias) synchronizes the font with GNOME/GTK, stores the choice in `~/.config/easypaint/ui-font` and writes the Hokku config to `~/.config/cosmoe/system/app_server/fonts`. The `/usr/bin/easypaint` launcher runs `hokku-ui-font --auto` before starting the app.
- **Larger GTK font.** `--gtk` reads the size from GSettings `org.gnome.desktop.interface` (`font-name`, `monospace-font-name`) and adds **+4 pt** to both fonts, because they rendered too small in the Hokku UI. `--plain` and `--fixed` set exact sizes with no boost.
- **Shared runtime in `/usr/lib/hokku`, app in `/usr/lib/easypaint`.** The launchers in `/usr/bin` only set `LD_LIBRARY_PATH` and `TRANSLATORS`, so namcap no longer complains about ELF files outside standard paths. Other Hokku applications can use the same `hokku-runtime`.
- **Compact packaging.** `xz -9e`, `!debug` and `!lto` are used; unneeded Hokku apps and tests are not shipped. Pixel-operation tests run during the build. `noto-fonts` was moved to `optdepends`: it is the default font, but the setter falls back to any available family.

## Font setter

```
hokku-ui-font --gtk                 # GNOME/GTK + 4 pt
hokku-ui-font --plain 'Noto Sans' Regular 16
hokku-ui-font --fixed 'Noto Sans Mono' Regular 15
hokku-ui-font --manual              # go back to the saved manual font
hokku-ui-font --status              # show saved settings
hokku-ui-font --help
```

If GSettings is unavailable, the setter reads `~/.config/gtk-3.0/settings.ini` or `~/.config/gtk-4.0/settings.ini`, and falls back to `Noto Sans 16` / `Noto Sans Mono 15`.

## Save formats

Save As has no explicit format picker: EasyPaint derives the format from the extension you type, or from the MIME type of an existing file. The package ships translators for PNG, JPEG, BMP, GIF, TIFF, TGA, WebP, PPM and ICO, so those extensions work. ICO accepts only 16×16, 32×32 and 48×48 images; otherwise — as with `avif`, `jp2`, `psd` and an unknown extension — the file falls back to PNG.

For example, typing `ribbon.webp` in Save As produces a WebP file.

## Building

The PKGBUILD declares `makedepends=('git' 'hokku-runtime' 'python')`. Since the same PKGBUILD builds `hokku-runtime` from source, this sandbox uses `makepkg -d -f`; `makepkg -s` would try to resolve the dependency from a repository.

In this sandbox there is no passwordless sudo and `libxkbcommon-x11` is not installed system-wide, so a local workaround is used:

```
export PKG_CONFIG_PATH=/tmp/archdeps/pc
makepkg -d -f
```

The result is `easypaint-0.2.0+1.3.0-1-x86_64.pkg.tar.xz`, `ringbinder-0.2.0+1.3.0-1-x86_64.pkg.tar.xz`, `hokku-runtime-0.2.0+1.3.0-1-x86_64.pkg.tar.xz` and `hokku-lib-0.2.0+1.3.0-1-x86_64.pkg.tar.xz`. The shared `pkgver` contains both app versions because a split PKGBUILD cannot assign different versions to subpackages. After changing `PKGBUILD` or source files, regenerate `.SRCINFO`:

```
makepkg --printsrcinfo > .SRCINFO
```

## Namcap

The remaining `namcap` warnings are expected:

- `libbe.so` and `libxkbcommon-x11.so.0` are reported as uninstalled because `libbe.so` lives in the private `/usr/lib/hokku/lib`, and `libxkbcommon-x11` is not installed system-wide in this sandbox. It is declared in `depends()`; after `pacman -S libxkbcommon-x11` the warning disappears.
- `Dependency included, but may not be needed` refers to transitive Pango/Cairo/X11 and font libraries pulled in through `libbe.so` and system libraries; they must stay in `depends()`.
- `Dependency bash detected and implicitly satisfied` comes from the `#!/bin/sh` launchers; on Arch `/bin/sh` is bash.
- `xz: Empty filename, skipping` is a quirk of namcap's `xz` call, not a package problem.
- namcap used to report `E: ELF files outside of a valid path ('opt/')`; moving the runtime to `/usr/lib/hokku` removed that error.

The "unused shared library" warnings for `libharfbuzz.so.0` and `libm.so.6` in the font setter were fixed with `-Wl,--as-needed`, and FULL RELRO was added through `$LDFLAGS` plus `-Wl,-z,relro -Wl,-z,now`.

## Translating to another language

EasyPaint uses Haiku `BCatalog`, not gettext. The chain is:

```
sources with B_TRANSLATE()  --collectcatkeys-->  <lang>.catkeys  --linkcatkeys-->  <code>.catalog
```

The compiled catalog must be installed at:

```
/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/<code>.catalog
```

`<code>` is the short locale code (`ru`, `uk`, `de`, ...). The code taken from `LANG=uk_UA.UTF-8` is `uk`; that code determines the filename.

### 1. Generate the English reference catkeys

Run these from the directory root after at least one successful build (`src/cosmoe` and `src/EasyPaint` must exist):

```
inc=(-I"$PWD/src/cosmoe/usr/include")
for d in config os os/app os/game os/interface os/kernel os/locale \
         os/media os/net os/storage os/support os/translation \
         os/be_apps/Tracker private/interface private/shared \
         private/support posix; do
  inc+=(-I"$PWD/src/cosmoe/usr/include/$d")
done
inc+=(-I"$PWD/src/cosmoe/usr/include/os/add-ons/graphics" \
      -I"$PWD/src/EasyPaint/src" -I"$PWD/src/EasyPaint/src/core")

g++ -E -DB_COLLECTING_CATKEYS "${inc[@]}" \
  src/EasyPaint/src/*.cpp src/EasyPaint/src/core/*.cpp > /tmp/EasyPaint.prep.cpp

LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/collectcatkeys -s x-vnd.EasyPaint \
  -o EasyPaint.en.catkeys /tmp/EasyPaint.prep.cpp
```

`-DB_COLLECTING_CATKEYS` expands `B_TRANSLATE()`/`B_TRANSLATE_MARK()` into `B_CATKEY`, so all 116 keys are collected, including the tool labels from `ToolBox.cpp`.

### 2. Prepare the translation

```
cp EasyPaint.en.catkeys EasyPaint.uk.catkeys
```

The reference header looks like this:

```
1	english	x-vnd.EasyPaint	152058525
```

Replace only the second column with a readable language name and fill the fourth column with the translation:

```
1	ukrainian	x-vnd.EasyPaint	152058525
```

Fields are separated by **tabs**; there are four of them:

```
English string	context	comment	translation
```

Important:

- do not change the first three columns — contexts (`App`, `PaintWindow`, `ToolBox`, ...) must match `B_TRANSLATION_CONTEXT`;
- keep the `fingerprint` (the fourth number in the header) from the freshly generated reference; a mismatch makes the catalog silently unused;
- keep `%s`, `\n`, `\"` and the ellipsis `…` in the translation exactly as needed;
- the third column (`comment`) is currently empty, but must remain.

### 3. Compile the catalog

```
LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/linkcatkeys -s x-vnd.EasyPaint -l uk \
  -o EasyPaint.uk.catalog EasyPaint.uk.catkeys
```

Verify:

```
LD_LIBRARY_PATH="$PWD/src/cosmoe/usr/lib" \
  src/cosmoe/usr/bin/dumpcatalog EasyPaint.uk.catalog | grep -c '^Key:'
```

It should print `116`.

### 4. Add it to the package

Add `EasyPaint.uk.catkeys` to `source=()` and its sha256 to `sha256sums=()`, then add this next to the Russian catalog in `package_easypaint()`:

```
LD_LIBRARY_PATH="$srcdir/cosmoe/usr/lib" \
  "$srcdir/cosmoe/usr/bin/linkcatkeys" -s x-vnd.EasyPaint -l uk \
  -o "$srcdir/EasyPaint.uk.catalog" "$srcdir/EasyPaint.uk.catkeys"
install -m644 "$srcdir/EasyPaint.uk.catalog" \
  "$pkgdir/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.EasyPaint/uk.catalog"
```

Then:

```
makepkg --printsrcinfo > .SRCINFO
makepkg -d -f
```

### 5. Test it

```
LC_ALL=uk_UA.UTF-8 easypaint
```

`LC_ALL` overrides `LANG`, so set it explicitly for headless checks. For a headless check, use a tiny program with `BCatalog("x-vnd.EasyPaint")`; with `LC_ALL=ru_RU.UTF-8` the current catalog returns, for example, `Не сохранять` and `Открыть…`, while `LC_ALL=C` returns the English strings.

Hokku catalogs (`libbe`, `libtracker`) live in `hokku-runtime`; the image translators and control looks live in `hokku-lib` under `/usr/lib/hokku/lib/addons`. If system dialogs also need another language, add the matching `<code>.catalog` files under `/usr/lib/hokku/share/cosmoe/locale/catalogs/x-vnd.Haiku-*/`.
