# rolisteam (AUR)

Virtual tabletop software. It helps you to manage tabletop role playing games
with remote friends/players.

Built from the `release/1.10` branch of
[rolisteam](https://invent.kde.org/rolisteam/rolisteam) with the Qt6 + CMake
build system.

## Package contents

This single package installs everything from the upstream build:

### Binaries (`/usr/bin`)

| Binary       | Description                                        |
|--------------|----------------------------------------------------|
| `rolisteam`  | The main virtual tabletop client                   |
| `roliserver` | The standalone server component                    |
| `dice`       | Command-line dice roller (from rolisteam-diceparser) |
| `rcse`       | Character sheet editor                             |
| `mindmap`    | Mindmap application                                |

### Libraries (`/usr/lib`)

Shared libraries used by the binaries above, including
`libdiceparser_shared.so` (built from
[rolisteam-diceparser](https://invent.kde.org/rolisteam/rolisteam-diceparser)).

### Desktop integration

- Desktop entries: `rolisteam.desktop`, `rcse.desktop`, `org.rolisteam.rolisteam.desktop`
- hicolor icons (16–256 px, plus scalable SVG)
- AppStream metainfo: `org.rolisteam.rolisteam.appdata.xml`

### Development headers (`/usr/include`)

`rolisteam/*.h`, `inja.hpp` and `json.hpp` are installed as well; they are
part of the upstream CMake install and are not needed at runtime.

## Translations

Translations are shipped as `.po` files in `poqm/<lang>/rolisteam_qt.po`
(34 languages). They are **not** committed as `.ts`/`.qm` files.

- `prepare()` converts every `.po` to `.ts` (via `lconvert`) and `.qm`
  (via `lrelease`) in the source tree.
- This is required because upstream `translations/CMakeLists.txt` globs
  `translations/*.qm` at CMake *configure* time; without the files present
  beforehand, the binaries are built without any translations embedded.
- `build()` always starts from a fresh build directory for the same reason:
  a reused CMake cache keeps a stale translations resource file.
- The compiled `.qm` resources are embedded in `rolisteam`, `roliserver`,
  `rcse`, `mindmap` and `dice` under the `:/translations` resource prefix.

## Build notes

- Sources are fetched from git: `rolisteam` (`release/1.10` branch) and
  `rolisteam-diceparser` (`master` branch).
- `prepare()` wires the fetched `rolisteam-diceparser` in as the
  `src/libraries/diceparser` git submodule of rolisteam.
- Requires Qt6: base, svg, multimedia, multimedia-ffmpeg, webengine, quick3d,
  quick3dphysics, remoteobjects, scxml, translations, webchannel, httpserver.
