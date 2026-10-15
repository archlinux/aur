# CCBaga 的 Arch Linux 二进制包

将 [CCBaga 官方 v0.2.48](https://github.com/liseami/CCBaga/releases/tag/v0.2.48) 的原生 Arch 包重新打包为 `ccbaga-bin`，仅支持 `x86_64`，同时包含 CCBaga-A 和 CCBaga-B。无需编译 Rust、前端或 Chromium，也不需要安装 Bun。原包下载约 201 MiB，安装载荷约 726 MiB。

AUR 打包维护者：YageGeng <icoderdev@outlook.com>。维护范围为本仓库的打包配方，应用开发、浏览器引擎和上游发布由各自项目负责。

## 构建与安装

从 AUR 安装：

```sh
paru -S ccbaga-bin
```

手动构建时，先准备 Arch Linux 的 `base-devel` 工具组，再以普通用户执行：

```sh
git clone https://aur.archlinux.org/ccbaga-bin.git
cd ccbaga-bin
makepkg -si
```

`makepkg -si` 会通过 pacman 安装缺失依赖，并安装生成的包。只构建而不安装应用时使用 `makepkg -s`。

从应用菜单启动 CCBaga-A 或 CCBaga-B；保留上游命令 `requirement-french` 和 `requirement-french --browser`。Wayland 剪贴板功能需要 `wl-clipboard`，X11 需要 `xclip`。

## 打包处理

- 使用固定版本下载地址及 SHA-256 校验，不使用 `latest` 或 `SKIP`。
- 仅复制上游包的 `usr/` 载荷，由 makepkg 重新生成 `.PKGINFO`、`.BUILDINFO` 和 `.MTREE`。
- 保留 `/usr/lib/CCBaga-A` 资源路径、两个桌面入口、图标和完整浏览器文件；禁用 strip/debug 处理。
- 将许可证目录由 `ccbaga-git` 改为 `ccbaga-bin`，并补入同版本源码中的 LobeHub 图标许可证。
- 声明 `provides=("ccbaga=$pkgver")` 和 `conflicts=('ccbaga')`，避免与源码包或同样提供 `ccbaga` 的上游 `ccbaga-git` 包共同安装。
- 运行库依赖覆盖宿主及浏览器的 ELF 直接依赖，并保留上游声明的运行时工具。

## 更新与许可

Linux 更新交给包管理器。AUR 维护者更新并推送配方后，用户可通过 `paru -Syu` 升级；上游发布本身不会自动更新 AUR。

更新配方时修改 `pkgver`、重置 `pkgrel=1`、核对新版本文件结构和 SHA-256，然后重新生成 `.SRCINFO`：

```sh
makepkg --printsrcinfo > .SRCINFO
```

应用原创代码采用 MIT，浏览器保留 BSD-3-Clause 及其依赖各自的许可。相关声明安装在 `/usr/share/licenses/ccbaga-bin/`，完整浏览器资源也随包保留。上游 [NOTICE.md](https://github.com/liseami/CCBaga/blob/v0.2.48/NOTICE.md) 还记录了 Cromma UI 授权说明不完整的问题；本配方保留该说明，具体授权信息由上游提供。

提交 AUR 时仅上传配方、`.SRCINFO` 和文本说明；下载缓存、构建目录与二进制包由 `.gitignore` 排除。
