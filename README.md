# opencode-bwrap

Run [opencode](https://opencode.ai) inside a [bubblewrap](https://github.com/containers/bubblewrap)
sandbox for filesystem isolation.

## Usage

```bash
opencode-bwrap [opencode-args…]
```

Works identically to `opencode` — all arguments are passed through.
The current directory is automatically bound into the sandbox
(unless it is `$HOME`).

## Customization

### Extra bwrap arguments

**Environment variable** — set `OPENCODE_BWRAP_EXTRA` to a space-separated
string of additional `bwrap` arguments:

```bash
export OPENCODE_BWRAP_EXTRA="--bind-try /opt/mytool /opt/mytool"
```

**Config file** — create `~/.config/opencode-bwrap/extra-args`, one argument
per line:

```
--bind-try /opt/mytool /opt/mytool
--ro-bind-try /data/projects /data/projects
```

Both sources are combined (env var first, then file).

## What gets bound

| Path | Mode | Purpose |
|---|---|---|
| `/usr` | ro-bind | System binaries and libraries |
| `/etc` | ro-bind | System configuration (passwd, ca-certificates, etc.) |
| `/dev` | dev-bind | Device access |
| `/proc` | bind | Process info |
| `/tmp` | bind | Temporary files |
| `/run/user/$UID` | bind-try | D-Bus, Wayland socket |
| `~/.config/opencode` | bind | OpenCode config |
| `~/.local/share/opencode` | bind | OpenCode data |
| `~/.local/state/opencode` | bind | OpenCode state |
| `~/.cache/opencode` | bind | OpenCode cache |
| `~/.gitconfig` | ro-bind-try | Git identity (if present) |
| `/tmp/.X11-unix` | ro-bind-try | X11 display socket (if `$DISPLAY` set) |
| `$XAUTHORITY` | ro-bind-try | X11 auth (if `$DISPLAY` set) |
| `$PWD` | bind | Current workspace (unless `$HOME`) |
| custom | — | Via `extra-args` or `$OPENCODE_BWRAP_EXTRA` |

## Sandbox properties

- Network access is enabled (`--share-net`) — required for LLM API calls.
- All other namespaces are unshared (`--unshare-all`).
- Parent death: `--die-with-parent`.
- Clipboard integration uses `OPENCODE_CLIPBOARD=native`.
