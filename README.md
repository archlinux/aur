<div align="center">

# AUR Package: neve-git

[![AUR](https://img.shields.io/aur/version/neve-git?color=1793d1)](https://aur.archlinux.org/packages/neve-git)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)

*A standalone language for system configuration, reproducible builds, and structured shell automation*

</div>

---

## About / 关于

This is the AUR package for [Neve](https://github.com/MCB-SMART-BOY/Neve) that builds from source (git). For prebuilt binaries, use [neve-bin](https://aur.archlinux.org/packages/neve-bin).
这是 [Neve](https://github.com/MCB-SMART-BOY/Neve) 的 AUR 源码构建包（git 版本）。如需预编译二进制，请使用 [neve-bin](https://aur.archlinux.org/packages/neve-bin)。

## Package Comparison / 包对比

| Item / 项目 | neve-bin | neve-git |
|:--|:--|:--|
| Build / 构建 | Prebuilt binary / 预编译二进制 | From source / 源码构建 |
| Install time / 安装时间 | Fast (~10s) / 快（约 10 秒） | Slow (~5min) / 慢（约 5 分钟） |
| Version / 版本 | Latest release / 最新发布版 | Latest commit / 最新提交 |
| Disk usage / 磁盘占用 | Minimal / 最小 | Requires Rust toolchain / 需要 Rust 工具链 |

## Supported Architectures / 支持架构

| Architecture / 架构 | Status / 状态 |
|:--|:--|
| x86_64 | ✅ Supported / ✅ 支持 |
| aarch64 | ✅ Supported / ✅ 支持 |

## Installation / 安装

Using an AUR helper (recommended) / 使用 AUR 助手（推荐）：

```bash
# Using yay / 使用 yay
yay -S neve-git

# Using paru / 使用 paru
paru -S neve-git
```

Manual installation / 手动安装：

```bash
git clone https://aur.archlinux.org/neve-git.git
cd neve-git
makepkg -si
```

## Upgrade / 升级

```bash
yay -Syu neve-git
```

## Uninstall / 卸载

```bash
sudo pacman -Rns neve-git
```

## Usage / 使用

```bash
neve repl              # Start interactive REPL / 启动交互式 REPL
neve eval "1 + 2"      # Evaluate expression / 求值表达式
neve run file.neve     # Run a file / 运行文件
neve doc               # View documentation / 查看文档
```

## Links / 链接

- [Neve Repository / 仓库](https://github.com/MCB-SMART-BOY/Neve)
- [neve-bin (prebuilt) / neve-bin（预编译）](https://aur.archlinux.org/packages/neve-bin)
- [Documentation / 文档](https://github.com/MCB-SMART-BOY/Neve/tree/master/docs)
- [Issue Tracker / 问题反馈](https://github.com/MCB-SMART-BOY/Neve/issues)

---

<div align="center">

**[Neve](https://github.com/MCB-SMART-BOY/Neve)** · **[License: MPL-2.0](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)**

</div>
