# musicxx-arch

Arch Linux 专用的 [Musicxx](https://github.com/coolight7/musicxx) 打包版本。
Musicxx 是一款基于 Flutter 的跨平台音视频播放器，简洁、开源、无广告。

本仓库提供了适配 Arch Linux 的 PKGBUILD 文件，可通过一条命令轻松构建与安装。

## 安装

### 从 AUR 安装（推荐）

```bash
paru -S musicxx-bin
```

### 从脚本构建

你也可以手动构建并安装：

```bash
git clone https://github.com/beanc904/musicxx-arch.git
cd musicxx-arch
makepkg -si
```

## 运行

安装完成后，在终端中输入：

```bash
/opt/musicxx/musicxx
```

或从应用菜单中启动 **Musicxx**。

## 特点

* 原生 GTK3 集成，界面美观流畅
* 支持常见音视频格式播放
* 本地文件浏览与播放列表管理
* 轻量、无广告、开源

## 贡献

感谢您的关注与贡献，详情请参阅[贡献指南](CONTRIBUTING.md)

## 项目链接

* 上游项目：[coolight7/musicxx](https://github.com/coolight7/musicxx)
* Arch 打包维护者：[beanc904/musicxx-arch](https://github.com/beanc904/musicxx-arch)

如果觉得不错的话，请给上游作者点个 star 吧。
