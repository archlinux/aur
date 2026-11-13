# dsh-tauri-desktop-appimage

[DeepSeek Harness Desktop](https://github.com/dsh-tauri/deepseek-harness-desktop) 的
AppImage 重打包版。

## 与 dsh-tauri-desktop-bin 的区别

| | dsh-tauri-desktop-bin | 本包 |
| --- | --- | --- |
| 上游产物 | `*_amd64.deb` | `*_amd64.AppImage` |
| 安装位置 | `/usr/lib`、`/usr/share` 等 | `/opt/dsh-tauri-desktop-appimage`（整体 AppDir） |
| 内置 GTK 等库 | 由上游 deb 决定 | 留在 `/opt` 内，不写入 `/usr/lib` |

两者 `provides`/`conflicts` 同名，只能装一个；安装本包会替换 `dsh-tauri-desktop-bin`。

## 安装

```sh
yay -S dsh-tauri-desktop-appimage   # 或 paru
```

`makepkg -si` 时同样会因 `conflicts` 提示先卸载 `dsh-tauri-desktop-bin`。

## 关于 Linux 下粘贴图片导致内核崩溃

0.31.1/0.31.2 时期，粘贴图片会让 Harness 进程 `SIGSEGV`（sharp 自带 libvips 与
Electron 链接的系统 glib 符号冲突，上游 issue #1490）。0.31.3 起不再崩溃，0.31.4 起
在缺少 wasm 回退时会明确禁用图片功能；图片是否可用取决于随包 dsh 内核的版本
（需要 `@img/sharp-wasm32`）。本包只改变分发格式，不改变内核行为；遇到
`[asar-native] refusing sharp ...` 属于内核侧问题，可在
设置 → Harness Core 里改用目录形式的 core，或升级 dsh 内核。

## 许可

上游为 MIT + 附加条款，见 `/usr/share/licenses/dsh-tauri-desktop-appimage/`。
