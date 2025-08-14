# nvm-fish

[![AUR version](https://img.shields.io/aur/version/nvm-fish?logo=arch-linux&logoColor=white)](https://aur.archlinux.org/packages/nvm-fish)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

*阅读其他语言版本: [English](README.md)*

Arch Linux 下 Fish shell 的 Node Version Manager (nvm) 集成。

## 概述

这个包为 Arch Linux 上的 Fish shell 提供了 nvm (Node Version Manager) 集成。它允许你在 Fish shell 中使用 nvm 命令，并支持通过 .nvmrc 文件自动切换 Node.js 版本。

### ✨ 主要特性

- 🐟 **完全的 Fish shell 集成**：所有 nvm 命令在 Fish 中无缝工作
- 🎯 **自动版本切换**：支持 .nvmrc 文件，基于目录自动切换
- 🔧 **智能依赖管理**：自动检测和安装 bass
- 📦 **零污染安装**：不破坏现有 Fish 环境
- ⚡ **即开即用**：安装后立即可用，无需配置

## 依赖

- `nvm` - Node Version Manager（来自 Arch Linux extra 仓库）
- `fish` - Fish shell
- `bass` - Bash 到 Fish 转换工具（自动管理）

## 安装

### 从 AUR 安装

```bash
# 使用 yay 或其他 AUR helper
yay -S nvm-fish

# 或者手动构建
git clone https://aur.archlinux.org/nvm-fish.git
cd nvm-fish
makepkg -si
```

### 自动配置

无需手动配置！第一次使用 nvm 命令时会自动：
- 检查和配置 bass 环境
- 设置 Fish shell 集成
- 启用自动版本切换

## 快速开始

安装完成后，运行一次初始化命令：

```fish
# 初始化 nvm-fish（安装后运行一次）
nvm init

# 然后你就可以正常使用所有 nvm 功能
nvm --version
nvm install node
nvm use node
```

**`nvm init` 命令会：**
- ✅ 检测并安装 bass 依赖（通过插件管理器或手动安装）
- ✅ 自动配置 Fish shell 集成
- ✅ 启用自动 .nvmrc 版本切换
- ✅ 设置无缝 nvm 使用所需的一切

## 使用方法

运行 `nvm init` 后，你可以正常使用所有 nvm 命令：

```fish
# 检查 nvm 版本
nvm --version

# 安装最新 Node.js
nvm install node

# 安装特定版本
nvm install 18.17.0

# 切换版本
nvm use 18

# 设置默认版本
nvm alias default 18

# 列出已安装版本
nvm ls

# 列出可用版本
nvm ls-remote

# 安装 LTS 版本
nvm install --lts
```

### 自动版本切换

创建 `.nvmrc` 文件实现自动版本切换：

```bash
# 在项目根目录创建 .nvmrc
echo "18.17.0" > .nvmrc

# 当你进入目录时，nvm 会自动切换到指定版本
cd your-project
```

## 工作原理

这个包提供了四个主要 Fish 函数：

1. `nvm` - 使用 bass 调用原始 bash nvm 命令（自动检测 bass 环境）
2. `nvm_find_nvmrc` - 在当前或父目录中查找 .nvmrc 文件
3. `load_nvm` - 目录改变时自动加载相应的 Node.js 版本
4. `__nvm_setup_bass` 和相关辅助函数 - 智能 bass 环境管理

### Bass 自动管理

- **检测现有安装**：首先检查 bass 是否已安装
- **插件管理器支持**：自动检测并使用 fisher、Oh My Fish、fundle
- **本地回退**：如果没有插件管理器，从 GitHub 下载源码并本地配置
- **环境保护**：本地安装不会影响用户的全局 Fish 配置

## 故障排除

### bass 相关问题

如果 bass 安装失败，可以手动安装：

```fish
# 安装 fisher 然后安装 bass
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
fisher install edc/bass

# 或安装 Oh My Fish 然后安装 bass
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install bass
```

### 函数未找到

如果看到 "Unknown command" 错误：

1. 重启 Fish shell：`exec fish`
2. 或者重新加载配置：`source ~/.config/fish/config.fish`

### 权限问题

确保你有安装包的权限，某些 AUR helper 可能需要 sudo。

## 常见问题

**Q: 安装后 nvm 命令不工作？**
A: 请重启 Fish shell 或运行 `exec fish`。这是 Fish 的正常行为。

**Q: 可以与现有的 bash nvm 安装共存吗？**
A: 可以！这个包使用官方 nvm 包作为依赖，所以完全兼容。

**Q: 自动版本切换不工作？**
A: 确保 load_nvm 已添加到你的 config.fish。包会自动处理这个，但如果你手动修改过配置文件，可能需要重新添加。

## 贡献

欢迎贡献！请：

1. Fork 这个仓库
2. 创建特性分支：`git checkout -b my-new-feature`
3. 提交更改：`git commit -am 'Add some feature'`
4. 推送到分支：`git push origin my-new-feature`
5. 提交 Pull Request

## 许可证

MIT License - 与上游 nvm 项目保持一致。