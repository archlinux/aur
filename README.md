# neostation-bin

Arch Linux packaging for [NeoStation](https://neostation.dev/), a controller-friendly emulator frontend. This package extracts the upstream release AppImage; it does not build NeoStation from source or include ROMs, BIOS files, emulator cores or standalone emulators.

## Build and install

```sh
makepkg -si
```

The recipe supports `x86_64` and `aarch64`, downloads the matching upstream artifact and verifies its SHA-256 checksum. Extraction uses `7zip`, so building does not require FUSE or execution of the AppImage runtime.

Launch with `neostation` or the desktop menu entry. The launcher runs NeoStation from `~/.neostation/`, so application data is stored there by default, including the database at `~/.neostation/user-data/data.sqlite`. An existing custom User Data Location configured in NeoStation still takes precedence.

## Runtime notes

- Install RetroArch and the desired cores, or select standalone emulators in NeoStation. They are separate from this frontend package.
- A running Secret Service provider, such as GNOME Keyring or KeePassXC, is recommended for storing service credentials.
- Application updates are managed through the package manager. The launcher clears `APPIMAGE` and `APPDIR` so the upstream binary-replacement updater is not offered. NeoStation's separate system-definition and metadata updates remain unchanged.
- The package does not force a GPU, set `LD_LIBRARY_PATH`, activate services or configure synchronization. Select ROM directories and any ES-DE artwork import through NeoStation's interface.
- The x86_64 package was launched in a network-isolated bubblewrap + Xvfb sandbox with a private home. The native window opened and the database initialized. It has not been tested in a real host installation. ARM64 package assembly was verified, but ARM64 runtime was not tested. Gameplay, audio, account integration and real-display behavior were not tested on either architecture.

The packaging files are licensed under 0BSD. NeoStation's upstream license is GPL-3.0; its bundled third-party components retain their respective licenses and notices.
