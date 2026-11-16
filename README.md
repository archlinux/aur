# xknx-editor-bin

Arch Linux package for the official XKNX Editor AppImage, x86_64.
Upstream: https://github.com/XKNX/xknx-editor

## Build and install

Install `base-devel`, inspect `PKGBUILD`, then run as your regular user:

```sh
makepkg -si
```

Start `xknx-editor` or choose **XKNX Editor** from the applications menu.
To inspect the editor without connecting to a KNX interface:

```sh
xknx-editor --no-connect --no-bus-writes
```

Remove it with `sudo pacman -R xknx-editor-bin`. User projects and settings
are stored separately and are not removed by pacman.

The package installs the unchanged upstream AppImage in `/opt/xknx-editor`,
a command in `/usr/bin`, and the upstream icon and desktop entry. The desktop
entry uses the packaged command and a single menu category. No compilation
is performed. The installed AppImage remains compressed (about 123 MiB).

## Maintenance

For a new stable upstream release:

1. Review the release notes, dependencies and packaging changes.
2. Update `pkgver`, reset `pkgrel` to `1`, and verify both source checksums.
   Compare the AppImage checksum with GitHub's release asset digest.
3. Run `makepkg --printsrcinfo > .SRCINFO` and rebuild in a clean Arch environment.
4. Run `namcap PKGBUILD *.pkg.tar.zst`, `pkgctl license check`, and a GUI smoke test.
5. Review and commit only the packaging sources, then push `master` to the AUR.

For packaging fixes without a new upstream version, increment `pkgrel`.
Updates become available through an AUR helper once the recipe is updated;
this package does not add an automatic updater or a background service.

The packaging sources use 0BSD (`LICENSE`, `LICENSES/0BSD.txt`, `REUSE.toml`).
The application retains its upstream GPL-2.0-only license and bundled notices.

## Validation and known analysis limitations

Validated on 2026-11-16: clean build and package installation in a rootless
Arch Linux base-devel container, source checksums, package metadata, desktop
entry, command-line startup, and graphical startup under Xvfb/Mesa. The
previous 0.14.0 AppImage also initialized the host's AMD Radeon 780M OpenGL
renderer. Tests used `--no-connect --no-bus-writes`; no KNX hardware was tested.

`namcap` does not inspect the compressed AppImage payload. It reports the
AppImage's ELF file under `/opt` and cannot infer most runtime dependencies.
`/opt/<package>` is the Arch guideline location for large self-contained
applications. These findings are retained in the validation log, not suppressed.
The runtime dependencies were checked against the unpacked payload:

- `glibc`, `gcc-libs`, `libxcb`: ELF dependencies not supplied by the bundle.
- `zlib`: the PyInstaller launcher needs system `libz.so.1` before it sets
  the bundled-library search path; it has no RPATH/RUNPATH.
- GL/X11 libraries: GLFW's dynamically loaded desktop/OpenGL dependencies.
- `fuse2`: the `fusermount` helper used by the AppImage runtime.
- `which`, `zenity`: upstream's Linux file-dialog requirements.
- `hicolor-icon-theme`: the installed icon hierarchy.

Container startup uses `APPIMAGE_EXTRACT_AND_RUN=1` because the isolated
container has no FUSE device. The normal AppImage startup was tested on the host.

Maintainer: luigife80 <internet.mail at gmx dot at>.
Publication still needs AUR account/SSH access. Nothing has been pushed to the AUR. Built package archives,
downloads and validation artifacts are ignored by Git and must not be uploaded.
