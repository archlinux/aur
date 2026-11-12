# quartus-wayland

Arch Linux launchers for **Quartus Prime Lite 25.1** and its IP tools on native Wayland, with a sharp HiDPI launcher for **Questa FPGA Starter Edition**.

| Application menu entry | Display backend |
| --- | --- |
| Quartus Prime Lite (Wayland) | Vendor Qt 6.5.7 with matching Qt Wayland plugins |
| Quartus MegaWizard (Wayland) | Native Wayland for Qt IP parameter editors |
| Quartus Platform Designer (Wayland) | Java WLToolkit, including Java IP editors |
| Questa FPGA (HiDPI) | XWayland inside Gamescope, rendering at the physical output resolution |

## Install from AUR

```bash
yay -S quartus-wayland
quartus-wayland-setup
```

`quartus-wayland-setup` is run as your regular user. It installs per-user launchers and desktop entries, adds an opt-in Questa startup hook, and configures Quartus NativeLink to use the HiDPI launcher.

The package requires `quartus-free-quartus`. For Questa simulation, also install `quartus-free-questa` and `gamescope`.

The package builds Qt 6.5.7 Wayland from source and ships a private JetBrains Runtime with WLToolkit. Its Qt runtime adds Wayland libraries and plugins to the vendor installation; Qt Core, Gui and Widgets come from Quartus.

## Launch applications

Use the application menu entries above, or run:

```bash
quartus-wayland
qmegawiz-wayland
qsys-edit-wayland
questa-hidpi
```

Save your project and restart Quartus through **Quartus Prime Lite (Wayland)** after setup. IP tools launched from IP Catalog, MegaWizard and Platform Designer inherit the Qt Wayland and Java WLToolkit settings.

NativeLink uses `~/.local/share/quartus-wayland/questa/bin`. The `vsim` launcher preserves the working directory, command-line arguments and `-do` scripts; compilation tools link to the original Questa installation. Batch mode and version queries run directly without Gamescope.

## Questa HiDPI

The HiDPI launcher uses identical input and output resolutions in Gamescope. Fonts render at the selected DPI, while small bitmap icons are enlarged by an integer factor. On a 3120×2080 screen at 200%, both Gamescope resolutions are 3120×2080, avoiding enlargement of a half-resolution text image.

Niri output resolution and scale are detected automatically. On other compositors, or to select another output, set them explicitly:

```bash
QUESTA_HIDPI_RESOLUTION=3840x2160 QUESTA_HIDPI_SCALE=2 questa-hidpi
```

The launcher opens fullscreen. Gamescope's Super+F shortcut toggles fullscreen; native-resolution sharpness is intended for a window filling the selected output.

Questa Starter's Tcl/Tk interface uses X11. The included Qt Visualizer requires a `qdebug` license feature, which the tested Starter license server did not provide.

## Configuration

The generated shell configuration is `~/.config/quartus-wayland/config`. Runtime data and the NativeLink relay are in `~/.local/share/quartus-wayland`.

For different installation paths:

```bash
QUARTUS_ROOTDIR=/path/to/quartus \
QUESTA_ROOTDIR=/path/to/questa_fse \
quartus-wayland-setup
```

Setup preserves `~/modelsim.tcl` and backs it up to `~/modelsim.tcl.before-quartus-wayland` before adding the hook. The hook applies only to sessions with `QUESTA_HIDPI_TCL` set. A legacy `SetupFonts` user hook is replaced within these sessions so it does not override the DPI setting. Quartus options `EDA_TOOL_PATH_QUESTA_INTEL` and `EDA_TOOL_PATH_QUESTASIM` are set through the Quartus Tcl API.

## Build or install from this checkout

Build the Arch package:

```bash
makepkg -si
quartus-wayland-setup
```

Reuse an existing Qt 6.5.7 SDK with matching build features:

```bash
QUARTUS_WAYLAND_QT6_PREFIX="$HOME/qt657/install" makepkg -si
quartus-wayland-setup
```

To install only for the current user using an existing runtime:

```bash
./install-local.sh
```

The local installer searches `/opt/qt657-wayland`, then `~/qt657/install`, and copies the required runtime subset. It downloads the pinned Java runtime and Java Activation library if needed, checking SHA-256 hashes.

The Qt compatibility SDK disables OpenGL, OpenSSL, Vulkan, the AT-SPI bridge and system textmarkdownreader. The final package includes Qt Wayland Client, QtDBus, the generic Wayland QPA plugin and xdg-shell integration.

## 中文使用说明

```bash
yay -S quartus-wayland
quartus-wayland-setup
```

安装后保存工程，从应用菜单的 **Quartus Prime Lite (Wayland)** 重新打开。手动打开的 Qt/Java IP 窗口继承原生 Wayland 配置；从 Quartus 启动 Questa 仿真时自动使用 Gamescope 高分屏界面。也可搜索 **Questa FPGA (HiDPI)** 独立启动。

Questa 按屏幕物理分辨率直接渲染文字，并单独放大图标。Niri 自动读取分辨率和缩放；其他桌面可通过 `QUESTA_HIDPI_RESOLUTION` 与 `QUESTA_HIDPI_SCALE` 指定。用户设置位于 `~/.config/quartus-wayland/config`。
