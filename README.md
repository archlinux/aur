# s32-design-studio

Arch Linux package for **NXP S32 Design Studio for S32 Platform 3.6.10**, the
Eclipse based IDE for editing, building, debugging and flashing NXP S32
(Kinetis, LPC, S32K, S32G, SAF) designs.

The vendor tree is installed into `/opt/s32-design-studio` and owned by pacman:
there is no container, no image and no container runtime involved, so upgrades
and removals work like for any other package.

## Files

| Path | Contents |
| --- | --- |
| `/opt/s32-design-studio` | The IDE, bundled Java 17, GCC 11.4 cross toolchains, gdb, S32 Debugger, PEmicro and SEGGER debugger support, driver payloads, help and release notes |
| `/usr/bin/s32ds` | Launcher; all arguments are passed to the Eclipse launcher, e.g. `s32ds -data ~/projects/s32-workspace`. Pins `GDK_BACKEND=x11` for JavaFX, see below |
| `/usr/share/applications/s32-design-studio.desktop` | Desktop entry (installed mode 0755 on purpose) |
| `/usr/share/icons/hicolor/48x48/apps/s32-design-studio.png` | Application icon |
| `/usr/lib/udev/rules.d/60-s32-design-studio.rules` | udev rules for the supported debug probes |
| `s32-design-studio.install` | Install scriptlet: reloads the udev rules so the debug probe rules take effect without a reboot |
| `/usr/share/licenses/s32-design-studio/` | Packaging license notes; the NXP EULA itself is in `/opt/s32-design-studio/License` |

## Building

The NXP installer cannot be downloaded without an nxp.com account, so it has
to be placed next to the PKGBUILD first:

```sh
cp SW32_S32DS_3.6.10_RFP_D2607_linux.x86_64.bin s32-design-studio/
cd s32-design-studio
makepkg -si
```

The build needs roughly 20 GB of free space: the installer unpacks 2.9 GB of
archives and extracts about 5 GB of files, all inside `src/s32ds-build`.
A single pass takes 10 to 20 minutes, most of it spent in the vendor installer.

### How the vendor installer is driven

`SW32_S32DS_3.6.10_RFP_D2607_linux.x86_64.bin` is an InstallAnywhere 22 self
extractor. The PKGBUILD runs it unattended and keeps every side effect inside
the build directory:

* `IATEMPDIR`, `TMPDIR` and `HOME` are redirected into `src/s32ds-build`.
  Without this the 2.9 GB payload is unpacked into `/tmp` (or into the build
  user's home when `/tmp` is too small) and desktop entries are written to the
  real home directory.
* A response file replaces the interactive panels.
* `TYPICAL=0` with explicit component switches. With `TYPICAL=1` the installer
  resets `INSTALL_PNE_DEBUGGER_DRIVERS` and `INSTALL_SEGGER_DRIVERS` to 1 and
  then runs `sudo ./inst_drivers_temp.sh`, which copies udev rules and
  libraries into the running system.
* `sudo`, `pkexec`, `pkaction`, `gksudo`, `gksu`, `kdesu` and `xhost` are
  shadowed by stubs that fail, in case a future installer revision adds another
  privileged action.

No driver installer is ever executed, neither at build time nor at install
time; see the udev section below for what the package does instead.

Afterwards the InstallAnywhere uninstaller, its registry and its logs are
removed, the absolute path the installer wrote into `eclipse/s32ds.ini` is
rewritten to `/opt/s32-design-studio`, the p2 metadata that still points at
NXP's build server is rewritten as well (see below), and the `chmod a+rwx -R`
that the installer applies to the whole tree is normalized (directories `0755`,
data files `0644`, ELF objects and scripts `0755`) and then made writable again,
because the IDE has to install extensions into it (see the section on
extensions). The vendor binaries are not stripped, because the cross
toolchains, the bundled gdb and the S32 Debugger use the shipped debug
information.

### The p2 metadata of the vendor build

NXP builds the product on a Jenkins agent and ships the absolute paths of that
agent inside the p2 metadata: the bundle pool, the download cache and the
product repository registered in `eclipse/p2/.../*.prefs` point at
`/opt/jenkins/workspace/...`, and the gzipped profile state contains the same
path 84 times. The PKGBUILD derives those paths from the shipped preferences
and replaces them with `/opt/s32-design-studio`, so p2 sees the ~1600 bundles
that are already installed instead of looking for their artifacts on the
update sites. The entry for the repository the product was built from is
dropped: it is not part of the installation, and a registered metadata
repository that cannot be loaded makes p2 refuse to install anything.

## Debug probes

The package ships udev rules only, so no vendor installer has to run as root.
The rules cover the NXP S32 Debug probe, PEmicro probes, SEGGER J-Link and
CMSIS-DAP probes; where NXP grants `MODE="0666"`, the rules here use
`MODE="0660" GROUP="uucp" TAG+="uaccess"`.

Grant access to the probes to your user once:

```sh
sudo usermod -a -G uucp "$USER"
```

then log out and back in and replug the probe. The rules are reloaded by the
install scriptlet on package install, upgrade and removal. `TAG+="uaccess"`
already grants access to the user of the active seat, so the group is only
needed for probes used without an active graphical session.

The NXP installation guide asks for the `dialout` group. That is a Debian and
Ubuntu group; a stock Arch installation does not have it and udev silently
drops every rule that names an unknown group, so the rules here use `uucp`,
which is Arch's serial group.

## Installing extensions

The IDE extends itself through p2, and p2 writes into the installation. This is
what the update site metadata asks for, not a quirk of the vendor image: every
extension pack unpacks itself below `S32DS/` and writes its bundles into
`eclipse/plugins`, `eclipse/features`, `eclipse/p2` and `eclipse/configuration`.
For example the GCC 10.2 toolchain pack carries

```
com.nxp.s32ds.ext.rcp.p2.native.install(source:@artifact,
    target:${installFolder}/../S32DS/build_tools/gcc_v10.2,overwrite:true);
```

which `org.eclipse.equinox.internal.p2.touchpoint.natives.actions.CopyAction`
turns into a `mkdirs()` of the target's parent followed by a
`FileOutputStream` on the target itself. Both need write permission, the second
one on an already existing file, so a read-only installation for the user fails
with

```
Target: Path /opt/s32-design-studio/.../gcc-9.2-arm32-eabi could not be created
```

A root-owned `/opt` breaks it even earlier: p2 then fails while writing its
download cache on startup and every extension install reports
`No repository found containing: binary,...`.

The package therefore ships `/opt/s32-design-studio` **world writable** —
directories `0775`, files `0664`/`0775`, all still owned by root, and nothing
else in the package is affected. The modes are set in `build()`
(`_allow_extension_installs()`), so they arrive with the files and no group has
to be created, joined or renewed at install time: installing an extension just
works.

`a+rwX` rather than a dedicated `s32ds` group: the group would have to be
created by the install scriptlet (makepkg records ownership as numbers, and the
gid of a group that does not exist yet is machine specific), and every user
would have to be added to it and log back in first — a step that is easy to
forget and produces a p2 error that says nothing about the cause. NXP's own
Linux image ships the installation world writable, `chmod -R 777`, for the same
reason. Keeping ownership with root is the only part that is stricter.

The price is that any local account can modify the IDE's own plugins, the JRE
and the cross toolchains — inherent to an installation that updates itself. To
lock the installation down, at the price of being unable to install any
extension:

```sh
sudo chmod -R o-w /opt/s32-design-studio
```

## Case sensitive paths of the SDK packs

The SDK packs are produced on Windows and carry paths that only resolve on a
case insensitive file system. A component descriptor references its code
generator through a directory name whose case does not match what the pack
ships:

```xml
<variable value="`../gpio_dio/gpio_dio_codegenerator.js`" id="codegen_file"/>
```

while the file is `Gpio_Dio/gpio_dio_codegenerator.js`. The configuration
tools report

```
java.io.IOException: Script not found: ../gpio_dio/gpio_dio_codegenerator.js
```

and then consider the component unknown, which has a consequence that
outlives the repair of the installation: they remove the component from the
`sdkComponents` list in the `.cproject` of every project they touch, and such
a project keeps reporting

```
gpio_dio is not found in the toolchain/IDE project. The project will not compile!
```

even after the descriptors are fixed. Restoring the entry in `.cproject` (or
re-adding the component with *Add SDK Components…* on the project context
menu) is then needed in addition to fixing the installation — and the
installation has to be fixed *before* the tools first see a project, or the
project is pruned in the first place. A project created on Windows and copied
over arrives with the same damage if it was ever touched by the tools there
with a broken pack, down to a `type_id` in the `.mex` whose case does not
match the component.

The clock scripts carry the same heritage a second way, building file names
with backslashes:

```java
Paths.get(ProjDirPath + "\\ClockYaml.txt")
```

On Linux the backslash is an ordinary character, so the clock tool drops
files named `project\ClockYaml.txt` next to the project instead of
`ClockYaml.txt` inside it.

NXP documents the case sensitivity of Linux as the reason the RTD is not
supported on it and ships no fix; a
[community readme](https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/S32K/45728/1/ReadmeToModifyTheRTD.txt)
patches the same class of problem by hand, mostly for the S32K3 packs.

This package ships `/usr/bin/s32ds-fix-linux-case`, which repairs the whole
`eclipse/mcu_data` tree of the installation in place:

* every `codegen_file` reference that does not resolve case sensitively but
  does ignoring case is rewritten to the case the file system uses — for the
  S32K1/S32M24 pack that is `Gpio_Dio`, `Dio`, `Ftm_Gpt`, `LPit_Gpt`,
  `Lptmr_Gpt`, `Os`, `SRtc` and `AeWdog_Ip`, the last one misspelled in both
  the directory and the file name;
* `"\\ClockYaml.txt"` style backslashes become `/` on the lines that build a
  `java.nio.file.Path`. The clock scripts ship twice — in `components/` and
  as per-device copies under `processors/<Device>/<pack>/scripts/clocks/`,
  of which the latter are the ones the clock tool executes — and both are
  covered. Regular expressions that legitimately spell a backslash, e.g. in
  `templatingengine.js`, are not on such lines and stay untouched.

The script is idempotent, changes nothing that is already correct and prints
only what it changed. It runs at `post_install`/`post_upgrade` and again at
every launch through the `s32ds` wrapper: packs installed from the IDE bring
their own descriptors and are seen by the launcher, never by pacman.
`S32DS_SKIP_CASE_FIX=1` bypasses it; `s32ds-fix-linux-case
/path/to/installation` repairs a different root.

Two things it deliberately does not do: it cannot repair projects the tools
already pruned (see above), and it does not rename the template files whose
name case makes the code generator produce blank `.c`/`.h` files — the
community readme covers those renames for the S32K3 packs.

## The installation directory and pacman

The package ships `/opt/s32-design-studio` world writable, because the IDE
installs extensions (SDK packs, toolchains, help) into its own installation
directory, and records every directory of it at mode 777. Pacman does not
correct directories that already exist when it installs a package: it
extracts new ones with the mode of the package, leaves the ones on disk
alone and only reports the difference

```
warning: directory permissions differ on /opt/s32-design-studio/.../, filesystem: 755  package: 777
```

once per directory per update. The IDE reintroduces such directories itself
while installing extensions — p2 creates the parent directories of a
copy action with the umask of the session, 755 — so without help the
warning block grows back after every installation and is never fixed.

The `pre_upgrade`/`pre_install` scriptlets therefore run
`_s32ds_writable_tree()` before the files are extracted: every directory
under the installation goes back to `root:root` and to the `a+rwX` state
`_allow_extension_installs()` puts into the package. The comparison of
pacman then runs against a matching tree and stays silent, and
`pacman -Qkk` stops listing ownership and mode drift for those directories
(the files are re-extracted anyway and heal themselves). Drift the IDE
creates after an installation only shows up again at the *next* update,
where the scriptlet silently repairs it before pacman gets to compare.

Removal is clean as well. The IDE installs extensions and writes caches
into the installation directory at runtime — p2 bundle state, downloaded
packs — none of which pacman knows, so it would leave them, and every
directory it cannot remove because it is still not empty, behind.
`post_remove` therefore deletes `/opt/s32-design-studio` outright after
pacman has removed what it owns. The trade-off is that extension packs
installed from the IDE disappear together with the package; they live
inside the installation directory by design and are re-downloaded by the
IDE after a reinstall.

## Wayland sessions

The MCU configuration views (PIN, Clocks, and the other pages under
*Configuration*) are JavaFX, embedded in the workbench through
`javafx.embed.swt.FXCanvas`. The JavaFX 17 that ships with the product is GTK3
only and has no Wayland support, while GTK picks the Wayland backend by default
in a Wayland session. Its GTK3 glass then calls `gdk_x11_*` and `XInternAtom()`
on a display that is not an X11 display, which produces

```
Gdk-CRITICAL: gdk_x11_display_set_window_scale: assertion
              'GDK_IS_X11_DISPLAY (display)' failed
```

and, on the first touch of such a view, takes the whole IDE down with

```
Problematic frame:
C  [libX11.so.6+0x29532]  XInternAtom+0x42
C  [libglassgtk3.so+0x221f6]  rebuild_screens(JNIEnv_*)
C  [libglassgtk3.so+0x24f19]
  Java_com_sun_glass_ui_gtk_GtkApplication_staticScreen_1getScreens
```

`/usr/bin/s32ds` therefore exports `GDK_BACKEND=x11` whenever `DISPLAY` is
present, which routes the IDE through Xwayland. It is a no-op on an X11 session.

The backend is *overridden* rather than merely defaulted, because desktops that
prefer native Wayland put `GDK_BACKEND=wayland` into the whole session (on
systemd it shows up in `systemctl --user show-environment`). That is the right
choice for every other GTK application and the wrong one for this IDE, and
inheriting it is not something the IDE can recover from. Set
`S32DS_GDK_BACKEND` to override the choice, e.g.
`S32DS_GDK_BACKEND=wayland s32ds` starts the IDE with the backend of your
choice (the JavaFX views will crash again). A Wayland session without Xwayland
running has no `DISPLAY` and is left on the default backend, because forcing
X11 there would cost the whole IDE instead of only the JavaFX views.

The rest of the IDE works on Wayland without this; only the JavaFX pages need
it, but they take the process down with them.

The trigger is specifically *SWT before JavaFX*: the workbench opens the GDK
display, and the JavaFX GTK3 glass then takes X11 functions for that display,
which is undefined behaviour on a Wayland one. JavaFX on its own is fine on
Wayland, so a standalone JavaFX program is not a usable reproduction; opening an
`org.eclipse.swt.widgets.Display` first and asking `com.sun.glass.ui.Screen`
for the screen list afterwards reproduces the crash above every time, on this
package's own SWT and JavaFX, with and without `GDK_BACKEND` set to anything but
`x11`.

## Dependencies

The build itself needs nothing beyond a base Arch installation: the installer
ships its own Java runtime. The runtime dependencies were derived from the
`DT_NEEDED` entries of the 1 168 ELF objects in the vendor tree (see the
`depends` array); notable ones are `gtk3` for the JavaFX runtime, `libusb`
and `libusb-compat` for the S32 Debugger and the PEmicro GDB client, `pcsclite`
for the CCS debugger server and `ncurses`/`xz` for the bundled gdb.

Optional:

* `python` – helper scripts of the S32 Debugger and of the PEmicro GDB client
* `tcl` – TCL scripts in the `Project_Settings` container
* `dos2unix` – `unix2dos` helper used by some project setting scripts
* `gtk2` – legacy JavaFX GTK2 backend shipped with the IDE

Two items from the NXP installation guide are obsolete for 3.6.10 and are not
depended upon: the `enum34` Python 2 backport (Python 3 has `enum` in the
standard library) and the 32 bit GTK stack of the optional Diab toolchain
installer, which is not part of this package.

### Known limitations

* JavaFX media playback: the IDE ships JavaFX media plugins for FFmpeg 4, 5 and
  6, none of which matches the `libavcodec` sonames of current Arch. Videos in
  the help are therefore not played; the IDE itself is unaffected.
* The S32 Debugger, PEmicro and SEGGER support is installed as NXP ships it.
  Their own driver installers are never run by this package. Because the PEmicro
  debugging support is already part of the installation, offering it again in
  the extension manager reports it as already installed and changes nothing.
* Three vendor binaries in `S32DS/tools/S32Debugger` carry the path of NXP's
  build agent as a second RUNPATH entry, after the `$ORIGIN` entries that
  resolve first. They are harmless and are left untouched.
* p2 rolls an install back by copying what it is about to overwrite into
  `java.io.tmpdir` first. Installing a pack that carries `overwrite:true` for
  something big — the S32 Debugger, a GCC toolchain — therefore temporarily
  needs that much room in `$TMPDIR`. On Arch `/tmp` is a tmpfs by default, so
  it is taken from RAM; point `TMPDIR` at a disk if a large extension install
  runs out of space there.
* A failed extension install leaves p2's rollback noise in the workspace log
  (`Restore failed: Missing backup directory - can not restore: /tmp/...`).
  That is p2 reporting the failed transaction, not a second fault.
* JavaFX views on a Wayland session need the launcher workaround described
  above; there is no in-IDE setting for it.
* SWT logs `SWT-GTK uses unsupported major GTK version 0. GTK3 will be used as
  default.` on Arch. The fallback is the right one — the bundled JavaFX is the
  GTK3 build — but the detection is not happy about the GTK versions it finds.

## License

The product is proprietary. See `LICENSE.PKGBUILD` and
`/opt/s32-design-studio/License`.
