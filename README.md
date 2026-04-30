# libcamera-ipu6

> Arch Linux package: libcamera with the out-of-tree Intel IPU6 pipeline handler from kervel/libcamera, so PipeWire / Snapshot / Signal / Chromium see IPU6 webcams natively — without `v4l2-relayd` / `v4l2loopback`.

Provides a drop-in replacement for the stock `extra/libcamera` split
packages, declaring `provides`/`conflicts`/`replaces` for each:
`libcamera`, `libcamera-ipa`, `libcamera-tools`, `gst-plugin-libcamera`,
`python-libcamera`. Installing this removes the stock `libcamera*`.

The pipeline handler comes from
[kervel/libcamera@ipu6-pipeline-handler][kervel-fork] and wraps Intel's
proprietary `libcamhal` so the camera is exposed to libcamera as a
real pipeline (not via the legacy `libcamhal → icamerasrc → v4l2-relayd
→ v4l2loopback` shim that has historically been the recommended path on
Arch).

[kervel-fork]: https://github.com/kervel/libcamera/tree/ipu6-pipeline-handler

> **Heads up — closed binary blobs required.** The IPU6 pipeline
> handler is a thin shim over Intel's proprietary **`libcamhal`**,
> which in turn requires Intel's closed-blob firmware/`.aiqb` tuning
> files and an out-of-tree PSYS kernel module. None of these are
> redistributable in a form Arch's main repos accept; they live in
> AUR. If a fully open ISP path (libcamera SoftISP) ever gains parity
> for your sensor, prefer that over this package.

## Table of Contents

- [Background](#background)
  - [Hardware support](#hardware-support)
  - [What this package fixes that you won't find documented elsewhere](#what-this-package-fixes-that-you-wont-find-documented-elsewhere)
    - [1. Process-global libcamhal init](#1-process-global-libcamhal-init-0002-ipu6-make-libcamhal-init-process-globalpatch)
    - [2. `uaccess`-tagged udev rule](#2-uaccess-tagged-udev-rule-99-ipu6-psysrules)
    - [3. `SystemCallFilter=@ipc` drop-in](#3-systemcallfilteripc-drop-in-10-libcamera-ipu6-ipcconf)
    - [4. `wait-libcamhal-shm` ExecStartPre](#4-wait-libcamhal-shm-execstartpre-the-deepest-one)
- [Install](#install)
  - [Dependencies](#dependencies)
  - [Building and installing](#building-and-installing)
- [Usage](#usage)
  - [Verification / smoke tests](#verification--smoke-tests)
  - [Chromium-based clients need an extra flag](#chromium-based-clients-need-an-extra-flag)
  - [Troubleshooting](#troubleshooting)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Background

### Hardware support

Tested on **Dell Latitude 5470 (Alder Lake, IPU6**EP**, OV01A10
sensor)**. Should work on any IPU6/IPU6EP-class laptop whose sensor is
supported by `libcamhal` and either by mainline libcamera or by the
in-tree patches kervel ships (currently OV01A10 plus whatever's in
`kervel/libcamera-ipu6/patches/`).

If you have a different sensor, you may need to:
1. Add the sensor's tuning `.aiqb` file (shipped with
   `intel-ipu6-camera-bin`).
2. Add a `CameraSensorHelper` registration for it; OV01A10's lives in
   `0001-ipa-Add-OV01A10-sensor-helper.patch` and is a useful template.
3. Add a `camera_sensor_properties.cpp` entry if libcamera 0.7+ doesn't
   already have one (and remember the `.sensorDelays` field — see PKGBUILD).

PRs to extend hardware coverage are welcome.

### What this package fixes that you won't find documented elsewhere

This package is more than just kervel's fork repackaged for Arch — it
ships four small but load-bearing fixes for issues that surface only on
Arch's specific stack (systemd-hardened pipewire/wireplumber, GDM with
`DynamicUser=`, current libcamera 0.7). They're listed here so that if
something regresses, future-you (or another maintainer) knows what each
piece is *for* and can decide whether to keep, drop, or revisit it.

#### 1. Process-global libcamhal init (`0002-ipu6-make-libcamhal-init-process-global.patch`)

`libcamhal`'s `camera_hal_init()` / `camera_hal_deinit()` pair is
process-global, with an internal `mInitTimes` refcount and a per-process
SysV shared-memory segment lazy-attached on first init. Kervel's bridge
guarded it with a per-instance `halInitialized_` member, but libcamera
enumerates the same plugin twice in one process (probe + match), so
`mInitTimes` climbed to 2 and on subsequent re-init cycles the SHM
segment was dropped, then later `camera_device_open` failed with
`No attached camera shared memory!`.

Fix: a process-static `std::once_flag` + `std::atomic<int>` so
`camera_hal_init()` runs *exactly once* per process, and the destructor
no longer calls `camera_hal_deinit()` (let the OS reclaim libcamhal
state at process exit).

Smoking gun if this regresses: `cam -c 1 -I` showing
`already initialized, mInitTimes:2` on a *fresh* invocation.

#### 2. `uaccess`-tagged udev rule (`99-ipu6-psys.rules`)

`/dev/ipu-psys0` is `root:video 0660` by default. PipeWire/WirePlumber
running under your `systemd --user` manager would normally inherit your
`video` group membership, except: **systemd `--user` freezes
supplementary groups at session start**. If you were added to `video`
*after* your user manager started, your PipeWire process isn't in
`video`, even though `groups` in a fresh shell says you are.

Fix: rule sets `TAG+="uaccess"` on the IPU6 PSYS chardev (and the
forthcoming `intel-ipu6-psys` / `intel-ipu7-psys` subsystem names), so
logind grants per-session ACL access to the active-session user
independent of group membership. Same scheme `/dev/video*` already uses.

Symptom if this regresses: `Failed to open PSYS, error: Permission denied`
in libcamhal logs, surfacing as `error -67 (Link has been severed)` from
`pw_stream` in clients.

#### 3. `SystemCallFilter=@ipc` drop-in (`10-libcamera-ipu6-ipc.conf`)

Stock `pipewire.service` and `wireplumber.service` set
`SystemCallFilter=@system-service mincore`. `libcamhal` uses SysV shared
memory (`shmget`/`shmat`/...), and on at least some configurations
`shmget` was being blocked by seccomp despite `@system-service`
nominally including `@ipc`. The drop-in adds an explicit
`SystemCallFilter=@ipc` to both units. Belt-and-braces, but harmless and
defensive — costs nothing if it's redundant on your system.

#### 4. `wait-libcamhal-shm` ExecStartPre (the deepest one)

`libcamhal` calls `shmget(0x43414d /* "CAM" */, 8192, 0640)` from a
constructor that fires at the IPU6 plugin's **`dlopen` time** — before
*any* of our pipeline-handler code has a chance to run. The segment it
creates is owner-only (mode 0640).

If GDM is your display manager, GDM's greeter spawns its own wireplumber
under a `DynamicUser=` transient uid (some high uid like 60578, gid 120
= `gdm`). That greeter wireplumber loads libcamera-ipu6 at boot and
creates the segment owned by *gdm*. By the time you log in, gdm's user
manager is exiting, but its libcamhal segment may still be attached
(`nattch=1`). Your wireplumber then races: `shmget(0x43414d, 8192, 0640)`
returns **EACCES** because owner=gdm, group=gdm, mode-other=0, and
your uid is in neither slot. libcamhal logs a single
`Fail to allocate shared memory by shmget.` and continues running but
in a wedged state — every later `camera_device_open` returns
`No attached camera shared memory!`.

Fix: a tiny C helper `/usr/lib/libcamera-ipu6/wait-libcamhal-shm` wired
up as `ExecStartPre=` on both pipewire and wireplumber units. It polls
the shm key every 100 ms and exits 0 once it gets a successful lookup,
`ENOENT`, or any non-`EACCES` errno (10-second timeout, then proceed
anyway). Because it runs *before* the main process starts, libcamhal's
`dlopen` constructor sees a clean state and the race never triggers.

The race is timing-sensitive; `strace`'s per-syscall overhead masks it,
which is why nobody noticed it for a long time. If you only sometimes
have a working camera after reboot, **that's this bug**. The fix
should be permanent.

## Install

### Dependencies

| Package | Source | Purpose |
| --- | --- | --- |
| `intel-ipu6-camera-hal-git` | AUR | Provides `libcamhal` itself (the proprietary HAL kervel's pipeline handler wraps). **Hard `depends`** at runtime and `makedepends` at build time. |
| `intel-ipu6-dkms-git` | AUR | Out-of-tree `intel_ipu6_psys` kernel module. Mainline kernel ships the IPU6 ISYS driver, but PSYS is still out-of-tree, and `libcamhal` opens `/dev/ipu-psys0` — so this module is required for any frames to flow. **Hard runtime dependency.** |
| `intel-ipu6-camera-bin` | AUR | Closed-blob firmware and per-sensor `.aiqb` tuning files. **Hard runtime dependency.** |

This package's `depends=` array has the runtime ones; build the package
on a machine that has `intel-ipu6-camera-hal-git` installed.

### Building and installing

```sh
git clone https://aur.archlinux.org/libcamera-ipu6.git
cd libcamera-ipu6
makepkg -si
```

Then either reboot, or restart the audio/portal stack:

```sh
systemctl --user restart pipewire pipewire-pulse wireplumber xdg-desktop-portal
```

After installation:

* `cam -l` should list your sensor under pipeline handler **`ipu6`**
  (not `simple`).
* PipeWire should expose a node `libcamera_input.ipu6-<sensor>-<n>`
  with `media.role=Camera`. `gst-device-monitor-1.0 Video/Source` should
  show it as a `Built-in Front Camera` (or whatever facing).
* Snapshot should give a live preview. Signal Desktop should list the
  camera in *Settings → Calls* (see [Chromium-based clients need an extra flag](#chromium-based-clients-need-an-extra-flag)).

## Usage

### Verification / smoke tests

In rough order of "if this fails, things downstream will too":

```sh
# libcamera sees the camera under the right pipeline handler
cam -l
# Expect: pipeline handler `ipu6`, sensor name like `ipu6-ov01a10-uf-0`.

# libcamera + libcamhal can pull frames end-to-end
cam -c 1 -C5
# Expect: 5 frames, ~30 fps, no `CamHAL[ERR]` lines.

# GStreamer libcamerasrc works
gst-launch-1.0 libcamerasrc ! videoconvert ! fakesink num-buffers=10 -v
# Expect: caps negotiated, EOS after 10 buffers, no errors.

# PipeWire sees the libcamera node
gst-device-monitor-1.0 Video/Source
# Expect: a device with `device.api = libcamera`, `media.class = Video/Source`.

# Wireplumber didn't hit the boot race
journalctl --user -u wireplumber.service -b | grep -i 'shared memory'
# Expect: empty (no `Fail to allocate shared memory by shmget`).
```

Then test an actual GUI client: `snapshot` → live preview, or
`signal-desktop --enable-features=WebRtcPipeWireCamera` → *Settings →
Calls* shows the camera.

### Chromium-based clients need an extra flag

Snapshot uses GStreamer's pipewire client and "just works" once the
four fixes above are in place. But Chromium's WebRTC stack (so:
Chromium, Chrome, Electron apps like Signal Desktop, Discord, Slack,
Element, …) defaults to its v4l2 capturer. On IPU6 hardware the v4l2
nodes are ISYS subdevs that expose raw bayer, which is unusable for
video calls — so cameras either don't appear or are listed as broken.

The fix is the runtime feature flag **`WebRtcPipeWireCamera`**, which
routes camera capture through `xdg-desktop-portal` Camera (and through
us, since we're the libcamera node it eventually opens). For one-off
testing:

```sh
signal-desktop --enable-features=WebRtcPipeWireCamera
```

For a persistent fix per app, drop a `~/.local/share/applications/<app>.desktop`
override of the system .desktop file with the flag baked into `Exec=`,
or for native Chromium itself add the flag to `~/.config/chromium-flags.conf`.

This isn't something this package can fix system-wide without dragging
along weird hooks; it's a per-client tweak.

### Troubleshooting

If the camera *suddenly* stops working after it was fine, in priority
order:

1. **Check for the boot race.** `journalctl --user -u wireplumber.service -b
   | grep -iE 'shared memory|wait-libcamhal-shm'`. Either of:
   * `Fail to allocate shared memory by shmget` → the wait helper
     didn't run or didn't help. Verify `systemctl --user cat
     wireplumber` shows the `ExecStartPre=/usr/lib/libcamera-ipu6/wait-libcamhal-shm`
     line.
   * `wait-libcamhal-shm: key 0x43414d still held by another uid after 100 iterations`
     → the timeout is too short for your system; increase `max_iters`
     in `wait-libcamhal-shm.c` and rebuild. File a bug, that's
     interesting.
2. **Permission errors on `/dev/ipu-psys0`.** `getfacl /dev/ipu-psys0`
   should show `user:<you>:rw-`. If not, check that the udev rule is
   installed (`/usr/lib/udev/rules.d/99-ipu6-psys.rules`) and triggered
   (`sudo udevadm trigger --action=change /dev/ipu-psys0`). If still
   broken, your logind session probably isn't `Active=yes` —
   `loginctl show-session $XDG_SESSION_ID | grep Active`.
3. **`cam -l` doesn't show the camera.** Check kernel modules:
   `lsmod | grep -E 'intel_ipu6|ov01a10'` should show both `intel_ipu6_isys`
   and `intel_ipu6_psys`. If `intel_ipu6_psys` is missing, reinstall
   `intel-ipu6-dkms-git` and `dkms install` it.
4. **`cam -l` shows the camera but `cam -c 1 -C5` fails.** Likely a
   firmware/.aiqb mismatch. Confirm `intel-ipu6-camera-bin` is current
   and includes the right `.aiqb` for your sensor (check
   `/usr/lib/firmware/intel/ipu/`).

## Maintainers

The four fixes are not yet upstreamed. Open kervel-side work:
* (1) → upstream issue + PR on `kervel/libcamera` for the lifecycle fix.
* (4) → less obvious where to land; might be a libcamhal-side change,
  or a libcamera SPA initialization sequencing change in pipewire-libcamera.

When mainline libcamera advances past 0.7, this package will need a
coordinated rebase: kervel's tree first, then us. Until then, pinned
to `kervel/libcamera@ipu6-pipeline-handler` sha
`48748f15ad5db0358e00a1643e924f19d3f1ea10`.

## Contributing

Bugs / hardware-coverage PRs / "this fixed it for me on $LAPTOP"
reports welcome — file at the AUR comments page for this package.

Patches against the local fixes (the four sections above) should
target this repository. Patches against the IPU6 pipeline handler
itself should generally go upstream to
[kervel/libcamera][kervel-fork] first; once accepted there we'll
drop our local copy.

### Credits

* Pipeline handler and OV01A10 patches: [@kervel](https://github.com/kervel/libcamera)
  — the actual hard work.
* Original `extra/libcamera` PKGBUILD: David Runge, Carl Smedstad
  (Arch maintainers). This package's `package_*()` and license
  layout are forked from theirs.
* libcamhal: Intel (closed source).
* `intel-ipu6-camera-hal-git`, `intel-ipu6-camera-bin`,
  `intel-ipu6-dkms-git`: respective AUR maintainers.

## License

The packaged software is a composite of multiple licenses, enumerated
in the PKGBUILD's `license=` array (Apache-2.0, CC0-1.0, GPL-2.0-only
WITH Linux-syscall-note, GPL-2.0-or-later, LGPL-2.1-or-later, plus
some dual-license variants). See `usr/share/licenses/libcamera-ipu6/`
after install for the full texts.

The local glue authored for this AUR package — PKGBUILD,
`wait-libcamhal-shm.c`, the systemd / udev / environment.d snippets,
patches against kervel's tree, and this README — is offered under
**LGPL-2.1-or-later** to match libcamera's own license.
