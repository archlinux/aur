<div align="center">

# AUR Package: neve-bin

[![AUR](https://img.shields.io/aur/version/neve-bin?color=1793d1)](https://aur.archlinux.org/packages/neve-bin)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)

*A pure functional language for system configuration and package management*

**[English](#english)** | **[中文](#中文)**

</div>

---

## English

### About

This is the AUR package for [Neve](https://github.com/MCB-SMART-BOY/Neve) that installs prebuilt binaries. For building from source, see [neve-git](https://aur.archlinux.org/packages/neve-git).

### Package Comparison

| Package | neve-bin | neve-git |
|:--------|:---------|:---------|
| Build | Prebuilt binary | From source |
| Install time | Fast (~10s) | Slow (~5min) |
| Version | Latest release | Latest commit |
| Disk usage | Minimal | Requires Rust toolchain |

**Recommendation:** Use `neve-bin` unless you need the latest unreleased features.

### Supported Architectures

| Architecture | Status |
|:-------------|:-------|
| x86_64 | ✅ Supported |
| aarch64 | ✅ Supported |

### Installation

Using an AUR helper (recommended):

```bash
# Using yay
yay -S neve-bin

# Using paru
paru -S neve-bin
```

Manual installation:

```bash
git clone https://aur.archlinux.org/neve-bin.git
cd neve-bin
makepkg -si
```

### Upgrade

```bash
yay -Syu neve-bin
```

### Uninstall

```bash
sudo pacman -Rns neve-bin
```

### Usage

```bash
neve repl              # Start interactive REPL
neve eval "1 + 2"      # Evaluate expression
neve run file.neve     # Run a file
neve doc               # View documentation
neve doc quickstart    # Quick start guide
```

### Quick Example

```bash
$ neve repl
neve> let greet = fn(name) `Hello, {name}!`
neve> greet("World")
"Hello, World!"
```

### Links

- [Neve Repository](https://github.com/MCB-SMART-BOY/Neve)
- [neve-git (from source)](https://aur.archlinux.org/packages/neve-git)
- [Documentation](https://github.com/MCB-SMART-BOY/Neve/tree/master/docs)
- [Issue Tracker](https://github.com/MCB-SMART-BOY/Neve/issues)
- [Releases](https://github.com/MCB-SMART-BOY/Neve/releases)

---

## 中文

### 关于

这是 [Neve](https://github.com/MCB-SMART-BOY/Neve) 的 AUR 包，安装预编译二进制。如需从源码构建，请参见 [neve-git](https://aur.archlinux.org/packages/neve-git)。

### 包对比

| 包 | neve-bin | neve-git |
|:---|:---------|:---------|
| 构建方式 | 预编译二进制 | 从源码构建 |
| 安装时间 | 快（约 10 秒） | 慢（约 5 分钟） |
| 版本 | 最新发布版 | 最新提交 |
| 磁盘占用 | 最小 | 需要 Rust 工具链 |

**推荐：** 使用 `neve-bin`，除非你需要最新的未发布功能。

### 支持架构

| 架构 | 状态 |
|:-----|:-----|
| x86_64 | ✅ 支持 |
| aarch64 | ✅ 支持 |

### 安装

使用 AUR 助手（推荐）：

```bash
# 使用 yay
yay -S neve-bin

# 使用 paru
paru -S neve-bin
```

手动安装：

```bash
git clone https://aur.archlinux.org/neve-bin.git
cd neve-bin
makepkg -si
```

### 升级

```bash
yay -Syu neve-bin
```

### 卸载

```bash
sudo pacman -Rns neve-bin
```

### 使用

```bash
neve repl              # 启动交互式 REPL
neve eval "1 + 2"      # 求值表达式
neve run file.neve     # 运行文件
neve doc               # 查看文档
neve doc quickstart    # 快速入门
```

### 快速示例

```bash
$ neve repl
neve> let greet = fn(name) `你好，{name}！`
neve> greet("世界")
"你好，世界！"
```

### 链接

- [Neve 仓库](https://github.com/MCB-SMART-BOY/Neve)
- [neve-git（从源码构建）](https://aur.archlinux.org/packages/neve-git)
- [文档](https://github.com/MCB-SMART-BOY/Neve/tree/master/docs)
- [问题反馈](https://github.com/MCB-SMART-BOY/Neve/issues)
- [版本发布](https://github.com/MCB-SMART-BOY/Neve/releases)

---

<div align="center">

**[Neve](https://github.com/MCB-SMART-BOY/Neve)** · **[License: MPL-2.0](https://github.com/MCB-SMART-BOY/Neve/blob/master/LICENSE)**

</div>
