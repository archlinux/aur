# dsh-desktop-git (AUR)

DeepSeek Harness 的跨平台桌面客户端（从源码构建，Arch 原生打包）。

官方仓库：<https://github.com/dataelement/dsh-desktop>

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

- 依赖锁定在仓库的 `package-lock.json`（其 `resolved` 指向 npmmirror），PKGBUILD 里通过
  `npm_config_registry` + `npm_config_replace_registry_host=always` 强制换回官方
  `registry.npmjs.org`，保证全球可构建。
- `npm ci` 的 postinstall 会下载 **Electron 43 二进制**（GitHub Releases）与**捆绑的 Node.js 运行时**（nodejs.org）。
- 国内网络下载 Electron 慢/失败时，在 `makepkg` 前导出镜像：
  ```bash
  export ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/
  makepkg -si
  ```

## 运行依赖

应用自带 Electron 与 Node.js 运行时，因此运行依赖主要是 Electron 在 Arch 上所需的系统库
（GTK3、NSS、libX11 相关、ALSA、libnotify、at-spi2、libsecret 等），见 PKGBUILD 的 `depends`。

> 若应用因 sandbox 报错无法启动，说明系统禁用了非特权用户命名空间：可启用
> `kernel.unprivileged_userns_clone=1`，或临时用 `/opt/dsh-desktop/dsh-desktop --no-sandbox` 启动。

## 测试构建

```bash
makepkg -f          # 构建（会自动 git clone 源仓库）
makepkg --printsrcinfo > .SRCINFO
makepkg -i          # 构建并安装到本机
```

## 发布到 AUR（等你有账号后）

1. 注册 AUR 账号：<https://aur.archlinux.org/register/>，并在 <https://aur.archlinux.org/account/> 添加 SSH 公钥。
2. 克隆 AUR 包仓库：
   ```bash
   git clone ssh://aur@aur.archlinux.org/dsh-desktop-git.git
   ```
3. 把 `PKGBUILD`、`.SRCINFO`、`README.md`、`dsh-desktop.desktop` 复制进去。
4. 提交并推送（AUR 用 SSH 密钥认证，不需要 GPG）：
   ```bash
   git add PKGBUILD .SRCINFO README.md dsh-desktop.desktop
   git commit -m "Initial release of dsh-desktop-git"
   git push origin master
   ```
5. 更新包：改动 PKGBUILD 后重新 `makepkg --printsrcinfo > .SRCINFO` → 提交推送。
