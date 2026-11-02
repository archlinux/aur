# Upgrading Owlry

## Upgrading to 2.8.1

2.8.0 changed the IPC activation schema. 2.8.1 fixes socket activation
migration from 2.7.0. The Arch package's post-transaction hook checks live
systemd user managers, reloads their units, and migrates active Owlry sockets
when the running executable differs from the installed binary or the socket
path is missing. It stops both Owlry units before starting the socket, so an
old daemon cannot unlink the replacement socket. Future binary-changing
upgrades use the same path. Healthy sockets and deliberately inactive units
are left alone.

Check pacman output for migration failures. The package transaction is already
committed when this hook runs; a migration failure does not roll it back. Each
user-manager operation has a timeout, but total hook time scales with the number
of running user managers. There are no automatic retries.

An interrupted migration keeps pending state in the affected user's runtime
directory. Retry as that user, without reinstalling:

```bash
systemctl --user start owlry-user-migrate.service
```

Pending state is cleared after socket restoration and disappears at reboot.
A retry with pending state restores the socket even if it was stopped in the
meantime. Managers that are not running at upgrade time need no migration;
their next normal startup uses the new units.

Automatic migration supports the packaged default socket path. A socket unit
overridden to listen elsewhere is left alone; manage its upgrade and recovery
manually. If a custom configuration replaces the default while migration is
pending, the helper reports failure without changing either unit or clearing
pending state. Recover using your configured socket path and units:

```bash
systemctl --user stop owlry.service owlry.socket &&
systemctl --user start owlry.socket &&
OWLRY_SOCKET=/absolute/path/to/your/socket owlry doctor |
    grep -E '^\[providers\][[:space:]]+[0-9]+ registered$' &&
rm -f -- "$XDG_RUNTIME_DIR/owlry-migrate/pending"
```

Run this as the affected user. The service's `OWLRY_SOCKET` must match its
socket unit's `ListenStream`, and clients must use that same path. Each step
depends on the preceding step succeeding. `doctor` itself exits zero even when
IPC is unreachable, so the explicit providers-response check must pass before
the old pending marker is cleared.

The 1.x `owlryd` unit-name migration below also remains manual.

If you use only `owlry.service` without socket activation, the hook leaves it
running. Restart it yourself after upgrading so it uses the new executable:

```bash
systemctl --user restart owlry.service
```

If you run the daemon manually (no systemd socket unit), stop the old
`owlry -d` process and start it again.

If the UI reports that a legacy shell payload was refused, the running daemon
is still the old version. Restart it.

### Behavior changes in 2.8.0

- Shell syntax in the search field requires the explicit `:shell` prefix.
  `:cmd` remains a PATH-command filter. Typing `program args` launches argv
  without a shell.
- Lua provider items should use `program`, `args`, and `stdin`. `command`
  strings still work for simple cases, but they are parsed into argv, and
  items with unquoted shell metacharacters are dropped with a warning.
- Desktop handlers that explicitly invoke a shell are refused on the
  terminal-handler and open-with paths. Owlry falls back to `xdg-open` or
  `gio launch`.
- `OWLRY_SOCKET` must be absolute, and its parent must be private to the
  current user or a root-owned sticky directory.
- The frecency file is created and tightened to 0600.

## Upgrading from 1.x

The 2.0 release collapsed the old package set into one `owlry` package. The
AUR package uses `replaces` and `conflicts` so `paru` or `pacman` swaps the
old packages automatically. The retired names include `owlry-core`,
`owlry-lua`, `owlry-rune`, every `owlry-plugin-*` package, and the
`owlry-meta-*` bundles.

The daemon binary and units were renamed:

- `owlryd` is now `owlry -d` (or `owlry daemon`).
- `owlryd.service` and `owlryd.socket` are now `owlry.service` and
  `owlry.socket`.

After upgrading, remove stale user units that shadow the package units:

```bash
ls ~/.config/systemd/user/owlryd.* 2>/dev/null
systemctl --user daemon-reload
systemctl --user enable --now owlry.service
```

If a compositor autostart entry still runs `owlryd`, change it to `owlry -d`.

## TOML to Lua

The Lua configuration is preferred. To migrate an existing `config.toml`:

```bash
owlry migrate-config              # writes owlry.lua; refuses to overwrite
owlry migrate-config --force      # overwrite an existing owlry.lua
```

The migrator is deterministic and emits only values that differ from
defaults. It normalises pre-v2 aliases such as `system` to `power` and
`badge_sys` to `badge_power`.

TOML remains supported through 2.x. When `owlry.lua` exists, `config.toml` is
ignored entirely.

## After upgrading

```bash
owlry --version    # owlry 2.8.1
owlry providers
owlry doctor
```

`owlry doctor` reports config status, the socket, provider availability, and
stale pre-v2 files. It is read-only.
