# 在Archlinux及衍生发行版上运行QQ音乐

基于deepin wine应用打包的QQ音乐

构建状态: [![travis-ci](https://travis-ci.org/countstarlight/wine-qq-music-arch.svg?branch=master)](https://travis-ci.org/countstarlight/wine-qq-music-arch)

感谢:

* [Wuhan Deepin Technology Co.,Ltd.](http://www.deepin.org/)

存在如下问题：
  * 1.字体发虚

## 安装
* 1.已添加到AUR [wine-qq-music](https://aur.archlinux.org/packages/wine-qq-music/)，可直接安装:
```shell
yaourt wine-qq-music
```

* 2.手动安装

```shell
 git clone https://github.com/countstarlight/wine-qq-music-arch.git

 cd wine-qq-music-arch
  
 makepkg -si
```

* 运行开始菜单中创建的QQ音乐，点击立即安装
* 安装完可直接启动，以后启动时无需安装
* 默认使用文泉驿微米黑(`wqy-microhei`)字体，要使用其他字体，如 微软雅黑或者微软宋体放进`～/.deepinwine/Deepin-QQ/drive_c/windows/Fonts`中。
## 常见问题
* 1.解决在 2k/4k 屏幕下字体和图标都非常小, 参见[issue1](https://github.com/countstarlight/deepin-wine-tim-arch/issues/1)
* 2.使用全局截图快捷键和解决Gnome上窗口化问题，参见[issue2](https://github.com/countstarlight/deepin-wine-tim-arch/issues/2)
## 更新日志
* 2018-7-12 QQ Music 15.9.5