# sing-box-cagedbird AUR 维护指南

最后更新：2026-05-12

## 目标

我们现在除了维护 `cagedbird043/sing-box` 这个 upstream-tracking fork，还要长期维护一个 AUR 包：

- AUR 包名：`sing-box-cagedbird-bin`
- AUR 页面：<https://aur.archlinux.org/packages/sing-box-cagedbird-bin>
- AUR Git：<https://aur.archlinux.org/sing-box-cagedbird-bin.git>
- 本地维护仓库：`/home/cagedbird/Projects/AUR/sing-box-cagedbird-bin`
- 源码/Release 仓库：<https://github.com/cagedbird043/sing-box>

这个 AUR 包的定位是：安装我们 fork 的预编译 sing-box 二进制，让 Arch 用户可以直接用 pacman/AUR 方式消费我们的版本。

## 包语义

`sing-box-cagedbird-bin` 是官方 sing-box 的替换包，但二进制来自我们的 GitHub Release。

它安装：

```text
/usr/bin/sing-box
/etc/sing-box/config.json
/usr/lib/systemd/system/sing-box.service
/usr/lib/systemd/system/sing-box@.service
/usr/lib/sysusers.d/sing-box.conf
/usr/share/polkit-1/rules.d/sing-box.rules
/usr/share/dbus-1/system.d/sing-box-split-dns.conf
/usr/share/bash-completion/completions/sing-box
/usr/share/fish/vendor_completions.d/sing-box.fish
/usr/share/zsh/site-functions/_sing-box
```

PKGBUILD 里应保持：

```bash
provides=('sing-box')
conflicts=('sing-box' 'sing-box-bin' 'sing-box-alpha' 'sing-box-beta' 'sing-box-beta-bin' 'sing-box-git')
```

这样它会替代系统里的普通 `sing-box` 包。

## 当前已验证状态

当前系统已经换成 AUR 包：

```bash
pacman -Q sing-box-cagedbird-bin
# sing-box-cagedbird-bin 1.14.0_alpha.21_cagedbird.228304d3-1

pacman -Qo /usr/bin/sing-box
# /usr/bin/sing-box is owned by sing-box-cagedbird-bin ...

sing-box version
# sing-box version 1.14.0-alpha.21-cagedbird.228304d3
```

当前 AUR 维护仓库状态：

```bash
cd /home/cagedbird/Projects/AUR/sing-box-cagedbird-bin
git remote -v
# origin ssh://aur@aur.archlinux.org/sing-box-cagedbird-bin.git
```

当前 AUR 首个提交：

```text
f4514d5 Package the cagedbird sing-box release for AUR
```

## 安装方式

普通用户用：

```bash
paru -S sing-box-cagedbird-bin
```

或：

```bash
yay -S sing-box-cagedbird-bin
```

手工测试可用：

```bash
git clone https://aur.archlinux.org/sing-box-cagedbird-bin.git
cd sing-box-cagedbird-bin
makepkg -si
```

## 维护原则

核心原则：

```text
GitHub Release 是二进制真源。
AUR 只是薄包装层。
```

不要再维护独立 pacman repo，也不要把 Arch 包发布链拆到另一个 CI 仓库里。我们现在只需要：

1. 在 `cagedbird043/sing-box` 发 GitHub Release；
2. Release 里包含 Linux tarball；
3. AUR PKGBUILD 指向这个 Release；
4. 更新校验和和 `.SRCINFO`；
5. 推送 AUR Git。

这条链路最短，也最符合 AUR 的工作方式。

## 发布新版 AUR 的步骤

假设新的 GitHub Release tag 是：

```text
v1.14.0-alpha.22-cagedbird.xxxxxxxx
```

进入 AUR 仓库：

```bash
cd /home/cagedbird/Projects/AUR/sing-box-cagedbird-bin
```

修改 `PKGBUILD`：

```bash
_pkgver=1.14.0-alpha.22-cagedbird.xxxxxxxx
pkgrel=1
```

注意：`_pkgver` 不带开头的 `v`。PKGBUILD 内部会生成：

```bash
_release_tag="v${_pkgver}"
pkgver=${_pkgver//-/_}
```

所以 AUR 版本会把 `-` 变成 `_`，例如：

```text
1.14.0_alpha.22_cagedbird.xxxxxxxx-1
```

更新 checksum 和 `.SRCINFO`：

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

验证下载源：

```bash
makepkg --verifysource
```

本地完整打包测试：

```bash
makepkg -f --cleanbuild --noconfirm
```

检查包内二进制版本：

```bash
pkgfile=$(ls -1t sing-box-cagedbird-bin-[0-9]*.pkg.tar.* | grep -v -- '-debug-' | head -1)
tmp=$(mktemp -d)
bsdtar -xf "$pkgfile" -C "$tmp" usr/bin/sing-box
"$tmp/usr/bin/sing-box" version
rm -rf "$tmp"
```

确认版本是新的 cagedbird release 后提交：

```bash
git add PKGBUILD .SRCINFO
git commit -m "Package the next cagedbird sing-box release"
```

推送到 AUR：

```bash
git push origin master
```

推送后确认：

```bash
python - <<'PY'
import json, urllib.request
name='sing-box-cagedbird-bin'
data=json.load(urllib.request.urlopen(f'https://aur.archlinux.org/rpc/?v=5&type=info&arg[]={name}',timeout=15))
for r in data.get('results',[]):
    print(r.get('Name'), r.get('Version'), r.get('Maintainer'), r.get('URL'))
PY
```

## arch 选择

当前 AUR 包支持：

```bash
arch=('x86_64' 'aarch64')
```

对应 Release assets：

```text
sing-box-cagedbird-linux-amd64.tar.gz
sing-box-cagedbird-linux-arm64.tar.gz
```

普通 `x86_64` 包使用普通 amd64 版本，不使用 `amd64-v4`。原因是 AUR 的 `x86_64` 用户不一定有 x86_64-v4 CPU。

如果以后真的想发布 v4 优化包，应该单独建包，例如：

```text
sing-box-cagedbird-v4-bin
```

不要把 v4 二进制塞进普通 `sing-box-cagedbird-bin`。

## 常见检查命令

查看本机是否正在用 AUR 包：

```bash
pacman -Q sing-box-cagedbird-bin sing-box
pacman -Qo /usr/bin/sing-box
sing-box version
```

查看 AUR 登录是否正常：

```bash
ssh aur@aur.archlinux.org help
ssh aur@aur.archlinux.org list-repos
```

查看 AUR 远端：

```bash
cd /home/cagedbird/Projects/AUR/sing-box-cagedbird-bin
git remote -v
git ls-remote origin
```

公开 clone 验证：

```bash
tmp=$(mktemp -d)
git clone --depth=1 https://aur.archlinux.org/sing-box-cagedbird-bin.git "$tmp/pkg"
cd "$tmp/pkg"
makepkg --verifysource
rm -rf "$tmp"
```

## 注意事项

1. 不要把下载下来的 tarball、`src/`、`pkg/`、生成的 `.pkg.tar.zst` 提交进 AUR Git。
2. 每次改 `PKGBUILD` 后必须重新生成 `.SRCINFO`。
3. 每次发新版 release 后，AUR 的 `_pkgver`、checksum、`.SRCINFO` 必须一起更新。
4. `pkgrel` 只在同一个 upstream/release 版本下修改打包逻辑时递增；换新 `_pkgver` 时通常重置为 `1`。
5. 如果 GitHub Release asset 名字变了，必须同步改 `source_x86_64` / `source_aarch64`。
6. 如果 sing-box 上游 systemd/sysusers/polkit/dbus配置变了，AUR 包会通过 tag 对应的 raw URL 拉取我们 release tag 里的配置，通常不用单独手抄。
7. 这个 AUR 包不应承担构建 sing-box 的职责；构建应该留在 `cagedbird043/sing-box` 的 GitHub Actions 里。

## 当前包解决的问题

我们的 fork 比官方上游多 native Clash subscription 能力，并且 Android/SFA 也跟随同一 fork 构建。AUR 包让 Arch 侧安装路径也变成标准包管理方式：

```text
官方上游 testing -> cagedbird feature-base/release -> GitHub Release -> AUR sing-box-cagedbird-bin -> pacman 安装
```

这样以后 Arch 机器不需要手工复制二进制，也不需要维护额外 pacman repo。

## Start here

- **任务 = 发布新版 AUR 包**: 先读 [README.md](README.md)，执行时查阅 [README.md中的 #发布新版-aur-的步骤 章节](#发布新版-aur-的步骤)，包信息与底层配置详见 `PKGBUILD` 与 `.SRCINFO`。

## Agent-native Skills

### Skills

- **aur-release**:
  - *Trigger*: When updating or releasing the `sing-box-cagedbird-bin` package on the Arch User Repository (AUR).
  - *Entry*: 请直接执行本 [README.md中的 #发布新版-aur-的步骤 章节](#发布新版-aur-的步骤) 进行更新发布。

### Do not read everything

When working on this repository, do NOT scan all files blindly. Always start with this `README.md` to identify the correct workflow, then proceed directly to the designated section in README.md.
