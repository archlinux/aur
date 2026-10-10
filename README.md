# DeepSeek Harness Desktop 的 Arch Linux 二进制包

将[上游 v0.22.4](https://github.com/dsh-tauri/deepseek-harness-desktop/releases/tag/v0.22.4)
的普通 Linux `.deb` 重打包为 `dsh-tauri-desktop-bin`，仅支持 `x86_64`。
下载文件均固定版本并校验 SHA-256，程序、插件资源和图标沿用上游内容。
桌面入口补充 `%u`，使 `dsh://` 链接参数能传给程序。

## 构建与安装

从 AUR 安装：

```sh
paru -S dsh-tauri-desktop-bin
```

准备好 Arch Linux 的 `base-devel` 工具组，然后执行：

```sh
cd ~/Documents/WorkSpace/dsh-tauri-desktop
makepkg -si
```

安装后从应用菜单打开 **Deepseek Harness Desktop**，或执行：

```sh
deepseek-harness-desktop
```

首次启动需要联网下载缺失的运行时与 Harness 内核；不需要预先安装 Node.js 或 pnpm。
Git 功能需要 `git`；原生目录选择需要 `xdg-desktop-portal` 及适合当前桌面环境的后端。

## 更新与许可

- 桌面程序通过更新本 PKGBUILD、重新打包并安装来升级。应用内的桌面更新器下载上游安装包，不能代替 pacman 更新本包。
- 更新版本时，同时更新源文件校验和，并执行 `makepkg --printsrcinfo > .SRCINFO`。
- AUR 维护者提交并推送新版 PKGBUILD 和 `.SRCINFO` 后，用户可通过 `paru -Syu` 更新；上游发布本身不会自动更新 AUR。
- 上游采用 MIT 加附加条款，限制商业二次开发；完整条款安装在 `/usr/share/licenses/dsh-tauri-desktop-bin/`。
