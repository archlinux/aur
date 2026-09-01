# lunacy-thumbnailer

为 Nautilus（GNOME Files）生成 Lunacy `.free` 文档缩略图。程序从文档归档根目录提取 `preview.webp`，缩放后输出 PNG。

## 依赖

- `libarchive`（提供 `bsdtar`）
- `imagemagick`
- Lunacy 安装的 `x-scheme-handler/i8-lunacy` MIME 类型

## 安装

```bash
makepkg -si
nautilus -q
```

若文件曾生成过失败缓存，请在重启 Nautilus 前删除 `~/.cache/thumbnails/fail/` 中对应缓存。

## 手动测试

```bash
lunacy-thumbnailer document.free thumbnail.png 256
```

## 工作原理

GNOME 使用 `bwrap` 隔离第三方缩略图程序，不能直接访问用户目录。GNOME 会把待处理文件只读绑定到沙盒内的 `/tmp/gnome-desktop-file-to-thumbnail.free`，并将这个路径展开到 `%i`；本程序只读取 `%i`，自身及全部运行时依赖均安装在沙盒可见的 `/usr` 下。

## AUR 发布

首次发布前生成并提交 `.SRCINFO`：

```bash
makepkg --printsrcinfo > .SRCINFO
```

## 卸载

```bash
sudo pacman -Rns lunacy-thumbnailer
nautilus -q
```
