[![PKGBUILD CI](https://github.com/abcfy2/deepin-wine5-aur/workflows/PKGBUILD%20CI/badge.svg)](https://github.com/abcfy2/deepin-wine5-aur/actions)
[![AUR version](https://img.shields.io/aur/version/deepin-wine5?style=plastic)](https://aur.archlinux.org/packages/deepin-wine5/)
[![AUR votes](https://img.shields.io/aur/votes/deepin-wine5?style=plastic)](https://aur.archlinux.org/packages/deepin-wine5/)

# deepin-wine5-aur

本项目存储[deepin-wine5](https://aur.archlinux.org/packages/deepin-wine5/)的 AUR 构建脚本。本仓库接受 PR，一旦 push 到 master 分支将会触发 github action 的 CI 流程，自动发布至 AUR [deepin-wine5](https://aur.archlinux.org/packages/deepin-wine5/)。

感谢 deepin 的开发，感谢[deepin-wine](https://aur.archlinux.org/packages/deepin-wine/)的构建脚本提供参考。

> 本项目初步完成 AUR 打包，可能不是很完善，一些兼容性处理比较粗糙，欢迎提交 PR 和修正意见

## 安装

直接通过 AUR 仓库安装:

```shell
# 目前还处于评估阶段，不建议安装deepin-wine5-tools这个包，会卸载掉 wine
yay -S deepin-wine5
```

本地打包直接安装:

```shell
# 如果未添加 archlinuxcn 仓库，需要提前从 AUR 安装 deepin-udis86 这个依赖
yay -S deepin-udis86
makepkg -si
```

## 持续集成说明

本项目使用 [Github Action](https://github.com/features/actions) 做持续集成，所有 push 和 PR 的代码会先运行打包测试，然后自动生成 `.SRCINFO`。

对于 push 到中央仓库`master`分支的代码将会自动提交到[deepin-wine5](https://aur.archlinux.org/packages/deepin-wine5/)。

由于仅做了打包和安装的测试，并未做其他完善的运行测试。为了保证软件包的质量，请确保在本地运行之后再提交。
