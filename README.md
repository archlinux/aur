# dsh-desktop-git (AUR)

DeepSeek Harness 的跨平台桌面客户端：本地 Agent 运行时、多模型服务商、手机配对远程控制、可编辑 PPTX 生成（从源码构建，Arch 原生打包）。

AUR 页面：<https://aur.archlinux.org/packages/dsh-desktop-git>
官方仓库：<https://github.com/dataelement/dsh-desktop>

## 版本策略

- **版本号跟随上游最新 release tag**：取上游 `v` 前缀的 tag（如 `v0.9.0` → `0.9.0`），
  天然排除 `0.9.0-test` 这类 test 版本以及 `rc` / `desktop-preview` 等非正式 tag。
- **构建使用同一个 tag**：`prepare()` 检出该 tag 再构建，保证打出的包与版本号严格对应同一份源码。
- 上游发布新 tag（如 `v0.9.1`）后，重新 `makepkg` 即可得到新版本号，`pkgrel` 无需变动。

## 为什么从源码构建 / 不用 .deb

DSH Desktop 官方没有发布 Linux 二进制（官方 README 说明 Linux 包一直是从源码本地构建）。
本包直接克隆官方源仓库，用官方自带流程构建出 Electron 应用本体，再以 **Arch 原生布局**安装：

```
npm ci → npm run package:dir（electron-vite build + electron-builder --dir）
       → 安装 dist/linux-unpacked 到 /opt/dsh-desktop
```

安装结果：
- 应用本体：`/opt/dsh-desktop`
- 启动入口：`/usr/bin/dsh-desktop`（软链）
- 桌面项：`/usr/share/applications/dsh-desktop.desktop`
- 图标：`/usr/share/icons/hicolor/{16..512}x{16..512}/apps/dsh-desktop.png`

## 构建说明

- 依赖锁定在仓库的 `package-lock.json`（其 `resolved` 指向 npmmirror 公开镜像，全球可访问），
  `npm ci` 直接按 lockfile 安装即可。**不要**用 `replace-registry-host=always` 强改 registry，
  否则 `file:` 本地依赖的路径会被误改写成 registry URL 导致 404。
- `npm ci` 的 postinstall 会下载 **Electron 43 二进制**（GitHub Releases）与**捆绑的 Node.js 运行时**（nodejs.org）。
- **下载加速（自动）**：`build()` 会先探测 `https://github.com`，10 秒内不可达（国内常见）
  就自动把 Electron 下载切换到 npmmirror 国内加速镜像，无需手动干预；官方源可达则保持默认。
  如需手动覆盖：
  ```bash
  ELECTRON_MIRROR='https://github.com/electron/electron/releases/download/' makepkg -si
  ```
- **git clone 上游源码加速（国内用户可选）**：源仓库走 `git+https://github.com`，
  PKGBUILD 无法在 clone 前自动探测。国内用户若 clone 慢，可一次性给 git 加全局加速：
  ```bash
  git config --global url."https://gh-proxy.com/https://github.com/".insteadOf "https://github.com/"
  # 撤销：
  git config --global --unset-all url.https://gh-proxy.com/https://github.com/.insteadOf
  ```
- 上游未在仓库提交 Linux 图标（只有 macOS 生成脚本），PKGBUILD 用 `imagemagick` 从
  `build/app-icon.png` 生成 hicolor 各尺寸图标。

## 运行依赖

应用自带 Electron 与 Node.js 运行时，因此运行依赖主要是 Electron 在 Arch 上所需的系统库
（GTK3、NSS、libX11 相关、ALSA、libnotify、at-spi2、libsecret 等），见 PKGBUILD 的 `depends`。

> 若应用因 sandbox 报错无法启动，说明系统禁用了非特权用户命名空间：可启用
> `kernel.unprivileged_userns_clone=1`，或临时用 `/opt/dsh-desktop/dsh-desktop --no-sandbox` 启动。

## 安装

```bash
# 用 AUR 助手（yay/paru）：
yay -S dsh-desktop-git
# 或手动：
git clone https://aur.archlinux.org/dsh-desktop-git.git
cd dsh-desktop-git && makepkg -si
```

## 维护

上游发布新的 `v` 前缀 release tag 后（如 `v0.9.1`），重新构建即可得到新版本号：

```bash
makepkg -f -d                      # 构建（pkgver 自动跟随最新 tag）
makepkg --printsrcinfo > .SRCINFO  # 同步 .SRCINFO
git add PKGBUILD .SRCINFO README.md dsh-desktop.desktop
git commit -m "Update to <新版本>"
git push origin master
```
