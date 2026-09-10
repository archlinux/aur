# high-tide-launcher-git

Arch package recipe that builds High Tide from the tip of `main` at
<https://github.com/MopigamesYT/High-Tide>.

```sh
makepkg -si
```

`makepkg` alone builds without installing. The version is derived from the
launcher crate version plus the commit count and short hash, so rebuilding after
an upstream push produces a newer package.

## What gets installed

| Path | Contents |
| --- | --- |
| `/usr/bin/high-tide` | Python wrapper that provisions the per-user workspace, then execs the launcher |
| `/usr/lib/high-tide/high-tide` | Release build of the GTK4 launcher |
| `/usr/lib/high-tide/backend` | Runtime backend template plus `backend-manifest.json` |
| `/usr/lib/high-tide/high-tide-capture-helper` | Capture helper invoked through polkit |
| `/usr/share/applications` | Desktop entry `dev.hightide.Launcher.desktop` |
| `/usr/share/icons/hicolor/scalable/apps` | Launcher icon |
| `/usr/share/polkit-1/actions` | `dev.hightide.capture` action |

On first run the wrapper copies the backend template to
`$XDG_DATA_HOME/high-tide/workspace`, default `~/.local/share/high-tide/workspace`.
Upgrades replace only files the manifest lists and drop generated loader jars so
they rebuild against updated sources. A retired file that you edited locally is
moved to `.retired-package-files` rather than deleted. Captures, payloads, the
Wine prefix, HWID, logs and settings are never touched, and uninstalling leaves
them in place.

## Source layout

The upstream repository no longer carries a `packaging/` directory, so the
recipe keeps its own copies of the pieces that are not built from source:

- `collect_backend.py` stages the runtime backend from an explicit allowlist and
  writes the manifest. It fails loudly if the checkout is missing an entry.
- `high-tide` is the wrapper installed to `/usr/bin`.
- `test_workspace.py` covers the wrapper's upgrade and retirement behaviour, and
  runs during `check()`.
- The desktop entry, polkit policy and license notice are installed verbatim.

## Notes

- The checkout is cloned into a directory named after the package, not
  `high-tide`, because the wrapper source file already claims that name in
  `$srcdir`.
- `!strip` is set. The prebuilt native bridges ship byte for byte and cannot be
  rebuilt from the source in this repository. `namcap` reports them as unstripped
  and lacking full RELRO, which is expected.
- The launcher binary targets baseline x86-64, not the build machine's CPU.
- Wine, wireshark-cli, nftables and polkit are optional. They matter only for
  account sign-in and payload extraction, not for running an existing payload.
- `license=('LicenseRef-Unknown')` records that the project declares no
  distribution license. See `LICENSE-NOTICE`. Review that before publishing this
  recipe to the AUR.
