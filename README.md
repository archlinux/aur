# SysInfoViewer

> A lightweight, native Linux system information and resource monitor built with modern C++ (C++23) and wxWidgets.

[![CI](https://github.com/Magpiny/sysinfoviewer/actions/workflows/crossdistro.yml/badge.svg)](https://github.com/Magpiny/sysinfoviewer/actions/workflows/crossdistro.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-0.3.3-green.svg)](https://github.com/Magpiny/sysinfoviewer/releases)
[![C++23](https://img.shields.io/badge/C%2B%2B-23-orange.svg)]()
[![wxWidgets](https://img.shields.io/badge/wxWidgets-3.3-blueviolet.svg)](https://www.wxwidgets.org/)
[![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)]()
[![AUR](https://img.shields.io/aur/version/sysinfoviewer.svg)](https://aur.archlinux.org/packages/sysinfoviewer)

SysInfoViewer provides an intuitive, high-performance graphical interface for inspecting and monitoring your Linux workstation — real-time CPU and memory load, responsive disk metrics, UPower-grade battery diagnostics, running processes with live search, installed desktop applications, display/GPU hardware, sound cards, and network interfaces.

---

## Screenshots

| System Overview | Process Manager |
| :---: | :---: |
| [![Main Window](screenshots/main_window.png)](screenshots/main_window.png) | [![System Processes](screenshots/sys_processes.png)](screenshots/sys_processes.png) |
| **CPU Architecture** | **Installed Applications** |
| [![CPU Info](screenshots/cpu_info.png)](screenshots/cpu_info.png) | [![Installed Apps](screenshots/installed_apps.png)](screenshots/installed_apps.png) |

---

## Features

- **System Overview** — OS release, Linux distribution, kernel architecture, desktop environment, user, hostname, and synchronized hardware resource charts at a glance.
- **Real-Time CPU Monitoring** — Dynamic doughnut chart with accurate physical core count, logical thread count, frequency (MHz), and real-time utilization.
- **Memory & Swap Breakdown** — Live visual gauges showing total, used, and free system memory updated every second.
- **Responsive Disk Telemetry** — Proportional pie chart with physical device resolution, adaptive labels, and seamless background blending that resizes dynamically with the panel width.
- **Advanced Battery Diagnostics** — Deep hardware telemetry combining sysfs and UPower: real-time energy (Wh), discharge/charge rate (W), voltage (V), health percentage, charge cycle count, vendor/model metadata, and remaining runtime estimates.
- **Interactive Process Manager** — Filterable and sortable process viewer featuring a real-time search bar, desktop icon integration with letter fallbacks, and memory metrics displayed in both MB and percentage.
- **Storage Devices & Filesystems** — Comprehensive physical disk drive details (vendor, model, serial, capacity) and mounted filesystem partitions with visual capacity bars.
- **Hardware & Peripherals** — Direct kernel/sysfs inspection of GPU display connectors via `libdrm`, ALSA sound devices, and active network interfaces.
- **Installed Applications Explorer** — Browse and inspect desktop applications installed across the system.

---

## What's New in v0.3.3

### Responsive Disk Usage & UI Polish
- **Harmonized Chart Sizing**: The Disk Usage pie chart now dynamically matches the radius and center alignment of the CPU and Memory usage charts (`std::min(width, height) * 0.4`), ensuring a balanced top-row layout.
- **Adaptive Multi-Tier Label Wrapping**: Disk usage labels (Total, Used, Free) and disk model identity text intelligently adapt their layout — single-row horizontal on wide screens, wrapped two-row on medium displays, and stacked vertical on narrow panels — preventing text overlap or clipping.
- **Seamless Canvas Integration**: Removed separate background panel canvas artifacts, allowing all charts to blend cleanly into the native window theme.

### Interactive Searchable Process Manager
- **Live Process Search**: Real-time filtering search bar to quickly locate processes by process name, PID, or user.
- **Application Icon Integration**: Running processes are matched with their respective desktop application icons, with clean letter-avatar fallbacks for system daemons and background tasks.
- **Enhanced Memory Metrics**: Process RAM consumption is now reported in both human-readable megabytes (MB) and total percentage, sorted by RAM usage descending by default.

### Physical Disk & Storage Architecture Overhaul
- **Whole-Disk Capacity Resolution**: Resolves root filesystem mount sources to their parent physical block devices (NVMe, SATA, MMC) across sysfs symlinks, reporting accurate total physical disk capacity rather than single-partition constraints.
- **Dedicated Storage Pane**: Visual bar charts and disk vendor/model metadata for all detected storage drives.

### UPower-Grade Battery & Hardware Subsystems
- **Precise Core/Thread Separation**: Correctly distinguishes physical CPU cores from hyperthreads via `/proc/cpuinfo`.
- **UPower-Grade Telemetry**: Native sysfs energy parsing (µWh → Wh, µW → W) supplemented by runtime `upower` integration for complete hardware vendor, model, and serial number reporting.
- **Modern Display Detection**: Rewritten display and GPU detection layer using `libdrm` for robust multi-monitor and universal desktop environment discovery.

---

## Installation

### Arch Linux / CachyOS / Manjaro (AUR)

SysInfoViewer is available on the Arch User Repository (AUR) as `sysinfoviewer`:

```bash
# Using paru
paru -S sysinfoviewer

# Using yay
yay -S sysinfoviewer
```

The AUR package automatically configures dependencies and installs desktop integration files.

---

### Build from Source

#### Prerequisites

**Compiler & Build System**
- GCC 14+ or Clang 18+ (C++23 support required)
- CMake 4.2 or later
- Make or Ninja
- Git

**Required Libraries & Headers**

| Dependency | Purpose | Arch / CachyOS | Debian / Ubuntu | Fedora |
| :--- | :--- | :--- | :--- | :--- |
| **wxWidgets ≥ 3.3** | GUI Framework | `wxwidgets-gtk3` | `libwxgtk3.2-dev` | `wxGTK3-devel` |
| **libcurl** | Network / Telemetry | `curl` | `libcurl4-openssl-dev` | `libcurl-devel` |
| **ALSA** | Sound Card Detection | `alsa-lib` | `libasound2-dev` | `alsa-lib-devel` |
| **libdrm** | Display / GPU Info | `libdrm` | `libdrm-dev` | `libdrm-devel` |
| **UPower** *(runtime)* | Battery Metadata | `upower` | `upower` | `upower` |

> **Note:** UPower is an optional runtime dependency. If absent, SysInfoViewer continues to function smoothly using direct sysfs telemetry while displaying "Unknown" for vendor/serial fields.

#### Clone the Repository

```bash
git clone https://github.com/Magpiny/sysinfoviewer.git
cd sysinfoviewer
```

#### Option A: Quick Build Script (Recommended)

SysInfoViewer includes a build script to compile and prepare binaries:

```bash
# Build optimized release binary
./build.sh release

# Build debug binary with verbose logging
./build.sh debug

# Run binary directly from AppDir
./AppDir/bin/sysinfoviewer
```

#### Option B: Standard CMake Workflow

```bash
# Configure and compile
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)

# Run binary
./build/sysinfoviewer
```

#### System Installation

```bash
sudo cmake --install build
```

Once installed, SysInfoViewer can be launched from your application launcher or by running:

```bash
sysinfoviewer
```

---

## Contributing

Contributions, bug reports, and feature suggestions are welcome!

1. Fork the repository and create a feature branch (`git checkout -b feature/amazing-feature`).
2. Commit your changes (`git commit -m 'feat: add amazing feature'`).
3. Push to your branch (`git push origin feature/amazing-feature`).
4. Open a Pull Request.

Please include relevant system information and logs when filing bug reports.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for complete details.

---

## Author

**Wanjare Samuel**  
- Email: [samuelwanjare@protonmail.com](mailto:samuelwanjare@protonmail.com)  
- GitHub: [@Magpiny](https://github.com/Magpiny)

---

## Acknowledgements

- [wxWidgets](https://www.wxwidgets.org/) — Cross-platform GUI framework
- [UPower](https://upower.freedesktop.org/) — Power management and battery telemetry
- [FreeDesktop](https://www.freedesktop.org/) — Icon themes and desktop standards
- All contributors and community members supporting SysInfoViewer
