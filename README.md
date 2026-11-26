# dwproton-azur-patch

给 **dwproton** 打的临时兼容补丁，让《蓝色星原：旅谣》(Azur Promilia) 的游戏内
SDK 窗口（`mj_sdk` 的 Qt 登录框 / 协议框 / CEF 面板）在 Wine 下能显示、能接受输入。

装着用，卸了干净：**安装后自动生效，卸载时自动还原，dwproton-bin 升级后自动重新应用。**

## 这包里有什么

| 文件 | 作用 |
| --- | --- |
| `/usr/share/dwproton-azur-patch/win32u.so` | 打补丁的 wine 驱动：`NtUserSetParent` 把「设父窗口」转成「设 owner」 |
| `/usr/share/dwproton-azur-patch/winex11.so` | 打补丁的 X11 驱动：让这类分层工具弹窗保持 unmanaged，不被 WM 压回 640×480 |
| `/usr/lib/dwproton-azur-patch/apply` | 内部工具：备份并覆盖 dwproton 的同名驱动 |
| `/usr/lib/dwproton-azur-patch/revert` | 内部工具：从备份还原 |
| `/usr/share/libalpm/hooks/90-dwproton-azur-patch.hook` | dwproton-bin 装/升级后自动重新应用 |

两个 `.so` 来自 [suluoMISS/dwproton-11.0-17-azur](https://github.com/suluoMISS/dwproton-11.0-17-azur)
以 dwproton 11.0-17（Wine 11.0）为基线重新构建的产物。

## 为什么是「补丁包」而不是重打包 dwproton

dwproton 本身由 `dwproton-bin` 提供，`/usr/share/steam/compatibilitytools.d/dwproton/`
下的文件归它所有。任何别的包直接往里装同名文件，pacman 都会拒绝
（`exists in filesystem (owned by dwproton-bin)`）。

所以这里把补丁二进制装在自己的目录，由 `.install` 脚本在安装/卸载时覆盖和还原，
并用 alpm hook 在 dwproton-bin 升级后自动重打——既能跟着 dwproton-bin 升级，
又不需要重打包整个 Proton（那要几百 MB 和一个小时）。

## 安装

```bash
git clone https://aur.archlinux.org/dwproton-azur-patch.git
cd dwproton-azur-patch
makepkg -si
```

用 AUR helper 也一样：`yay -S dwproton-azur-patch`。

装完直接开游戏，不需要跑任何命令。启动：

```bash
dwproton waitforexitandrun ./AzurPromilia.exe -start=azurpromilia_launcher
```

（`-start=azurpromilia_launcher` 不能省，否则游戏会弹「请使用启动器启动」）

## 卸载

```bash
sudo pacman -R dwproton-azur-patch
```

卸载会自动把两个驱动还原成原版，备份目录 `/var/lib/dwproton-azur-patch/` 一并清掉。

## 版本不匹配时

驱动和 Wine 内部结构强耦合，所以 `apply` 会核对 `dwproton/version`
里是否有 `dwproton-11.0-17`：

- 匹配 → 覆盖
- 不匹配 → **不覆盖**，只打印提示。此时 dwproton-bin 大概是升级了，
  需要等本包跟进新版（改 `EXPECT` 和来源 commit 重新构建）。
- 你确信无碍 → 设 `DWPROTON_AZUR_FORCE=1` 重装本包强制覆盖。

失败时 dwproton 保持原版驱动，不会被弄坏。

## 已知边界

- 只对 `dwproton-bin` 里 `files/lib/wine/x86_64-unix/` 的两个驱动动手，
  不碰 `x86_64-windows/`、不碰游戏文件、不碰 prefix。
- 覆盖的文件不受 pacman 追踪（它们属于 dwproton-bin）。`pacman -Qkk dwproton-bin`
  在校验时会看到这两个文件「被改过」——那是本包所为，删除本包即恢复。
- 这是**临时过渡**用法。dwproton 上游或 Wine 收录等价修复后，请卸掉本包。

## 许可

两个 `.so` 是 Wine 的衍生物，按 **LGPL-2.1-or-later** 分发，完整文本随包安装到
`/usr/share/licenses/dwproton-azur-patch/LICENSE`。本仓库的包装脚本同样以
LGPL-2.1-or-later 发布。本项目与 Wine / Proton / dwproton 官方无关，也未获其背书。
