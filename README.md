# Sogou Pinyin for Linux

Support `Wayland` and `X11`

## Wayland环境变量的设置

编辑或创建`~/.fcitx_env.sh`文件，添加下列内容：

```bash
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
```

最好在`~/.bashrc`和`~/.zshrc`中都添加下面的内容：

```bash
source ~/.fcitx_env.sh
```

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

https://wszqkzqk.github.io/2024/03/09/WPS-Fcitx5/
