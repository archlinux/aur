# splayer-pacman

为 splayer 提供 Arch 系原生 pacman 版本构建及安装。

本仓库由 Github repo 修改后再提交到 [AUR - splayer](https://aur.archlinux.org/packages/splayer)

[imsyy/SPlayer](https://github.com/imsyy/SPlayer)
在 Splayer 仓库中注明了需要使用 AGPL-3.0 license 使用本项目也修改为相关协议，请知悉。

Clone form `https://aur.archlinux.org/splayer-appimage.git`
因为已有项目使用 splayer-bin 此项目不使用 -bin 作为 AUR 打包名
因为 v3.0 以后更新提供了 pacman 原生包，此仓库基于原来的 aur.archlinux.org/splayer-appimage 进行修改，目前只基于原版 Splayer 提供的 .pacman 进行打包且支持 arm64(aarch64)&amd64(x86_64) 架构进行打包安装。

目前还没考虑适配使用系统的 Electron 版本，如果你有更好的方法，欢迎提交。

## 仓库食用指南

如不需要自行构建测试，请使用 AUR 直接进行安装。

```bash
git clone https://github.com/miaoermua/splayer-pacman.git
cd splayer-pacman
makepkg -si
```

## 通过 AUR 安装

- 使用 paru AUR 助手

```bash
paru -S splayer
```
- 使用 yay AUR 助手

```bash
yay -S splayer
```

## Contributor

本仓库使用 Github action 完成自动化更新并且提交到 AUR

此仓库不保证绝对更新速度，如你也想参与更新维护可以联系我。你只需要处理额外的错误和 CI 发起的 PR 即可～
