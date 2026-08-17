# Optional Omarchy integration

The base `prettyzap-bin` package is intentionally Omarchy-neutral. It installs
a standard desktop entry, which is enough for the Omarchy application menu to
discover PrettyZap automatically.

The optional `prettyzap-omarchy` package adds the native Quickshell
integration:

- **Omarchy bar widget** (`prettyletto.prettyzap`) — a bar icon that opens and
  hides PrettyZap, plus a popup panel with Open / Hide, Settings, and the
  WhatsApp/System theme toggle.
- **Standalone Quickshell widget** — the same widget as a floating pill for
  Quickshell users who are not on Omarchy's shell.
- **Command-menu entry** — the original optional menu item.

Package installation does not edit `~/.config/omarchy/shell.json`,
`~/.config/omarchy/extensions/omarchy-menu.jsonc`, or any file under
`/usr/share/omarchy`. You opt in explicitly:

## Setup (one command)

```bash
prettyzap-omarchy-setup            # install + enable the Omarchy bar widget
prettyzap-omarchy-setup --standalone   # install the standalone Quickshell widget
prettyzap-omarchy-setup --uninstall    # remove both
prettyzap-omarchy-setup --section center  # pick left, center, or right
```

`--plugin` is the default. It copies the widget into
`~/.config/omarchy/plugins/prettyletto.prettyzap/` and runs Omarchy's own
additive `omarchy plugin enable` — exactly one entry joins one bar section,
nothing else in your `shell.json` changes. `install.sh` asks which side of the
bar you want the icon on (default right); `--section left|center|right` or the
`PZ_BAR_SECTION` environment variable skip the prompt for scripted installs.

The standalone widget is installed to `~/.config/quickshell/prettyzap/` and
run with `quickshell -p ~/.config/quickshell/prettyzap`.

## Command-menu entry (optional)

The packaged menu snippet lives at
`/usr/share/prettyzap/omarchy/omarchy-menu.jsonc`. To use it, merge the
`apps.prettyzap` object into
`~/.config/omarchy/extensions/omarchy-menu.jsonc`. The Omarchy shell watches
that user-owned file and will reload the menu. Remove the object to disable
the entry; uninstalling this package never removes or rewrites the user's
configuration.

## Uninstall

`prettyzap-omarchy-setup --uninstall` disables the plugin and removes both
installed copies. Removing the package itself never touches `~/.config/`.
