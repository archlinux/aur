# atk-logic-bin

[English](README.md) | 简体中文

这是 **ATK-Logic** 的 Arch Linux 打包。ATK-Logic 是正点原子（ALIENTEK）为其 ATK 系列逻辑分析仪提供的上位机软件，可用于信号捕获与显示、时序测量、协议解码（基于 libsigrokdecode）以及将采集数据导出为 CSV。

本仓库有两个用途：

- **镜像。** [Releases](https://github.com/kellyiscute/atk-logic-bin/releases) 页面存放正点原子官方 `.deb` 安装包的原版副本，未做任何修改。AUR 软件包 [`atk-logic-bin`](https://aur.archlinux.org/packages/atk-logic-bin) 从这里下载。
- **打包。** `PKGBUILD` 负责把这个 `.deb` 重新打包成 Arch Linux 软件包。

## 为什么他妈的要有这个镜像

ATK-Logic 采用 GPL-3.0-or-later 许可证，这是正点原子自己在仓库里写明的。然后呢？他们就把仓库扔在那儿烂掉了：[alientek-openedv/atk-logic](https://github.com/alientek-openedv/atk-logic) 从 2024 年 5 月起一个提交都没有。与此同时，新版本照样一个接一个地发，却只发闭源的预编译二进制，而且唯一的下载渠道是**他妈的百度网盘**：要登录，不充会员就限速，链接没法给任何 PKGBUILD、CI 或正常人使用。

挂个 GPL 的牌子，然后把仓库扔在一边，再通过一个封闭的网盘发二进制，这就是扯淡。名义上开源，实际上闭源，而且可以说违反了 GPL 提供对应源代码的要求。去他妈的。

所以都放在这儿了：官方 `.deb`，原封不动，附带校验和，一个普通的 `curl` 就能下载，本来从一开始就该这样。正点原子，如果你们看到了：把源码推上来，把二进制放到 GitHub Releases 上，这个镜像就可以删了。

## 上游

- **文档与官方下载：** https://www.openedv.com/docs/tool/luojifenxiyi/DL16.html
- **原始（已过时的）源代码（GPL-3.0-or-later）：** https://github.com/alientek-openedv/atk-logic

我与正点原子没有任何关系。软件本身的问题请查阅官方文档。打包相关的问题请在本仓库或 AUR 页面反馈。

## 安装

使用 AUR 助手：

```sh
paru -S atk-logic-bin   # 或：yay -S atk-logic-bin
```

或者手动构建：

```sh
git clone https://aur.archlinux.org/atk-logic-bin.git
cd atk-logic-bin
makepkg -si
```

然后运行 `atk-logic`，或从应用菜单中打开 **ATK-Logic**。

## 与官方 `.deb` 的区别

- 程序安装到 `/opt/atk-logic`，而不是 `/opt/apps/atk-logic`。
- 在 `/usr/bin` 中添加了 `atk-logic` 启动命令。
- 文件权限已规范化。原 `.deb` 中有大量文件是所有人可写的（0777）。
- 菜单项改为指向新的启动命令和图标位置。
- 正点原子的 udev 规则安装到 `/usr/lib/udev/rules.d/99-atk-logic-usb.rules`，让普通用户无需 root 即可通过 USB 访问逻辑分析仪。

程序二进制文件和自带的库均未改动。

## 注意事项

- ATK-Logic 只支持 X11。在 Wayland 会话下请安装 `xorg-xwayland`。
- 安装后请重新插拔逻辑分析仪，使 udev 规则生效。
- 配置文件保存在 `~/.local/share/ALIENTEK/ATK-LogicView`。

## 校验镜像

每个 Release 都列出了 `.deb` 的 SHA-256，`PKGBUILD` 中固定了同样的校验和：

```
8353b5866a7bfdf41a7573b223057711c42ffeb791eca36d4fe739934f559954  ATK-Logic_1.1.2.2_amd64.deb
```
