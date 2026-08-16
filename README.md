# xburn-gui (Arch Linux)

D-Robotics（地平线）xburn 芯片烧录 GUI 的 Arch Linux 打包脚本。

上游只发布 Ubuntu/Debian 的预编译二进制。本目录提供 `PKGBUILD`，用于在 Arch Linux 上
构建并运行 `xburn-gui`。

## 背景：为什么不能直接装依赖

`xburn-gui` 是一个 **Tauri(Rust)** 应用，其 Linux 后端硬链接到
`libwebkit2gtk-4.0.so.37`（WebKitGTK 的 4.0 API）。而 Arch 官方仓库已经移除了以下这些
旧版 soname：

| 缺失的库 | Arch 现状 |
|---|---|
| `libwebkit2gtk-4.0.so.37` / `libjavascriptcoregtk-4.0.so.18` | 只剩 4.1 / 6.0 API，4.0 已移除 |
| `libsoup-2.4.so.1` | libsoup 2.x 已移除，只剩 `libsoup3` |
| `libicu*.so.70` | Arch 现为 ICU 76，soname 不兼容 |
| `libxml2.so.2` | 新版 libxml2 已改为 `.so.16`，旧 soname 由 `libxml2-legacy` 提供 |

因此本 PKGBUILD 从 **Ubuntu 22.04** 额外下载 4 个包（webkit2gtk、javascriptcoregtk、
libicu70、libsoup2.4），解包后**私有打包**到 `/usr/lib/xburn-gui/lib/`，通过启动脚本设置
`LD_LIBRARY_PATH` 加载，不污染系统其它程序。

## 打包原理

- 应用目录树按上游 `/usr` 布局安装（`/usr/bin/xburn`、`/usr/lib/xburn-gui/{configs,tools}`、
  `/usr/share/...`）。
- 程序内部**硬编码**了配置路径 `/usr/lib/xburn-gui/configs`，因此不能随意改安装位置。
- WebKit 会按编译期硬编码的 `/usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/` 路径 spawn
  `WebKitNetworkProcess` 等子进程，故这些辅助进程也必须放到该路径。
- 上游自带的 udev 规则安装到 `/usr/lib/udev/rules.d/`，使 USB 烧录板可被访问。
- `depends` 补齐全部运行时依赖（含 `libxml2-legacy` 提供 `libxml2.so.2`）。

## 构建与安装

```bash
cd xburn-gui
makepkg -si          # 自动安装依赖（含 libxml2-legacy）并安装
```

或使用已构建好的包：

```bash
sudo pacman -U xburn-gui-1.2.1-1-x86_64.pkg.tar.zst
```

## 使用

```bash
xburn-gui            # 命令行直接运行
```

也可从桌面菜单启动（`.desktop` 使用 `pkexec` 提权，需安装 `polkit`，已列为 optdepends）。

## 注意事项

- 桌面启动器依赖 `polkit`（提供 `pkexec`）；命令行直接运行则不需要。
- udev 规则里写了 `GROUP="plugdev"`（Debian 惯例，Arch 无此组），但 `MODE="0666"`
  已给所有用户读写权限，不影响使用。插入烧录板后如未生效，执行
  `sudo udevadm control --reload-rules` 后重新插拔。
- 若运行后发现 WebKit 子进程仍找不到私有库（说明它未继承 `LD_LIBRARY_PATH`），
  需要在 PKGBUILD 中追加 `patchelf` 设置 RPATH 的兜底逻辑。

## 文件说明

| 文件 | 说明 |
|---|---|
| `PKGBUILD` | Arch 打包脚本 |
| `xburn-gui_1.2.1_amd64.deb` | 上游原始 deb 包（构建源） |
| `xburn-gui-1.2.1-1-x86_64.pkg.tar.zst` | 构建产物（Arch 安装包） |
