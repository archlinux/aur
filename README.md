# dsh-desktop-git (AUR)

DeepSeek Harness 桌面客户端，从上游源码构建，按 Arch 原生布局安装。

- AUR：<https://aur.archlinux.org/packages/dsh-desktop-git>
- 上游：<https://github.com/dataelement/dsh-desktop>

## 版本

- `pkgver` 跟随上游最新正式 tag（过滤 `-beta` / `-rc` / `-test` 等预发布 tag），
  `prepare()` 检出同一 tag。
- 上游发布新 tag 后重新 `makepkg` 即可，`pkgrel` 无需变动。

## Linux 说明

上游只支持 macOS/Windows，v0.11.0 起其构建链的 Office 准备与打包校验也仅接受这两个平台。
本包使用 [ethanrise/dsh-desktop](https://github.com/ethanrise/dsh-desktop) 的 Linux 适配脚本
（MIT，Copyright © 2026 DataElement，见 [LICENSE.ethanrise](LICENSE.ethanrise)）绕过：

- 跳过 `office:prepare`，分步执行 `ppt:build`、`electron-vite build`、`electron-builder --linux dir`；
- 从 profile 移除 required 的 `dsh-desktop-office` 插件，避免缺载荷导致 Harness 启动失败。

> **不包含 Office 运行时**：DOCX/PPTX/XLSX 技能不可用，PPT 编辑仍可用。

## 构建占用

- `yay` / `paru` 默认在构建后清理 `src/`、`pkg/`，安装后约保留 0.7 GB（`.zst` 包 + VCS 源码缓存）。
- 手动 `makepkg -si` 约 3.5–4 GB；用 `makepkg -c -si` 或事后 `rm -rf src pkg` 回收。
- 国内网络可先 `export ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/` 再构建。

## 安装

```bash
yay -S dsh-desktop-git
# 或
git clone https://aur.archlinux.org/dsh-desktop-git.git
cd dsh-desktop-git && makepkg -si
```
