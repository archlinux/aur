# xTool Studio on Linux

Analysis of, and a working Linux build for, **xTool Studio 1.9.11** (the
successor of xTool Creative Space / XCS) for xTool M1-class machines.

Upstream ships Windows and macOS only. Nothing in this repository redistributes
the application: `build.sh` repacks the *official* installer you already have
into a native Linux application.

---

## 1. What the official build actually is

| Property | Value |
| --- | --- |
| Installer | NSIS 3, `$PLUGINSDIR/app-64.7z` (664 MB) |
| Runtime | Electron 36.2.0 (Chromium 136, Node 22.15) |
| App entry | `resources/app.asar` → `.vite/build/main.js` (ESM main process) |
| UI | Vue 3 micro-apps + per-device extensions (`exts.zip`, 25 bundles) |
| Algorithm worker | `resources/tools/algo-server/algo-server-win32-x64.exe` + 9 plugin DLLs |

### Native dependencies of the main process

`resources/app.asar` depends on exactly three native modules:

| Module | Purpose | Linux available? |
| --- | --- | --- |
| `usb@2.18.0` | device detection (VID/PID) | **yes**, N-API prebuilds on npm |
| `@serialport/bindings-cpp@13.0.0` | USB-serial | **yes**, N-API prebuilds on npm |
| `@atomm-studio/system-rs@0.13.0` | host info only (process tree, memory, OS) | prebuilds are private (makeblock Nexus, RFC1918), but the crate is trivial |

`algo-server` is the one real problem: it is a closed-source Rust binary whose
Windows build exposes its HTTP API over a **Win32 named pipe**. Its plugin
manifests already declare `lib_*.{so,dylib,dll}`, so the loader is
platform-aware, but no Linux binary is shipped anywhere (verified: the
makeblock package registry is an internal `172.16.50.231` host, and the
[release notes](https://support.xtool.com/article/1773) list Windows +
macOS only as of 2026-09-11).

### How devices connect

Per `resources/ext.json`, M1 (`deviceCode: MLM`) uses `channelType: "socket"`:
the machine exposes an HTTP server (`/system?action=version_v2`,
`/net?action=ifconfig`, `/getlaserpowertype`) reachable over its USB network
interface (`169.254.2.1`, and `201.234.3.x` / `172.25.3.x` per platform) or over
Wi-Fi. So device I/O on Linux is ordinary TCP plus USB/Wi-Fi discovery — no
kernel driver port is needed.

---

## 2. What this port changes

Everything is applied to a copy of the official application; the original
installer is untouched.

1. **Runtime swap** — the official `electron-v36.2.0-linux-x64` build supplies
   the Chromium/Node runtime. Feature detection in the app (`isXtoolPatched`)
   simply degrades two optional memory-trim features to no-ops.
2. **Native modules** — Linux prebuilds of `usb` and `@serialport/bindings-cpp`
   are installed from npm; `@atomm-studio/system-rs` is replaced by
   `tools/system-rs-linux/index.js`, a pure-JS implementation of the documented
   API (`getMemoryInfo`, `getOsInfo`, `getAppProcesses`) reading `/proc` and
   `/etc/os-release`.
3. **Worker stdio guard** — `tools/worker-stdio-guard.js` is prepended to the
   forked service workers. Node's console re-throws `EPIPE` **synchronously**
   from its write callback when a worker's stdio pipe is closed, which lands in
   the worker's own `uncaughtException` handler; that handler logs via
   `console.error`, so it throws again and the worker dies in a loop.
4. **Algorithm worker via Wine** — `tools/algo-ipc-bridge.c` is a ~110-line
   mingw helper that binds the AF_UNIX socket path the app expects and tunnels
   each connection to a fresh instance of the algo-server's named pipe. Wine
   exposes AF_UNIX sockets as real Linux sockets (verified with `ss -xl`), so
   the app is *not* patched: `tools/algo-server-linux-x64` is a launcher shim
   that starts Wine, the server and the bridge.
5. **GTK 3 pin** — Chromium 136 initialises GTK4 while GTK3 is already loaded,
   aborting with `GTK 2/3 symbols detected`. The launcher passes
   `--gtk-version=3`.
6. **Vendored `kill-port` self-kill** — the bundled `kill-port@2.0.1` frees a
   port with
   `lsof -i <proto>:<port> | grep LISTEN | awk '{print $2}' | xargs kill -9`.
   The legacy multicast discovery server uses it to free UDP 20000 — the port
   the discover worker itself holds — so the worker SIGKILLs *itself* ~1 s after
   startup and device discovery dies with `worker has exit`. `build.sh`
   rewrites the helper to `lsof -t -i … | grep -v -x -e "$$" -e "$PPID" |
   xargs -r kill -9`, which still evicts a stale holder but never ourselves.

---

## 3. Verified behaviour

Everything below was observed on Arch Linux, GNOME/Wayland, x86_64, from the
built tree (`dist/xtool-studio`).

| Check | Result |
| --- | --- |
| Main process boots | `isPackaged: true`, `app_version 1.9.11`, `electron 36.2.0`, `platform linux` |
| UI | window `xTool Studio` mapped; country select → privacy policy → launch window → tabs; micro-apps `home`, `system-settings` mount |
| Extensions | `extHandler` loads 25 extensions; `/getlaserpowertype`, `/system?action=version_v2` parsers registered for M1 |
| Native modules | `usb` + `serialport` load; `USB Detect Service` starts and stays up; `[SerialPortManager]` initialises; serial scan completes |
| Host info | startup log reports real memory/OS data from the JS `system-rs` port |
| Algorithm worker | the app itself spawns the shim; its log shows `path_planning`/`ApplyCorrectSync` → **`invoke succeeded output_len=124 elapsed_ms=577`**, `POST /api/v1/invoke status=200` |
| **Real xTool M1 (USB + Wi-Fi)** | discovered: `targetId 10.0.0.94`, `name xTool_M1_v2_`, `sncode MLM22120596296BAC2`; machine profile fetched over HTTP; `[DeviceService] Registering reconnection … method: WIFI / USB`, priority `['USB','WIFI']`; UI opens the `M1` device tab |

### Known limitations

* **Workstation network setup for USB.** The machine's USB gadget is an RNDIS
  NIC whose `usb0` address is `201.234.3.1/24` and which runs a DHCP server.
  NetworkManager auto-creates that link as *link-local only*, so it must be
  switched to DHCP once:

  ```sh
  nmcli connection modify "$(nmcli -g GENERAL.CONNECTION device show enp0s20f0u3u1i1)" \
      ipv4.method auto
  ```

  It then leases `201.234.3.2` and `http://201.234.3.1:8080/system?action=version_v2`
  answers. Wi-Fi needs no setup (`http://<machine-ip>:8080/...`).
* **No physical job executed.** Design loading, device discovery, machine
  profile fetch and path-planning invoked from the app are verified; actually
  firing the laser was deliberately not attempted.
* **Sandbox** — with `--no-sandbox` the app runs; the `chrome-sandbox` helper
  needs mode 4755 when installed system-wide (the `PKGBUILD` does this).

---

## 4. Build

```sh
./build.sh                 # uses ./xTool-Studio-x64-1.9.11.exe
# or
INSTALLER=/path/to/xTool-Studio-x64-1.9.11.exe ./build.sh
```

Requirements: `p7zip asar nodejs npm curl unzip python wine mingw-w64-gcc`
(plus an ImageMagick binary for the icon, optional).

`OFFLINE` overrides: `ELECTRON_ZIP_PATH`, `USB_TGZ`, `SERIALPORT_TGZ`.

The Electron runtime version is **read from the installer payload**, so a new
release only needs a new installer URL.

### Checking for / building a new release

```sh
./build.sh --check          # compares ./build.sh's version with xTool's version history
```

It prints the newest `xTool-Studio-x64-<ver>.exe` it finds on
<https://support.xtool.com/article/2419> and, when newer, the exact command:

```sh
APP_VER=1.10.x INSTALLER_URL='<url printed above>' ./build.sh
```

All port patches are re-applied by the build; only re-check the native-module
section in `build.sh` if the payload's `package.json` gains a new `.node`
dependency (the build fails loudly if the `kill-port` pattern disappears).

Output: `dist/xtool-studio/`, run `dist/xtool-studio/xtool-studio-launcher`.

System-wide install on Arch: `makepkg -si` with the provided `PKGBUILD`
(installs to `/usr/lib/xtool-studio`, launcher `/usr/bin/xtool-studio`).

---

## 5. Alternative: run the whole Windows app under Wine

Tested and it does start (`platform: win32`, Electron 36.2.0 main process
running for 75 s), which removes the algorithm-worker problem entirely because
everything is the genuine Windows build. It trades the native UI/runtime for
Wine's Chromium and requires Wine to expose the machine's USB network interface
and serial port. Keep it as a fallback if a feature is missing from the native
port:

```sh
cd /path/to/extracted/app     # contains 'xTool Studio.exe'
wine 'xTool Studio.exe' --no-sandbox --disable-gpu
```

---

## 6. Repository layout

The layout is flat on purpose: `makepkg` resolves local `source=()` entries by
basename in the PKGBUILD's directory, and the AUR repository is what `build.sh`
runs against.

```
build.sh                     reproducible builder (this is the entry point)
PKGBUILD / .SRCINFO          Arch package (see AUR.md)
xtool-studio.install         pacman post-install notes
algo-ipc-bridge.c            AF_UNIX <-> named pipe bridge (mingw)
algo-server-linux-x64        algo-server launcher shim (Wine + bridge)
system-rs-index.js/.d.ts     pure-JS replacement for @atomm-studio/system-rs
worker-stdio-guard.js        EPIPE-tolerant worker stdio
xtool-studio.desktop         desktop entry
README.md / AUR.md           this document / packaging notes
说明.txt                      original request
```

Build artifacts (`work/`, `dist/`, `src/`, `aurpkg/`, `pkg/`) and the downloaded
installer are not part of the repository.
