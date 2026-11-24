# neostation

Arch Linux packaging that compiles [NeoStation](https://neostation.dev/) from the source of its tagged release. Use this variant for application patches and local builds; use `neostation-bin` for the upstream precompiled release. The packages conflict and are not intended to be installed together.

## Build and install

```sh
makepkg -si
```

This recipe currently supports **x86_64**. It downloads the exact Flutter SDK pinned by upstream, uses a private build-local HOME and Pub cache, and resolves Dart dependencies with the upstream lockfile enforced. Expect a large initial SDK download and several GiB of build space. An existing system Flutter installation is neither required nor changed.

NeoStation's application and buildable plugins are compiled into a native Linux bundle; no AppImage is downloaded or created for the application. This is **not an entirely source-bootstrapped stack**: the build uses a precompiled Flutter toolchain/engine and third-party native components, including a checksum-pinned MDK SDK release, its LLVM C++ runtime, and SQLite assets. Audio codecs and FFmpeg use Arch system packages rather than bundled downloads. Dart/native build dependencies require network access during the build.

The MDK component has separate terms, identified by `LicenseRef-MDK-SDK`. Its published terms and SDK notes, the LLVM C++ runtime license, Flutter's license and NeoStation's GPL license are installed under `/usr/share/licenses/neostation/`. The optional Blackmagic RAW and RED camera-format decoder add-ons are not shipped; regular media uses system FFmpeg.

## Runtime

Launch `neostation` or use the desktop menu entry. The wrapper runs from `~/.neostation`, giving the same default database location as `neostation-bin`: `~/.neostation/user-data/data.sqlite`. An existing custom User Data Location still takes precedence. Before switching application versions, close NeoStation and back up its user data.

- ROMs, BIOS files, RetroArch cores and standalone emulators are not included.
- Account credentials use a running Secret Service provider, such as GNOME Keyring or KeePassXC.
- The Java 17 runtime is declared for the shipped JNI bridge. The bridge itself is not part of the verified startup path.
- Executable updates belong to the package manager. The launcher clears `APPIMAGE` and `APPDIR`; upstream's separate system-definition and metadata updates remain unchanged.
- No GPU override, `LD_LIBRARY_PATH`, service activation or synchronization configuration is added.

## Build diagnostics and verification

Flutter can print `File modified during build. Build must be rerun.` while returning success after generated inputs change. If Flutter exits successfully with that exact diagnostic, the recipe retries once and fails if the diagnostic appears again. Any nonzero build failure fails immediately. The retry behavior has regression tests; the final clean build completed without needing a retry. Plugin RUNPATHs are normalized to `$ORIGIN`; Flutter's AOT `libapp.so` may still contain build-directory strings, so makepkg can warn about a `$srcdir` reference without indicating a runtime library search path.

The package was built from source with native makepkg and the pinned Flutter SDK, then launched in a network-isolated Bubblewrap/Xvfb environment with a private home; its window opened and its database initialized. A separate isolated probe prepared the first frame of a synthetic video using the packaged MDK runtime and system FFmpeg. These checks are not a clean-chroot build or a full upstream test-suite result. Real-display behavior, gameplay, audio devices, full in-app media playback and account integrations were not tested; namcap was unavailable. No host package installation or existing user profile change was performed during verification.

The packaging files are licensed under 0BSD. NeoStation and its third-party components retain their respective licenses and notices.
