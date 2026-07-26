# Arch Linux AUR 安装与卸载指南

## 安装方式

### 方式一：从 AUR 安装（推荐）

#### 使用 yay

```bash
# 安装 yay (如果还没有)
sudo pacman -S yay

# 安装 lx-music-shell
yay -S lx-music-shell
```

#### 使用 pacman 和 makepkg

```bash
# 克隆 AUR 仓库
git clone https://aur.archlinux.org/lx-music-shell.git
cd lx-music-shell

# 构建并安装
makepkg -si
```

### 方式二：使用 PKGBUILD 构建

```bash
# 下载源码和 PKGBUILD
wget https://github.com/yourname/lx-music-shell/archive/v1.1.0.tar.gz
tar xzf v1.1.0.tar.gz
cd lx-music-shell-1.1.0/aur

# 编辑 PKGBUILD (可选)
nano PKGBUILD

# 构建包
makepkg -s

# 安装
sudo pacman -U lx-music-shell-1.1.0-1-any.pkg.tar.zst
```

### 方式三：一键安装脚本

```bash
git clone https://github.com/yourname/lx-music-shell.git
cd lx-music-shell
chmod +x install-aur.sh
./install-aur.sh
```

---

## 卸载方式

### 方式一：使用 pacman 卸载（推荐）

如果通过 pacman/yay 安装的：

```bash
# 仅删除包（保留用户配置）
sudo pacman -R lx-music-shell

# 删除包及其依赖
sudo pacman -Rns lx-music-shell
```

或者使用 yay：

```bash
# 仅删除包
yay -R lx-music-shell

# 删除包及其依赖
yay -Rns lx-music-shell
```

### 方式二：使用提供的卸载脚本

卸载脚本位于：
- AUR 包安装: `/usr/bin/lx-music-shell-uninstall`
- 手动安装: 仓库根目录的 `uninstall.sh`

```bash
# AUR 包安装的版本
sudo lx-music-shell-uninstall

# 手动安装的版本
./uninstall.sh
```

卸载脚本会询问是否保留用户配置。

### 方式三：手动卸载

```bash
# 删除二进制文件
sudo rm /usr/bin/lx-music-shell
sudo rm /usr/bin/lx-music-sources
sudo rm /usr/bin/lx-music-shell-uninstall

# 删除 man 页面
sudo rm /usr/share/man/man1/lx-music-shell.1
sudo rm /usr/share/man/man1/lx-music-sources.1
sudo mandb

# 删除 bash 补全
sudo rm /usr/share/bash-completion/completions/lx-music-shell

# 删除桌面文件
sudo rm /usr/share/applications/lx-music-shell.desktop
sudo update-desktop-database

# 删除文档
sudo rm -rf /usr/share/doc/lx-music-shell

# 删除 etc/skel 配置（可选）
sudo rm -rf /etc/skel/.config/lx-music-shell

# 删除用户配置（可选，谨慎操作）
rm -rf ~/.config/lx-music-shell
rm -rf ~/.cache/lx-music-shell
rm -rf ~/.local/share/lx-music-shell
rm -rf ~/Music/LX-Music-Shell
```

### 一键完整清理（所有内容）

```bash
# 卸载包
sudo pacman -Rns lx-music-shell

# 清理所有用户文件
rm -rf ~/.config/lx-music-shell
rm -rf ~/.cache/lx-music-shell
rm -rf ~/.local/share/lx-music-shell
rm -rf ~/Music/LX-Music-Shell
```

---

## 依赖

### 必需依赖
- bash >= 4.0
- curl
- grep
- sed
- awk

### 可选依赖
- mpv (推荐，默认播放器)
- mplayer (替代播放器)
- ffmpeg (ffplay 后端)
- jq (JSON 解析增强)

安装所有依赖:
```bash
sudo pacman -S bash curl grep sed awk mpv jq ffmpeg
```

---

## 安装后配置

### 首次运行
```bash
lx-music-shell
```

### 配置文件位置

| 文件 | 位置 |
|------|------|
| 主配置 | `~/.config/lx-music-shell/config` |
| 源配置 | `~/.config/lx-music-shell/sources.list` |
| 缓存 | `~/.cache/lx-music-shell/` |
| 数据 | `~/.local/share/lx-music-shell/` |
| 下载音乐 | `~/Music/LX-Music-Shell/` |

### 测试安装
```bash
lx-music-shell --version
lx-music-shell --test-sources
```

---

## 常见问题

### Q: 提示 "命令未找到"
A: 确保 `~/.local/bin` 在 PATH 中，或重新登录终端

### Q: 播放器不工作
A: 安装 mpv: `sudo pacman -S mpv`

### Q: 源连接失败
A: 使用 `/update-sources` 更新源配置

### Q: 如何完全卸载？
A:
```bash
sudo pacman -Rns lx-music-shell
rm -rf ~/.config/lx-music-shell
rm -rf ~/.cache/lx-music-shell
```

### Q: 卸载后还能恢复吗？
A: 如果保留了 `~/.config/lx-music-shell/`，重新安装后配置还在。完整清理后再安装就是全新状态。