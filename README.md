# KRunner Chrome 书签插件

> 快速安装：Arch 用户 `yay -S krunner-chrome-bookmark`（[AUR](https://aur.archlinux.org/packages/krunner-chrome-bookmark)）；或从 [KDE Store](https://store.kde.org/browse?cat=628) 下载源码后用 `./install.sh` 编译安装。

KDE Plasma 6 的原生 C++ KRunner 插件：按 `Alt+Space` 唤醒 KRunner 后，输入 `bk:关键词`（兼容中文冒号 `bk：`）即可搜索本地 Google Chrome 书签，回车后在 Chrome 新标签页打开。

## 功能

- `bk:` 前缀触发，剥离前缀后对书签**名称/网址**做大小写不敏感的模糊匹配
- 匹配优先级：名称前缀匹配 > 名称包含 > 网址包含，最多显示 20 条
- `bk:`（空关键词）时列出前 10 条书签作为提示
- 自动探测多种安装方式与多 Profile：
  - 原生：`~/.config/google-chrome/*/Bookmarks`、`~/.config/chromium/*/Bookmarks`
  - Flatpak：`~/.var/app/com.google.Chrome/config/google-chrome/*/Bookmarks` 等
- 基于文件 mtime 的解析缓存，书签变化自动重新加载，多 Profile 重复书签自动去重
- 打开方式：优先原生 `google-chrome-stable`，其次 `flatpak run com.google.Chrome`，兜底系统默认浏览器

## 依赖

Arch 系：

```bash
sudo pacman -S --needed cmake extra-cmake-modules gcc krunner ki18n kcoreaddons qt6-base
```

openSUSE：

```bash
sudo zypper install cmake extra-cmake-modules gcc-c++ kf6-krunner-devel kf6-ki18n-devel kf6-kcoreaddons-devel
```

## 编译与安装

一键脚本（推荐）：

```bash
./install.sh
```

或手动：

```bash
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
cmake --build build -j$(nproc)
sudo cmake --install build      # 安装到 /usr/lib/qt6/plugins/kf6/krunner/
kquitapp6 krunner               # 重启 KRunner（会自动重新拉起）
```

安装后到 **系统设置 → 搜索 → Plasma 搜索** 确认 "Chrome Bookmarks" 已启用（默认启用）。

## 使用

1. `Alt+Space` 唤醒 KRunner
2. 输入 `bk:github` 或 `bk：github`
3. 上下键选择结果，回车即在 Chrome 新标签页打开

## 自定义启动命令（可选）

如需强制用某个命令打开书签，编辑 `~/.config/krunnerrc`，添加：

```ini
[Runners][krunner_chrome_bookmarks]
launchCommand=flatpak run com.google.Chrome
```

然后重启 KRunner 生效。

## 卸载

```bash
sudo rm /usr/lib/qt6/plugins/kf6/krunner/krunner_chrome_bookmarks.so
kquitapp6 krunner
```
