# kitesurf-git

AUR package for [Kitesurf](https://github.com/cloudflare/kitesurf), Cloudflare's
browser engine for AI agents. This package installs both parts:

| Component         | Path                                            | Purpose                                                    |
| ----------------- | ----------------------------------------------- | ---------------------------------------------------------- |
| `kitesurf`        | `/usr/bin/kitesurf`                             | CLI that shows web pages in the terminal                   |
| `kitesurf-engine` | `/usr/bin/kitesurf-engine`                      | Local engine with a CDP (Chrome DevTools Protocol) endpoint |
| systemd service   | `/usr/lib/systemd/user/kitesurf-engine.service` | Runs the engine in the background as a user service        |

## 1. Run the engine

Start the service, and start it automatically when you log in:

```sh
systemctl --user enable --now kitesurf-engine
```

Make sure that the engine runs:

```sh
systemctl --user status kitesurf-engine
journalctl --user -u kitesurf-engine -f      # follow the log
curl http://127.0.0.1:8787/json/version      # the CDP endpoint replies
```

The engine serves these endpoints:

- Home page: <http://127.0.0.1:8787/>. It has DevTools, example pages and a
  list of the endpoints.
- CDP WebSocket: `ws://127.0.0.1:8787/devtools/browser`.

To run the engine without systemd:

```sh
kitesurf-engine                 # default: 127.0.0.1:8787
kitesurf-engine --port 9000
kitesurf-engine --help
```

After you upgrade the package, restart the service to use the new version:

```sh
systemctl --user restart kitesurf-engine
```

## 2. Configuration

If `~/.config/kitesurf-engine/env` exists, the service reads environment
variables from it. To make this file from the template in the package:

```sh
mkdir -p ~/.config/kitesurf-engine
cp /usr/share/doc/kitesurf-git/kitesurf-engine.env ~/.config/kitesurf-engine/env
$EDITOR ~/.config/kitesurf-engine/env
systemctl --user restart kitesurf-engine
```

Variables:

| Variable                         | Default       | Description                                                                                  |
| -------------------------------- | ------------- | -------------------------------------------------------------------------------------------- |
| `KITESURF_ENGINE_PORT`           | `8787`        | Port to listen on                                                                            |
| `KITESURF_ENGINE_HOST`           | `127.0.0.1`   | Address to bind. **The engine has no authentication**, so keep a loopback address.          |
| `KITESURF_ALLOW_PRIVATE_NETWORK` | _(off)_       | Set to `1` to let pages load `localhost` and LAN addresses, for example a local dev server. |
| `MINIFLARE_WORKERD_V8_FLAGS`     | `--expose-gc` | V8 flags for workerd. If you change this value, keep `--expose-gc`. Without it, the engine can run out of memory. |

Example `~/.config/kitesurf-engine/env`:

```sh
KITESURF_ENGINE_PORT=8787
KITESURF_ALLOW_PRIVATE_NETWORK=1
```

The service has a memory limit of `MemoryMax=4G`. To change the limit, make an
override:

```sh
systemctl --user edit kitesurf-engine
# add:
# [Service]
# MemoryMax=8G
```

> ⚠️ **Security:** the engine has no authentication. Anyone who can reach its
> port can browse the web through your computer. Bind an address other than
> `127.0.0.1` only behind a reverse proxy that authenticates users, such as
> Cloudflare Access.

## 3. Use the `kitesurf` CLI

The CLI shows web pages in the terminal.

```sh
# Use the local engine. No Cloudflare login is necessary.
KITESURF_SERVER=http://127.0.0.1:8787 kitesurf https://example.com/

# ANSI mode: selectable text, works in all terminals
KITESURF_SERVER=http://127.0.0.1:8787 kitesurf --mode=ansi https://example.com/

# Use Cloudflare Browser Run (OAuth; the CLI keeps the tokens in the keyring)
kitesurf login
kitesurf https://example.com/

# Use the public playground, kitesurf.dev
kitesurf --playground https://example.com/
```

To use the local engine by default, add this line to `~/.zshrc` or `~/.bashrc`:

```sh
export KITESURF_SERVER=http://127.0.0.1:8787
```

Notes:

- The default mode is Kitty graphics. It needs a terminal that supports Kitty
  graphics, such as Kitty or Ghostty. In other terminals, use `--mode=ansi`.
- `kitesurf login` needs an unlocked Secret Service keyring, such as KWallet or
  gnome-keyring.

## 4. Use with MCP (Claude Code, Cursor, …)

Kitesurf speaks CDP, so
[`chrome-devtools-mcp`](https://github.com/ChromeDevTools/chrome-devtools-mcp)
can connect to it with `--wsEndpoint`. An AI agent then controls Kitesurf with
tools such as `navigate_page`, `take_snapshot`, `take_screenshot`, `click` and
`fill`.

Requirements: the engine runs (section 1), and `nodejs` and `npm` are installed.

### Claude Code

```sh
claude mcp add kitesurf -s user -- \
  npx -y chrome-devtools-mcp@latest --wsEndpoint=ws://127.0.0.1:8787/devtools/browser
```

Check the server:

```sh
claude mcp get kitesurf      # Status: ✔ Connected
```

In Claude Code, the tools have names that start with `mcp__kitesurf__`. You can
ask for a task directly, for example: _"Use kitesurf to open
https://example.com and take a screenshot"_.

### JSON configuration (Claude Desktop, Cursor, Windsurf, …)

Add this server to the MCP configuration file of your client, for example
`~/.cursor/mcp.json` or `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "kitesurf": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--wsEndpoint=ws://127.0.0.1:8787/devtools/browser"
      ]
    }
  }
}
```

### Use Puppeteer directly

```js
import puppeteer from "puppeteer-core";

const browser = await puppeteer.connect({
  browserWSEndpoint: "ws://127.0.0.1:8787/devtools/browser",
});
const page = await browser.newPage();
await page.goto("https://example.com/");
await page.screenshot({ path: "page.png" });
await browser.disconnect();
```

### MCP notes

- Use port **8787**, the port that `kitesurf-engine` opens. `ps` can also show
  port 8788. That port is an internal workerd socket: do not point MCP at it.
- If you change `KITESURF_ENGINE_PORT`, change `--wsEndpoint` to match.
- Kitesurf supplies a CDP endpoint, not a full Chrome. Some chrome-devtools-mcp
  tools may not work yet, for example performance traces, Lighthouse and
  emulation.
- To let the agent open a local dev server (`localhost:3000`, …), set
  `KITESURF_ALLOW_PRIVATE_NETWORK=1`.

## 5. Troubleshooting

| Problem                                  | Solution                                                                          |
| ---------------------------------------- | --------------------------------------------------------------------------------- |
| The link fails with undefined symbols    | The package turns off LTO (`!lto`). If your `makepkg.conf` forces LTO, remove it. |
| `no engine build at …`                   | Reinstall the package: `yay -S kitesurf-git --rebuild`                            |
| The engine is killed when out of memory  | Increase `MemoryMax` (section 2) and keep `--expose-gc`                           |
| MCP cannot connect                       | Run `systemctl --user status kitesurf-engine` and check the port in `--wsEndpoint` |
| `kitesurf login` fails with a keyring error | Unlock KWallet or gnome-keyring, and make sure that a D-Bus session exists      |
| Pages cannot load `localhost`            | Set `KITESURF_ALLOW_PRIVATE_NETWORK=1`, then restart the service                  |

## Uninstall

```sh
systemctl --user disable --now kitesurf-engine
sudo pacman -Rns kitesurf-git
rm -rf ~/.config/kitesurf-engine
claude mcp remove kitesurf -s user   # if you added the MCP server
```
