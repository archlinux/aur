# azur-promilia-launcher

《蓝色星原：旅谣》在 Arch Linux 上的启动方案，把已验证可用的流程打包成安装包。

## 这套流程解决了什么

官方客户端走 Wine/Proton 时有两处硬伤：

1. **SDK 登录面板的二级弹窗**（验证码、新设备验证）在 Wine 下创建后不映射，点击无响应
2. **游戏内更新对话框**点不到（4K 下坐标错位）

对应的解法：

| 问题 | 解法 |
|---|---|
| 登录面板不可用 | 用 [azur-sdk-qt](https://github.com/puji4810/azur-sdk-qt) 桥接：官方 SDK 仍由 Proton 运行，画面通过共享内存送到 **Linux 原生 PyQt6 窗口**，输入再转发回 SDK |
| 游戏内更新点不到 | **更新由官方登录器完成**（登录器界面是 Electron，输入正常）。登录器负责下载 + 合并资源 |
| 登录态丢失 | 登录成功后**登录态由登录器持有**，此后从登录器点「开始游戏」会跳过游戏内 SDK 登录 |

## 使用

```bash
azur-promilia --install [包]  # 首次：装官方启动器（不带路径时自动在下载目录里找）
azur-promilia                 # 启动：进入官方启动器，下载/更新本体
azur-promilia --status        # 状态自检：目录、启动器、本体、SDK 哈希、桥接
azur-promilia --bridge        # 桥接登录模式（登录失效时用）
azur-promilia --restore       # 桥接异常退出后，还原游戏目录里的官方 SDK
azur-promilia --fix-x         # 启动「秒退」时清理 Xwayland 泄漏的 X11 连接
```

游戏根目录默认 `~/Games/AzurPromilia`，可用 `AZUR_GAME_ROOT` 覆盖。

目录布局是固定的，`--install` / `--status` 都按它检查：

```
~/Games/AzurPromilia/
├── drive/                          → Wine 里的 Y: 盘
│   └── AzurPromilia/
│       ├── 1.0.2.2/launcher.exe   官方启动器（版本子目录，会随更新变化）
│       └── AzurPromilia_Game/     游戏本体
└── prefix/                         Proton 前缀（含 y: 映射）
```

`--install` 会自动建目录、写 `Y:` 映射，并在安装结束后重新查找 `launcher.exe`；
安装器里请把安装位置改成 `Y:\AzurPromilia`，装到别处脚本就找不到。

## 典型首次流程

1. `azur-promilia --install`（或 `--install <安装包路径>`），安装位置填 `Y:\AzurPromilia`
2. `azur-promilia`，在启动器里把游戏安装位置设为 `Y:\AzurPromilia`，等它下载并合并资源
3. `azur-promilia --status`，确认本体、官方 SDK、桥接都「就绪」
4. 需要登录时用 `azur-promilia --bridge`；登录器里点「开始游戏」进入游戏
5. SDK 登录面板会出现在标题为「蓝色星原 · 官方 SDK」的原生窗口里
   —— 滑块验证若太小，按住 **Ctrl 滚轮**放大，**Ctrl+0** 复位
6. 登录成功后**退出整套流程**（关掉游戏和登录器）
7. 之后用 `azur-promilia` 正常启动即可，登录态由登录器保持

## 打进包里的东西

```
/usr/bin/azur-promilia                    启动脚本（安装引导 + 两种模式 + 状态自检 + 还原）
/usr/share/azur-promilia/run.py           桥接包装器（上游）
/usr/share/azur-promilia/login_window.py  原生 Qt 窗口（上游）
/usr/share/azur-promilia/build/selected/  两个 PE 文件（本包用 mingw-w64 现场编译）
    azur-sdk-host.exe                     桥接宿主
    union_pcsdk.dll                       官方 SDK 的代理（退出时自动还原）
/usr/share/applications/azur-promilia*.desktop
```

## 依赖

- `dwproton-bin` + `dwproton-azur-patch`：Proton 兼容层与窗口管理补丁
- `python` + `python-pyqt6`：原生登录窗口
- 构建期需要 `mingw-w64-gcc`
- 可选：`libnotify`（桌面通知）、`xdg-utils`（`--install` 打开官网）、`lsof`（X11 预检）

## 维护与发布

```bash
makepkg --printsrcinfo > .SRCINFO       # 改了 PKGBUILD 后必须重新生成
makepkg -f                              # 本地构建验证
git add -A && git commit -m "1.0.0-8: …"
git push aur master                     # remote: ssh://aur@aur.archlinux.org/azur-promilia-launcher.git
```

## 已知限制

- 登录态由登录器持有，**换了 prefix 或清理了 `Y:\AzurPromilia\AppData` 就要重新桥接登录一次**
- 桥接期间强杀进程会让官方 `union_pcsdk.dll` 留在被替换状态，用 `--restore` 修
- 内存占用较高（游戏常驻约 5G+），小内存机器建议关掉浏览器

## 故障排查：点桌面图标没反应

桌面项的 `Terminal=false`，脚本的报错不会出现在终端里，所以看起来像没反应。
先跑状态自检：

```bash
azur-promilia --status
```

常见情况：

| 状态 | 处理 |
|---|---|
| 官方启动器「未安装」 | `azur-promilia --install`，安装位置填 `Y:\AzurPromilia` |
| 启动器已装、本体「未安装」 | `azur-promilia`，在启动器里选 `Y:\AzurPromilia` 下载本体 |
| X11 连接数告警 | `azur-promilia --fix-x` |

脚本启动失败时会发桌面通知（优先 `notify-send`，没有则用 `kdialog` / `zenity`），
不再静默退出。

## 故障排查：启动器「秒退」

日志里刷 `Maximum number of clients reached` 时，是 **X11 客户端槽位耗尽**（Xwayland 默认 256 个连接）。
常见成因是用 `kill -9` 强杀 Wine/CEF 进程，留下对端已死但未回收的连接。

```bash
azur-promilia --fix-x     # 重启 Xwayland，清空连接（会断开本会话所有 X11 客户端）
```

启动脚本在连接数超过阈值（默认 240）时会提前打印警告，而不是让游戏莫名其妙「秒退」。
阈值可用 `AZUR_X11_MAX_CLIENTS` 调整；设 `AZUR_X11_PREFLIGHT=strict` 可直接拒绝启动。

> 为什么启动器不自动重启 Xwayland：重启会**连带杀掉会话里所有 X11 客户端**
> （其它 Wine 程序、X11 应用），副作用不该由一个游戏启动器替用户决定。

## 可选：反虚化补丁（仅国服）

移除角色在大世界中的虚化效果。补丁来自
[azurpromilia-switcher](https://github.com/username-1234567/azurpromilia-switcher)（MIT），
替换 `.res/default_package/BundleFiles/rjmh704fkrsjimysndpsg.r`，只改相机预制体的 51 个组件，
文件大小不变、CRC 已配平。

> ⚠️ **风险**：替换客户端资源包属于修改客户端文件，违反游戏用户协议，**可能导致封号**。
> 这是可选功能，默认不启用，是否使用由你自行决定。

### 打包方式

补丁资源**随包分发**（构建时从上游仓库拉取），但**默认不应用**——
不执行下面的命令，游戏资源和原版完全一致。

### 使用

```bash
azur-promilia --nofade status            # 当前是原始/已应用/版本不匹配
azur-promilia --nofade install --accept-risk
azur-promilia --nofade restore           # 从备份还原
```

安装前会校验当前资源的 md5 与补丁期望值是否一致——**游戏更新后补丁会自动拒绝安装**，
不会把不匹配的资源硬塞进去。原文件备份在 `AzurPromilia_Game/.nofade-backup/`。
