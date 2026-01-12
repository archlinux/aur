# plasma-wechat-toggle

Toggle WeChat window on KDE Plasma Wayland.

在 KDE Plasma Wayland 环境下切换微信窗口。

## Features / 功能

- No WeChat window → Click tray icon to open
- Window minimized or hidden → Activate and show
- Window in foreground → Close window

---

- 无微信窗口 → 点击托盘图标打开
- 窗口最小化或被遮挡 → 激活并显示
- 窗口在前台 → 关闭窗口

## Requirements / 环境要求

- KDE Plasma 6 + Wayland
- WeChat running in system tray / 微信需在托盘运行
- `qt6-tools` (provides `qdbus6`)

## Installation / 安装

### Arch Linux (AUR)

```bash
yay -S plasma-wechat-toggle
```

### Manual / 手动安装

```bash
git clone https://github.com/flobit/plasma-wechat-toggle.git
cd plasma-wechat-toggle
makepkg -si
```

## Usage / 使用

```bash
plasma-wechat-toggle
```

### Keyboard Shortcut / 绑定快捷键

1. Open System Settings → Keyboard → Shortcuts
2. Click "Add Application..." at the bottom
3. Command: `/usr/bin/plasma-wechat-toggle`
4. Click "Add custom shortcut" and press your preferred key combo (e.g. `Meta+W`)

---

1. 打开 系统设置 → 键盘 → 快捷键
2. 点击底部 "添加应用程序..."
3. 命令填写: `/usr/bin/plasma-wechat-toggle`
4. 点击 "添加自定义快捷键" 并按下组合键 (如 `Ctrl+Alt+W`)

## License / 许可证

MIT
