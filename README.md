> 🎵 **Ceru Music（澜音）** —— 基于 Electron + Vue 的跨平台桌面音乐播放器（AppImage 版本）

本包提供 [Ceru Music](https://github.com/timeshiftsauce/CeruMusic) 的 AppImage 封装，适用于 Arch Linux 及其衍生发行版。

## 🔧 功能特点

- 跨平台桌面音乐播放器（Linux / Windows / macOS）
- 支持通过**合规插件**获取公开音乐信息（不内置任何音乐源）
- 本地播放列表管理、歌词显示、精美 UI
- 插件化架构，用户可自行安装合法插件扩展功能

> ⚠️ **重要提示**：  
> Ceru Music **本身不提供任何音乐文件或版权内容**，仅提供插件运行框架。  
> 用户需自行安装符合《著作权法》及平台协议的插件，并对其合法性负责。

## 📦 安装

使用 AUR 助手安装（如 `yay`、`paru`）：

```bash
yay -S ceru-music-appimage
# 或
paru -S ceru-music-appimage
```

## ▶️ 启动

- 应用菜单搜索 “Ceru Music” 或 “澜音”
- 终端运行：`ceru-music`
- 支持打开 `.ceru` 项目文件

## 🔐 依赖

- `fuse2`（用于挂载 AppImage）
- `zlib`

首次运行若提示权限问题，请确保已安装 `fuse2`：

```bash
sudo pacman -S fuse2
```

## 🔄 自动更新

本包支持自动检测 GitHub 最新版本。运行以下命令即可升级：

```bash
yay -Syu
```

> ✅ 更新机制基于 GitHub Releases，无需手动干预。

## 🌐 官方资源

- **项目主页**：[https://ceru.docs.shiqianjiang.cn/](https://ceru.docs.shiqianjiang.cn/)
- **GitHub 仓库**：[https://github.com/timeshiftsauce/CeruMusic](https://github.com/timeshiftsauce/CeruMusic)
- **插件开发文档**：[https://ceru.docs.shiqianjiang.cn/guide/CeruMusicPluginDev.html](https://ceru.docs.shiqianjiang.cn/guide/CeruMusicPluginDev.html)

## ⚖️ 免责声明

本软件包仅为上游项目 [Ceru Music](https://github.com/timeshiftsauce/CeruMusic) 的 AppImage 打包，**不包含任何音乐数据**。  
使用本软件即表示您理解并同意：
- 所有音乐内容由第三方插件提供，责任自负
- 禁止用于非法下载、传播受版权保护的内容
- 遵守《中华人民共和国著作权法》及相关法律法规

---

© 2024–2026 时迁酱 et al.  
Packaged for Arch Linux by Display-HDMI.
