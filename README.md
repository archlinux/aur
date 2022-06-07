# YesPlayMusic OSD (AUR Build)

> 🌚 两个接触 AUR 没多久的人弄出来的玩意儿（

YesPlayMusic 是一个高颜值的网易云音乐客户端，你可以在 [qier222/YesPlayMusic](https://github.com/qier222/YesPlayMusic) 了解更多信息。

此 repo 基于其 fork [YesPlayMusicOSD](https://github.com/shih-liang/YesPlayMusicOSD) 制作，加回了桌面歌词的特性。

## 使用

### AUR

现在你可以通过任意 AUR Helper (e.g. [yay](https://github.com/Jguer/yay), [trizen](https://github.com/trizen/trizen)) 来安装，以使用 yay 作為範例：

```sh
yay -S yesplaymusicosd-git
```

### 手动安装

clone 此 repo
```sh
git clone https://github.com/BlockG-ws/YesPlayMusicOSD-aur.git
```

在 repo 目录当中（`cd ./YesPlayMusicOSD-aur`）运行 `makepkg` 并安装所需依赖后即可安装。

以[标记为 dda77ac 的 commit](https://github.com/kuohuanhuan-forkonly/YesPlayMusicOSD-AUR/commit/dda77ace44d3187eed71237cd9af0f084def035a) 打包为例，安装命令为

```sh
sudo pacman -U yesplaymusicosd-git-0.4.5.r28.gdda77ac-1-x86_64.pkg.tar.zst
```

## 许可证

Copyright (c) 2022 WorkspaceG, licensed under MIT.
