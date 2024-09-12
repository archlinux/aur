# Sogou Pinyin for Linux

Support `Wayland` and `X11`

## About `10.0.9.0.8`

OpenKylin源添加一开始添加了一部分 `10.0.9.0.8` 的包，但是也不能用。
OpenKylin源后面索性直接删除了所有 `10.0.9.0.8` ，因此本仓库暂时回退。

Deepin V23的源中有包，但是需要重新适配。

## Build

```bash
makepkg -si
```

## Update `.SRCINFO`

```bash
makepkg --printsrcinfo > .SRCINFO
```

## KDE

KDE可能需要额外安装 `kcm-fcitx5` ，
这样您的设置界面才会出现 `输入法` 选项卡。

```
sudo pacman -S kcm-fcitx5
```

## Wayland环境变量的设置

编辑或创建 `/etc/fcitx_env.sh` 文件，添加下列内容：

```bash
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
```

最好在 `~/.bashrc` 和 `~/.zshrc` 中都添加下面的内容：

```bash
source /etc/fcitx_env.sh
```

有些发行版本这样做并不能生效，比如EndavourOS，
您可以尝试修改 `/etc/profile` 文件。

## 其他文件配置

```bash
vim ~/.pam_environment
```

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

## 开机自启

 `vim ~/.xinitrc`

```
fcitx5 &
```

## Ref

https://fcitx-im.org/wiki/Setup_Fcitx_5/zh-cn
https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
https://bbs.deepin.org/post/270209
https://blog.p2hp.com/archives/11752
https://wszqkzqk.github.io/2024/03/09/WPS-Fcitx5/
https://blog.csdn.net/duapple/article/details/121770444
