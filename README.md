# tuack-gui-git（AUR 打包）

Tuack-GUI 的 Arch Linux [AUR](https://aur.archlinux.org) VCS 包（`-git`，跟随 `main` 分支最新提交）。

## 目录

- `PKGBUILD` — 打包脚本
- `tuack-gui.desktop` — 桌面入口
- `.SRCINFO` — 由 `makepkg --printsrcinfo` 生成，改动 PKGBUILD 后需重新生成

## 本地构建

```sh
makepkg -si
```

依赖关系：

- `depends`：`gtk3`、`webkit2gtk-4.1`、`libayatana-appindicator`、`typst`（extra）、`tuack-ng`（AUR，由 tuack-ng-git / tuack-ng-bin 提供）
- `makedepends`：`cargo`、`nodejs`、`pnpm`、`git`

安装布局：

- `/usr/lib/tuack-gui/tuack-gui` — 主程序（前端资源已内嵌）
- `/usr/lib/tuack-gui/assets` — 软链到 `/usr/share/tuack-ng`（模板等运行时资源，应用首次启动复制到自己的数据目录）
- `/usr/lib/tuack-gui/{tuack-ng,typst}` — sidecar 软链到 `/usr/bin`
- `/usr/share/applications/tuack-gui.desktop`、`/usr/share/pixmaps/tuack-gui.png`

## 维护

1. 上游大版本发布后：更新 `pkgver` 种子值（`git describe --long --tags --abbrev=7` 在 tuack-gui 仓库 `main` 分支的输出，去掉 `v`、`-` 换成 `.`）
2. 改动 `PKGBUILD` 后：`makepkg --printsrcinfo > .SRCINFO`
3. 本地改动 `tuack-gui.desktop` 后：`updpkgsums` 更新 sha256
4. 提交到 AUR：`git push`（本目录即为 AUR 仓库工作树）
