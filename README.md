# Apollo Neo Environment Manager (Dev)

这是 Apollo Neo 环境管理器的 Arch Linux AUR 包，从 Ubuntu 移植而来。

## 描述

Apollo Neo 环境管理器是百度 Apollo 自动驾驶平台的环境管理工具，主要用于管理和设置 Apollo 开发环境。此 AUR 包将 Ubuntu 版本的工具适配到 Arch Linux 上。

## 安装

可以使用标准的 AUR 包管理工具安装：

```bash
# 使用yay
yay -S apollo-neo-env-manager-dev

# 或者手动安装
git clone https://aur.archlinux.org/apollo-neo-env-manager-dev.git
cd apollo-neo-env-manager-dev
makepkg -si
```

## 使用

安装后，可以通过以下命令使用：

```bash
# 使用简写命令
aem

# 或使用完整命令
apollo-neo-env-manager-dev
```

## 依赖项

- curl
- gnupg
- ca-certificates

## 兼容性提示

由于这是从 Ubuntu 移植的软件包，某些功能可能需要额外的设置才能在 Arch Linux 环境中正常工作。程序使用了 apt 相关的目录结构，这些已在安装过程中进行了适配。

## 卸载

可以使用标准的 pacman 命令卸载：

```bash
sudo pacman -R apollo-neo-env-manager-dev
```

## 许可证

请参考 Apollo 项目的 LICENSE 文件。

## 维护者

SakuraPuare 

`sakurapuare at sakurapuare dot com`