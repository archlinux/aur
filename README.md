# windinput-bin

将[清风输入法官方 Linux 预览版](https://windinput.com/docs/reference/linux)的
Debian 二进制包重打包为 Arch Linux 包，当前版本 **0.125.0**。
支持 `x86_64` 和 `aarch64`（Arch Linux ARM），下载文件使用固定 SHA-256 校验。
上游尚未验证 Arch Linux；本仓库的构建验证不代表实际桌面输入验证。

## 构建与安装

在本目录运行，以普通用户构建，由 pacman 安装依赖和成品：

```sh
makepkg -si
```

构建需要 Arch 的 `base-devel` 工具组。不想立即安装时运行 `makepkg -s`。
包保留上游程序、词库、桌面入口、图标和 MIME 声明，将 Fcitx5 插件从
Debian 的多架构目录移到 `/usr/lib/fcitx5/libwindinput.so`。
程序与词库仍位于 `/usr/lib/windinput/`，安装过程不修改用户的输入法配置。

## 启用

1. 按[ArchWiki Fcitx5 指南](https://wiki.archlinux.org/title/Fcitx5)配置桌面使用
   Fcitx5。GTK/Qt 应用分别需要 `fcitx5-gtk` / `fcitx5-qt`，环境变量取决于
   桌面和显示协议，不要统一套用到所有 Wayland 会话。
2. 确保已有中文字体，没有则安装 `noto-fonts-cjk`；彩色表情可安装
   `noto-fonts-emoji`。
3. 打开 `fcitx5-configtool`，取消“仅显示当前语言”，将“清风输入法”加入
   当前输入法组，然后注销并重新登录。
4. 从应用菜单打开“清风输入法设置”，或输入时按 `Ctrl+Shift+]`。

可选的上游辅助命令：

```sh
windinput-setup --no-im-config
# 默认全拼；需要五笔时：
windinput-setup --no-im-config --schema wubi86
```

**辅助命令会修改当前用户配置、清空 Fcitx5 的 Shift 快捷键，并重启正在运行的
Fcitx5；不要用 sudo 运行。** `--no-im-config` 跳过 Debian 专用的框架配置工具，
桌面环境仍需自行配置。使用图形配置时，若需要 Shift 切换中英，可自行清空
Fcitx5 全局选项中的“临时在当前和第一个输入法之间切换”。

设置程序的文件对话框需要 `xdg-desktop-portal` 及适合当前桌面的 backend，
或使用 `zenity`。剪贴板支持按会话安装 `xclip` / `wl-clipboard`。

## 更新与卸载

更新本仓库的版本、下载地址和校验值后重新运行 `makepkg -si`。
每次更新后注销重登，或在当前桌面用户的终端运行：

```sh
pkill -u "$(id -u)" -x wind_input
fcitx5 -rd
```

这会停止当前用户的清风服务并重启 Fcitx5，后续输入时由插件拉起新版服务。
程序内更新提示只提供下载链接；Arch 上请通过此包更新，不要使用 apt。

卸载运行 `sudo pacman -R windinput-bin`，用户配置与数据会保留：
`~/.config/WindInput/`、`~/.local/share/WindInput/`。
日志位于 `~/.local/share/WindInput/logs/`。

## 已知限制与维护

Linux 版仍是预览版。上游文档指出 GNOME/KDE Wayland 下候选窗定位有限制，
Chromium 原生 Wayland 模式可能需要 `--enable-wayland-ime`，详见
[官方已知限制](https://windinput.com/docs/reference/linux#limitations)。

修改 PKGBUILD 后重新生成 AUR 元数据并检查：

```sh
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD windinput-bin-*.pkg.tar.zst
```

主程序为 MIT 许可，随包 emoji 数据保留上游 LGPL-3.0 许可文件，其他词库
及资源保留原包内容与声明。发布资源来自
[GitHub Releases](https://github.com/huanfeng/WindInput/releases/tag/v0.125.0)。

当前验证：两个架构均已完成 SHA-256 校验和 `makepkg` 重打包；`aarch64` 在
`x86_64` 主机上仅验证打包，不执行 ARM 程序。`x86_64` 插件使用 `RTLD_NOW`
实际加载成功，桌面文件通过 `desktop-file-validate`，尚未安装或验证实际输入。
`namcap` 无错误，但提示上游插件缺少完整 RELRO、部分二进制保留符号表；
此包保持上游二进制不变。它也会提示运行时动态加载的库和辅助脚本依赖
可能未使用，以及 Debian 多架构路径中的 `x86_64` 字样。
