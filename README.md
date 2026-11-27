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
azur-promilia --check     # 检查游戏目录 / SDK 哈希 / 桥接 / PyQt6
azur-promilia --bridge    # 桥接登录模式（登录失效时用）
azur-promilia             # 日常启动（登录态有效时）
azur-promilia --restore   # 桥接异常退出后，还原游戏目录里的官方 SDK
```

游戏根目录默认 `~/Games/AzurPromilia`，可用 `AZUR_GAME_ROOT` 覆盖。

## 典型首次流程

1. `azur-promilia --bridge`
2. 登录器里点「开始游戏」，等它下载并合并资源（约 15G）
3. SDK 登录面板会出现在标题为「蓝色星原 · 官方 SDK」的原生窗口里
   —— 滑块验证若太小，按住 **Ctrl 滚轮**放大，**Ctrl+0** 复位
4. 登录成功后**退出整套流程**（关掉游戏和登录器）
5. 之后用 `azur-promilia` 正常启动即可，登录态由登录器保持

## 打进包里的东西

```
/usr/bin/azur-promilia                    启动脚本（两种模式 + 自检 + 还原）
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

## 发布到 AUR

```bash
cd azur-promilia-launcher
makepkg --printsrcinfo > .SRCINFO
git init && git add PKGBUILD .SRCINFO azur-promilia.sh \
    azur-promilia.desktop azur-promilia-login.desktop \
    azur-promilia-launcher.install
git commit -m "initial"
git remote add aur ssh://aur@aur.archlinux.org/azur-promilia-launcher.git
git push aur master
```

## 已知限制

- 登录态由登录器持有，**换了 prefix 或清理了 `Y:\AzurPromilia\AppData` 就要重新桥接登录一次**
- 桥接期间强杀进程会让官方 `union_pcsdk.dll` 留在被替换状态，用 `--restore` 修
- 内存占用较高（游戏常驻约 5G+），小内存机器建议关掉浏览器
