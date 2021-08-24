[![PKGBUILD CI](https://github.com/abcfy2/ukylin-wine-aur/workflows/PKGBUILD%20CI/badge.svg)](https://github.com/abcfy2/ukylin-wine-aur/actions)
[![AUR version](https://img.shields.io/aur/version/ukylin-wine?style=plastic)](https://aur.archlinux.org/packages/ukylin-wine/)
[![AUR votes](https://img.shields.io/aur/votes/ukylin-wine?style=plastic)](https://aur.archlinux.org/packages/ukylin-wine/)

# ukylin-wine-aur

本项目存储[ukylin-wine](https://aur.archlinux.org/packages/ukylin-wine/)的 AUR 构建脚本。本仓库接受 PR，一旦 push 到 main 分支将会触发 github action 的 CI 流程，自动发布至 AUR [ukylin-wine](https://aur.archlinux.org/packages/ukylin-wine/)。

关于 ukylin-wine 的发布情况和描述可以参考 ubuntu kylin 官方 blog: https://www.ubuntukylin.com/news/1682-cn.html

当前可以运行的程序参见**wine 专区**部分: https://www.ubuntukylin.com/applications/

## 安装

直接通过 AUR 仓库安装:

```shell
yay -S ukylin-wine
```

本地打包直接安装:

```shell
makepkg -si
```

## 持续集成说明

本项目使用 [Github Action](https://github.com/features/actions) 做持续集成，所有 push 和 PR 的代码会先运行打包测试，然后自动生成 `.SRCINFO`。

对于 push 到中央仓库`main`分支的代码将会自动提交到[ukylin-wine](https://aur.archlinux.org/packages/ukylin-wine/)。

由于仅做了打包和安装的测试，并未做其他完善的运行测试。为了保证软件包的质量，请确保在本地运行之后再提交。
