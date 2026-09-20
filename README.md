# `granola`

The `PKGBUILD` repackages the official Granola macOS disk image as a native Linux package. `makepkg` downloads the `.dmg` from the release CDN that the in-app updater uses.

- `prepare()`: extracts `app.asar` and `app.asar.unpacked` from the image, stops the build if the installed `electron` package, the Electron version in the image, or the bundled `better-sqlite3-multiple-ciphers` version does not agree with the literals in the `PKGBUILD`, and patches the platform string in `app.asar`, because `api.granola.ai` answers with HTTP 500 to a request that reports Linux.
- `build()`: compiles the `better-sqlite3-multiple-ciphers` fork from the C++ source in the image against the Electron headers, because the fork adds an `updateHook()` method that the npm prebuilt files do not contain.
- `check()`: opens an encrypted database and verifies that hook.
- `package()`: installs the app, the icon, a launcher script that starts the system Electron, and a license note.

Links:
- Upstream: https://www.granola.ai
- Linux packaging reference: https://github.com/tirtha4/Granola-for-Linux
- AUR: https://aur.archlinux.org/packages/granola

## `granola.desktop`

Desktop entry for the application menu. It sets `StartupWMClass=granola` for window matching, and it registers the `granola://` URL scheme for sign-in callbacks.
