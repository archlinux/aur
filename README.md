# AstroBox CreatorConsole Linux 发版

<p align="center">
    <img src="https://img.shields.io/badge/bun-required-02ACFA.svg?style=flat-square&logo=bun">
    <img src="https://img.shields.io/badge/makepkg-required-1793D1.svg?style=flat-square&logo=archlinux">
    <img src="https://img.shields.io/badge/rpmbuild-required-891400.svg?style=flat-square&logo=redhat">
    <img src="https://img.shields.io/badge/dpkg--deb-required-A81D33.svg?style=flat-square&logo=debian">
</p>

> 构建脚本原理与细节见 [BUILD.md](BUILD.md)

## 1. 构建 Linux 包

```bash
bun install
./scripts/build-linux.sh
# 输入: 1 2 3
# 产物输出到 dist/linux/
```

Arch Linux 本机需要：`sudo pacman -S --needed base-devel squashfs-tools`（makepkg 与 AppImage 的 `mksquashfs`）。
脚本会在 Arch + AppImage 时自动设置 `NO_STRIP=1`，规避 linuxdeploy 旧版 strip 不识别 `.relr.dyn` 的问题。

| 选项 | 目标 | 产物 |
|---|---|---|
| `1` / `deb` | Debian/Ubuntu | `.deb` |
| `2` / `rpm` | Fedora/RHEL | `.rpm` |
| `3` / `arch` | Arch Linux | `.pkg.tar.zst` |
| `4` / `appimage` | AppImage | `.AppImage` |
| `a` | deb + rpm + arch + appimage | 全部 |
| `q` | 退出 | - |

可多选，空格分隔。发版选 `1 2 3 4` 全选，同时生成 deb、rpm、arch、appimage 四个包，包名统一为 `astrobox-creator-console`。

产物目录：

```
dist/linux/
├── astrobox-creator-console_0.3.0_amd64.deb
├── astrobox-creator-console-0.3.0-1.x86_64.rpm
├── AstroBoxCreatorConsole-0.3.0-x86_64.pkg.tar.zst
└── astrobox-creator-console_0.3.0_amd64.AppImage
```

非交互模式（CI 使用，跳过菜单）：

```bash
./scripts/build-linux.sh deb rpm arch appimage    # 构建全部四种包
./scripts/build-linux.sh --no-build deb rpm appimage  # 已有 Tauri 产物时仅重命名
```

## 2. 上传 Release

将 `dist/linux/` 下的全部包上传到 [Releases](https://github.com/AstralSightStudios/AstroBoxCreatorConsole/releases)，版本号 `v0.3.0` 形式的 tag。arch 包上传时文件名统一为
`AstroBoxCreatorConsole-${pkgver}-x86_64.pkg.tar.zst`（不含 pkgrel，与 AUR PKGBUILD 中的下载地址保持一致），否则 AUR 构建时下载会 404。

## 3. 发布 AUR

等待 Release 发布完成后，运行脚本自动更新 `PKGBUILD`（`pkgver`、`pkgrel`、`_expected` sha256）和 `.SRCINFO`：

```bash
./scripts/archpkg/update-aur.sh
```

脚本从 `src-tauri/tauri.conf.json` 提取版本号，查询 AUR 自动递增 `pkgrel`，从 `dist/linux/` 的产物计算 sha256（优先取 `AstroBoxCreatorConsole-${APP_VERSION}-x86_64.pkg.tar.zst`，找不到再退回本地构建名）。

### 3.1 测试

```bash
sudo pacman -Rs astrobox-creator-console   # 卸载旧版
makepkg -si                                # 本地构建安装
```

### 3.2 推送 AUR

AUR `astrobox-creator-console` 由 [WaiJade](https://aur.archlinux.org/account/WaiJade) 维护：

```bash
git clone ssh://aur@aur.archlinux.org/astrobox-creator-console.git
cd astrobox-creator-console
# 替换 PKGBUILD 和 .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "修改提交消息"
git push
```

> 首次提交前请确认仓库根目录存在 `LICENSE` 文件，且 `PKGBUILD` 中的 `license=('AGPL-3.0')` 与实际授权一致。
