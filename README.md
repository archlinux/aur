# Zeta Package Manager (ZPM)

一个受 paru/yay 启发的多功能包管理器，支持 AUR、Debian 包转换、Pacman 和 APT 源。

## 作者

**Zeta** <3380089537@qq.com>

## 功能特性

### 1. AUR 包管理
- 🔍 搜索 AUR 包
- 📦 安装 AUR 包（自动解析递归依赖）
- 🔄 更新 AUR 包
- 📋 克隆 AUR 仓库
- ℹ️ 查看 AUR 包信息
- 📊 列出已安装的 AUR 包

### 2. Debian 包支持
- 📦 直接安装 .deb 包
- 🔄 将 .deb 包转换为 Arch 的 pkg.tar.zst 格式
- 📋 解析 Debian control 文件
- 🗺️ **智能依赖映射**（500+ 预定义映射）
- ❓ **依赖名不匹配时询问用户**（跳过/手动输入/从 AUR 安装）
- 📂 提取 deb 包内容

### 3. APT 源支持
- 🔍 从 APT 源搜索包
- 📦 从 APT 源下载并安装到 Arch 系统
- 🔄 自动转换为 Arch 格式
- 🗺️ 依赖自动映射和转换
- ⚙️ 支持多个 APT 源配置

### 4. Pacman 软件源
- 📋 读取 pacman.conf 中的软件源
- 📊 列出所有配置的软件源
- 🔍 在软件源中搜索包
- 🔄 同步软件源数据库

### 5. 本地构建
- 🔨 从 PKGBUILD 本地构建
- 📦 自动安装构建依赖
- 📂 支持自定义构建目录

## 安装

### 方法1: 使用安装脚本（推荐）

```bash
# 克隆仓库
git clone https://github.com/ZhongHongSoftware/zpm.git
cd zpm

# 运行安装脚本
sudo ./install.sh
```

### 方法2: 使用 Makefile

```bash
# 安装到系统
sudo make install

# 本地安装（无需 root）
make local-install

# 卸载
sudo make uninstall
```

### 方法3: 构建 Arch 包

```bash
# 使用构建脚本
./build-aur.sh

# 或使用 Makefile
make dist      # 创建源码压缩包
make package   # 构建 Arch 包
makepkg -si    # 构建并安装
```

## 使用方法

### 基本命令 (pacman 风格)

```bash
# 安装包
zpm -S firefox                    # 从官方仓库或 AUR 安装
zpm -S ./package.deb              # 安装 deb 包
zpm install firefox

# 移除包
zpm -R firefox
zpm remove firefox

# 升级所有包
zpm -U
zpm upgrade

# 更新软件源
zpm -Sy
zpm update

# 搜索包
zpm -Ss editor
zpm search editor

# 显示包信息
zpm -Si firefox
zpm info firefox

# 列出已安装包
zpm -Q
zpm list

# 清理缓存
zpm clean

# 显示帮助
zpm -h
zpm --help

# 显示版本
zpm -V
zpm --version
```

### AUR 命令

```bash
# 搜索 AUR
zpm aur search google-chrome

# 安装 AUR 包（自动处理 AUR 依赖）
zpm aur install google-chrome

# 更新所有 AUR 包
zpm aur update

# 列出已安装的 AUR 包
zpm aur list

# 查看 AUR 包信息
zpm aur info google-chrome

# 克隆 AUR 仓库
zpm aur clone google-chrome
```

### Debian 包命令

```bash
# 显示 deb 包信息
zpm deb info ./package.deb

# 转换 deb 包为 Arch 格式
zpm deb convert ./package.deb
zpm deb convert ./package.deb /output/dir

# 安装 deb 包（转换后安装）
zpm deb install ./package.deb

# 提取 deb 包
zpm deb extract ./package.deb
```

**deb 包依赖处理：**

当转换或安装 deb 包时，如果依赖在 Arch 官方仓库找不到，会显示以下菜单：

```
依赖 'xxx' 在 Arch 官方仓库中未找到。
选项:
  1) 跳过此依赖 (继续构建)
  2) 输入 Arch 系统中的对应包名
  3) 从 AUR 安装
请选择 [1-3] (默认: 1):
```

### APT 源命令

```bash
# 从 APT 源搜索
zpm apt search htop

# 从 APT 源安装（自动转换）
zpm apt install htop

# 更新 APT 源列表
zpm apt update

# 添加 APT 源
zpm apt add myrepo http://myrepo.com/debian stable main

# 列出 APT 源
zpm apt list
```

### 软件源命令

```bash
# 列出所有软件源
zpm repo list

# 更新软件源
zpm repo update

# 在软件源中搜索
zpm repo search firefox
```

### 本地构建

```bash
# 构建 PKGBUILD
zpm build ./PKGBUILD

# 或构建目录
zpm build ./my-package
```

### 全局选项

```bash
# 跳过确认
zpm -S firefox --noconfirm
zpm --noconfirm -S firefox

# 详细输出
zpm -S firefox --verbose

# 调试模式
zpm -S firefox --debug

# 只安装需要的包
zpm -S firefox --needed

# 作为依赖安装
zpm -S firefox --asdeps
```

## Debian 到 Arch 包名映射

ZPM 内置了 **500+** 个 Debian 到 Arch 的包名映射，涵盖：

- **基础系统**: libc, gcc, zlib, openssl
- **Python 生态**: python3, numpy, requests, flask, django 等 50+ 包
- **图形库**: GTK, Qt, Mesa, OpenGL
- **X11 系统**: 完整的 X11 库
- **字体**: FreeType, FontConfig, 中文字体
- **图像处理**: PNG, JPEG, WebP, TIFF
- **压缩**: bzip2, xz, zstd, lz4
- **网络**: curl, gnutls, krb5, openssh
- **数据库**: SQLite, MariaDB, PostgreSQL, MongoDB
- **音频/视频**: ALSA, PulseAudio, GStreamer
- **开发工具**: cmake, meson, autotools
- **系统工具**: systemd, dbus, polkit, pam
- **安全**: apparmor, selinux, audit
- **硬件**: libusb, libdrm, Vulkan, Wayland

映射规则：
1. 首先查找预定义映射表
2. 如果没有匹配，尝试通用规则（如 `libxxx` → `xxx`）
3. 如果还找不到，询问用户

## 配置文件

### 主配置
配置文件位于 `~/.zpm/config/zpm.conf`：

```ini
[general]
noconfirm = no
verbose = no
debug = no

[aur]
base_url = https://aur.archlinux.org

[deb]
auto_map_deps = yes
```

### APT 源配置
APT 源配置文件位于 `~/.zpm/config/apt.conf`：

```
# 格式: 名称 URL 发行版 组件...
debian-stable http://deb.debian.org/debian stable main contrib non-free
debian-security http://security.debian.org/debian-security stable-security main contrib non-free
ubuntu-jammy http://archive.ubuntu.com/ubuntu jammy main restricted universe multiverse
```

## 依赖

- bash
- curl
- jq
- git
- pacman
- tar
- gzip
- python3
- makepkg

## 目录结构

```
~/.zpm/
├── cache/          # 缓存目录
│   ├── aur/        # AUR 包缓存
│   ├── deb/        # deb 包缓存
│   └── apt/        # APT 源缓存
├── build/          # 构建目录
│   ├── aur/        # AUR 构建
│   └── deb/        # deb 转换构建
├── config/         # 配置文件
│   ├── zpm.conf    # 主配置
│   └── apt.conf    # APT 源配置
└── logs/           # 日志文件
    └── zpm.log     # 主日志
```

## 系统目录

```
/usr/lib/zpm/
├── bin/zpm              # 主程序
├── lib/
│   ├── sh/              # Shell 脚本库
│   │   ├── install.sh   # 安装模块
│   │   ├── aur.sh       # AUR 模块
│   │   ├── deb.sh       # Debian 包模块
│   │   ├── apt.sh       # APT 源模块
│   │   ├── repo.sh      # 软件源模块
│   │   └── ...
│   └── python/          # Python 工具
│       └── deb_parser.py # deb 包解析器
└── docs/                # 文档
```

## 工作原理

### AUR 安装流程
1. 通过 AUR RPC API 搜索包信息
2. 递归解析所有依赖（包括 AUR 依赖的依赖）
3. 安装官方仓库依赖
4. 递归安装 AUR 依赖
5. 克隆 AUR 仓库
6. 构建并安装包

### deb 包转换流程
1. 提取 deb 包内容（ar + tar）
2. 解析 control 文件
3. 转换依赖名（Debian → Arch）
4. 创建 PKGBUILD
5. 安装依赖（找不到时询问用户）
6. 使用 makepkg 构建
7. 生成 pkg.tar.zst 包

### APT 源安装流程
1. 从 APT 源下载 Packages.gz
2. 解析包信息和依赖
3. 下载 deb 包
4. 转换为 Arch 格式
5. 安装转换后的包

## 常见问题

### Q: 为什么有些 deb 包依赖找不到？
A: Debian 和 Arch 的包名不完全一致。ZPM 会：
1. 首先使用内置映射表（500+ 映射）
2. 尝试通用规则（libxxx → xxx）
3. 询问用户手动输入或从 AUR 安装

### Q: AUR 包的依赖也是 AUR 包，怎么处理？
A: ZPM 会自动递归解析和安装 AUR 依赖。

### Q: 如何跳过依赖询问？
A: 使用 `--noconfirm` 选项，会自动跳过所有依赖。

### Q: deb 包转换失败怎么办？
A: 可以尝试直接安装：`zpm deb install ./package.deb`，选择"直接提取安装"模式。

## 许可证

GPL-3.0

## 致谢

- 受 paru 和 yay 启发
- AUR RPC API: https://aur.archlinux.org/rpc
