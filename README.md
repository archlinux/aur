<div align="center">

# AUR Package: neve-bin

[![AUR](https://img.shields.io/aur/version/neve-bin?color=1793d1)](https://aur.archlinux.org/packages/neve-bin)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)

*A standalone language for system configuration, reproducible builds, and structured shell automation*

</div>

---

## About / 关于

This is the AUR package for [Neve](https://github.com/MCB-SMART-BOY/Neve) that installs prebuilt binaries. For building from source, use [neve-git](https://aur.archlinux.org/packages/neve-git).
这是 [Neve](https://github.com/MCB-SMART-BOY/Neve) 的 AUR 预编译二进制包。如需从源码构建，请使用 [neve-git](https://aur.archlinux.org/packages/neve-git)。

## Package Comparison / 包对比

| Item / 项目 | neve-bin | neve-git |
|:--|:--|:--|
| Build / 构建 | Prebuilt binary / 预编译二进制 | From source / 源码构建 |
| Install time / 安装时间 | Fast (~10s) / 快（约 10 秒） | Slow (~5min) / 慢（约 5 分钟） |
| Version / 版本 | Latest release / 最新发布版 | Latest commit / 最新提交 |
| Disk usage / 磁盘占用 | Minimal / 最小 | Requires Rust toolchain / 需要 Rust 工具链 |

Recommendation: use `neve-bin` unless you need the latest unreleased features.
推荐：除非需要最新未发布特性，否则建议使用 `neve-bin`。

## Supported Architectures / 支持架构

| Architecture / 架构 | Status / 状态 |
|:--|:--|
| x86_64 | ✅ Supported / ✅ 支持 |
| aarch64 | ✅ Supported / ✅ 支持 |

## Installation / 安装

Using an AUR helper (recommended) / 使用 AUR 助手（推荐）：

```bash
# Using yay / 使用 yay
yay -S neve-bin

# Using paru / 使用 paru
paru -S neve-bin
```

Manual installation / 手动安装：

```bash
git clone https://aur.archlinux.org/neve-bin.git
cd neve-bin
makepkg -si
```

## Upgrade / 升级

```bash
yay -Syu neve-bin
```

## Uninstall / 卸载

```bash
sudo pacman -Rns neve-bin
```

## Usage / 使用

```bash
neve repl              # Start interactive REPL / 启动交互式 REPL
neve eval "1 + 2"      # Evaluate expression / 求值表达式
neve run file.neve     # Run a file / 运行文件
neve doc               # View documentation / 查看文档
neve doc quickstart    # Quick start guide / 快速入门
```

## Quick Example / 快速示例

```bash
$ neve repl
neve> let greet = fn(name) `Hello, {name}!`
neve> greet("World")
"Hello, World!"
```

## Links / 链接

- [Neve Repository / 仓库](https://github.com/MCB-SMART-BOY/Neve)
- [neve-git (from source) / neve-git（源码构建）](https://aur.archlinux.org/packages/neve-git)
- [Documentation / 文档](https://github.com/MCB-SMART-BOY/Neve/tree/master/docs)
- [Issue Tracker / 问题反馈](https://github.com/MCB-SMART-BOY/Neve/issues)
- [Releases / 版本发布](https://github.com/MCB-SMART-BOY/Neve/releases)

---

<div align="center">

**[Neve](https://github.com/MCB-SMART-BOY/Neve)** · **[License: MPL-2.0](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)**

</div>
