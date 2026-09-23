# crisperweaver-bin (AUR)

CrisperWeaver 的 AUR 打包目录（预编译二进制版，不做源码编译）。

- 目录：`~/apps/aur/crisperweaver-bin`（已 `git clone ssh://aur@aur.archlinux.org/crisperweaver-bin.git`，仓库还空着，等首次 push）
- 上游：https://github.com/CrispStrobe/CrisperWeaver （AGPL-3.0-only）
- 现状：AUR 上没有 CrisperWeaver 相关包，只有同作者的引擎 `crispasr`（maintainer: deons，已 out-of-date）
- 本包打的是 GitHub Release 的 `crisper_weaver-linux-x64.tar.gz`（仅 x86_64）

## 提交前必改

```bash
# PKGBUILD 第一行的维护者信息
# Maintainer: Hansel <REPLACE_WITH_YOUR_EMAIL>
```

## pkgver()

不是 `-git` 包，但实现了 `pkgver()`，专门配合 `~/apps/scripts/aur-batch-update.sh` /
`aur-up-version.sh` 自动更新：脚本在包目录里 `source PKGBUILD` 后调用 `pkgver()`，
本函数实时请求 GitHub API 的 `/releases/latest`（自动排除 prerelease / draft），
输出 `0.11.1` 这样的一行版本号（去掉 `v` 前缀）。

约定（脚本的硬性要求）：

- 只能往 **stdout 输出一行版本号**，不能有空格、斜杠、换行；
- 诊断信息一律走 stderr，失败必须 `return 1`（脚本会打印 ❌ 更新失败，
  这里不做离线兜底，避免"API 挂了 → 静默以为已是最新版"这种假阴性）；
- `curl` 因此进了 `makedepends`（makepkg 执行 `pkgver()` 时要用），
  另外 makepkg 每次构建都会调用 `pkgver()`，所以构建需要联网（本来下载 source 也要联网）。

单独测试：

```bash
bash -c 'source ./PKGBUILD >/dev/null; pkgver'          # -> 0.11.1
bash ~/apps/scripts/aur-up-version.sh                   # 无新版本时打印"已是最新版本"并 exit 0
```

## 上游发版后的更新

推荐直接跑脚本（会自动改 `pkgver`、重置 `pkgrel=1`、`updpkgsums` 重算 4 个 source
的校验和、重新生成 `.SRCINFO`）：

```bash
cd ~/apps/aur/crisperweaver-bin && bash ~/apps/scripts/aur-up-version.sh
# 或批量：bash ~/apps/scripts/aur-batch-update.sh
git diff                     # 检查
makepkg -si                  # 真装一遍
crisperweaver                # 启动冒烟
namcap crisperweaver-bin-*.pkg.tar.zst
git add PKGBUILD .SRCINFO README.md .gitignore && git commit -m "upgpkg: crisperweaver-bin X.Y.Z-1" && git push
```

手动步骤（脚本不可用时）：

1. 改 `pkgver`（上游 tag 是 `v0.11.1`，去掉 `v`）；
2. 对照官方校验和，再 `updpkgsums`：
   ```bash
   curl -sL https://github.com/CrispStrobe/CrisperWeaver/releases/download/v$pkgver/crisper_weaver-linux-x64.tar.gz.sha256
   ```
3. 检查 bundle 布局有没有变（`patchelf` 名单写死在 `package()` 里，变了会直接报错退出）：
   ```bash
   tar tzf crisper_weaver-linux-x64.tar.gz | grep '^crisper_weaver/lib/'
   ```
4. `makepkg --printsrcinfo > .SRCINFO`（脚本已自动做）。

只改打包不改版本时把 `pkgrel` +1。

## 本地构建 / 验证

```bash
makepkg -si          # 依赖：gtk3 libkeybinder3（运行时）、imagemagick patchelf curl（打包/取版本）
namcap crisperweaver-bin-*.pkg.tar.zst
crisperweaver        # 与 crisper_weaver 都是 /usr/bin 下的软链
```

已验证（0.11.1-2）：

- `makepkg -f` 构建通过；`namcap` **0 条 error 级**告警（剩 `libjvm.so` "未安装依赖"——
  Android-only 代码路径，Linux 上不会加载；`gcc-libs`/`libkeybinder3` "may not be needed"——
  本机没装 libkeybinder3 造成的假阳性）。
- 从 `$pkgdir` 解包 + 走 `/usr/bin/crisperweaver` 软链启动冒烟：进程存活到 timeout，
  日志显示 CrispASR 引擎初始化成功、识别出 102 个 backend。
- `pkgver()` 成功/失败两条路径都测过（失败时空 stdout + stderr 提示 + rc=1）。
- `package()` 里的 RUNPATH 自动扫描：本次命中 6 个文件（5 个插件 + `libdartjni.so`），
  `libapp.so`/`libglint.so`（本来没有 RUNPATH）和已经等于 `$ORIGIN` 的
  `libwhisper.so`/`libflutter_linux_gtk.so` 都没被动过。
- 依赖映射用 `readelf -d` + `namcap` 双向核对过，见下面“依赖是怎么定的”。
- 数据目录重定向：用沙箱 HOME 跑了 4 组对照实验（`$HOME/Documents` 真的不再被创建）：
  1. 原始行为 ＝ `~/Documents/{batch,diagnostics,history,logs,models}`；
  2. `XDG_DOCUMENTS_DIR` 环境变量 → **无效**（证明只能从外部命令入手）；
  3. `PATH` 里没有 `xdg-user-dir` → 启动成功但报 `MissingPlatformDirectoryException`（所以 `xdg-user-dirs` 进了 depends）；
  4. 上新 wrapper → 散落目录消失，数据全进 `~/Documents/crisperweaver/`；
     `CRISPERWEAVER_DOCS_DIR` 覆盖和“恢复旧行为”两个分支也分别验过。

## 首次上传

```bash
cd ~/apps/aur/crisperweaver-bin
git add PKGBUILD .SRCINFO README.md .gitignore
git commit -m "Initial import: crisperweaver-bin 0.11.1"
git push        # 需要 AUR 账号里已添加 SSH 公钥
```

## 依赖是怎么定的（打包思路）

预编译包的依赖只有两个去处，记住这句就不会乱：

1. **包里没带的库** → 写进 `depends`；
2. **包里自带的库** → 直接用包里的（`/usr/lib/crisperweaver/lib/`），不写依赖。

怎么知道哪些“没带”？

```bash
# 1. 看每个 ELF 需要什么（NEEDED）
readelf -d usr/lib/crisperweaver/crisper_weaver usr/lib/crisperweaver/lib/*.so | grep NEEDED
# 2. 让 namcap 告诉你哪个没被满足（"uninstalled dependency"）
namcap crisperweaver-bin-*.pkg.tar.zst
# 3. 反查某个 .so 属于哪个包（需要 pkgfile）
pkgfile libkeybinder-3.0.so.0        # -> extra/libkeybinder3
```

本包的实际结论：

| 库 | 从哪来 |
|---|---|
| `libflutter_linux_gtk.so`、`libapp.so`、`libwhisper.so`/`libcrispasr.so`、`libglint.so`、`libdartjni.so`、5 个 `*_plugin.so` | **包自带**，用 `lib/` 里那份 |
| `libgtk-3.so.0`、`libgdk-3.so.0`、`libpango*`、`libcairo*`、`libgdk_pixbuf*`、`libgio/glib/gobject`、`libharfbuzz`、`libatk`、`libepoxy`、`libfontconfig`、`libz` | **`depends=('gtk3')`** 直接或间接带入 |
| `libkeybinder-3.0.so.0` | **`depends=('libkeybinder3')`**（只有这个插件用，gtk3 不带） |
| `libc/libm` | `glibc` |
| `libstdc++.so.6`、`libgcc_s.so.1`、`libgomp.so.1`（OpenMP） | `gcc-libs` |
| `libmpv.so*`（`dlopen`，不是 NEEDED）、`libespeak-ng.so`（`dlopen`） | `optdepends`：`mpv`、`espeak-ng` |
| `libjvm.so`（`libdartjni.so` 需要） | **故意不声明**：JNI 只在 Android 路径用到，Linux 桌面不可达 |
| `xdg-user-dir`（是外部**命令**，不是库） | **`depends=('xdg-user-dirs')`**：path_provider 靠它解析“文档目录”。实测缺了它，应用能启动但会报 `MissingPlatformDirectoryException`，日志/模型/历史全部失效 |

注意 `lib/` 里那些“包自带”的库能被找到，靠的是主程序 ELF 里烧的
`RUNPATH=$ORIGIN/lib`（`$ORIGIN` = 可执行文件真实所在目录）；`/usr/bin` 下的软链也没问题，
因为 glibc 通过 `/proc/self/exe` 解析 `$ORIGIN`，拿到的是 `/usr/lib/crisperweaver/`。

## ~/Documents 污染问题（wrapper 是干什么的）

**现象**：一启动就发现 `~/Documents/` 里冒出 `models/`、`logs/`、`history/`、`batch/`、`diagnostics/`（用到导出时还有 `exports/`、`speakers/`、`vad/`、`crispasr-cache/`）。

**根因**（已逐层核实）：

```
上游 Dart 代码 → path_provider 的 getApplicationDocumentsDirectory()
              → path_provider_linux: xdg.getUserDirectory('DOCUMENTS')
              → xdg_directories 1.1.0 会 Process.runSync('xdg-user-dir', ['DOCUMENTS'])
              → CLI 读取 ~/.config/user-dirs.dirs 的 XDG_DOCUMENTS_DIR
              → ~/Documents        ← 上游把“用户文档目录”当成了应用沙箱根目录
```

关键点：这个包是**预编译**的（逻辑 AOT 编进 `libapp.so`），-bin 包改不了代码；
而且实测 `XDG_DOCUMENTS_DIR=/tmp/x` 这种环境变量**没用**（`xdg-user-dir` 只看配置文件），
所以唯一的办法是在那一次外部命令调用上做文章。

**做法**：`/usr/bin/crisperweaver` 不再直接软链到二进制，而是个 shell wrapper：
把 `/usr/lib/crisperweaver/bin` 前置进 `PATH`，里面有个只回答 DOCUMENTS 的 `xdg-user-dir`
shim（其它查询原样转发给 `/usr/bin/xdg-user-dir`）。结果：

| | 位置 |
|---|---|
| 默认数据目录 | `<文档目录>/crisperweaver/`（即 `~/Documents/crisperweaver/`，文档目录位置是问真 `xdg-user-dir` 得来的，不是写死 `$HOME/Documents`） |
| 自定义 | `CRISPERWEAVER_DOCS_DIR=/path/to/dir crisperweaver` |
| 恢复上游行为（又散在 `~/Documents` 根下） | `CRISPERWEAVER_DOCS_DIR="$HOME/Documents" crisperweaver` |
| 上游将来改用 `getApplicationSupportDirectory()` | shim 不再被查询，自动失效，不会坏事 |

迁移旧数据（模型才是大的）：

```bash
mkdir -p ~/Documents/crisperweaver
mv ~/Documents/{models,history,logs,batch,diagnostics} ~/Documents/crisperweaver/
```

> 迁移后如果历史记录里的旧绝对路径显示失效是正常的；模型目录是扫描式的，重开一次就能认到。

## 打包决策记录</parameter>

| 决策 | 原因 |
|---|---|
| 装到 `/usr/lib/crisperweaver`，只软链 `/usr/bin/{crisper_weaver,crisperweaver}` | Flutter bundle 是一个整体（`data/` + `lib/`），启动器靠 `RUNPATH=$ORIGIN/lib` 找库；软链也能用，因为 glibc 用 `/proc/self/exe` 解析 `$ORIGIN`。放 `/opt` 会被 namcap 报 `ELF files outside of a valid path` |
| 用 `patchelf --set-rpath '$ORIGIN'` 修掉**带 CI 路径的 RUNPATH**（自动扫描，当前命中 6 个库） | 上游 CI 产物里烧着 `/home/runner/.../ephemeral` 和 temurin JDK 路径，namcap 报 Insecure RUNPATH。注意这**不是**补依赖，只是把错的搜索路径改成 `$ORIGIN` |
| 图标重采样成 256/512 | 上游只给 1024x1024 PNG，而 hicolor 的 `index.theme` 不含 1024，不 resize 菜单里就没图标 |
| `depends` 不写 `hicolor-icon-theme` / `glib2` / `pango` / `cairo` … | 全部由 `gtk3` 隐式带入（namcap: implicitly satisfied） |
| 不声明 `java-runtime` | `libdartjni.so` 的 `libjvm.so` 依赖只在 Android 路径用到，Linux 桌面端不可达 |
| 不做 `crisperweaver`（源码包） | 源码构建要 4 个仓库（CrisperWeaver + CrispASR(+ggml 子模块) + CrispEmbed + glint）、60+ 个 C++ backend、1~2 小时；且上游 CI 钉 Flutter 3.44.1，AUR 只有 `flutter` 3.41.2（out-of-date）和 `flutter-bin` 3.47.5，版本对不上，不适合维护 |
| wrapper + `xdg-user-dir` shim 把数据收进 `<文档目录>/crisperweaver` | 见上面专门一节。上游把 `getApplicationDocumentsDirectory()` 当沙箱根目录用，在 Linux 上就是往用户文档目录里扔一堆文件夹；预编译包改不了代码，只能拦这个外部命令。收进一个子目录而不是改去 `$XDG_DATA_HOME`，是因为用户更习惯在文档目录里找模型/导出 |

## 其他注意

- 上游只发 x86_64 release → `arch=('x86_64')`。
- 运行时可选依赖：`espeak-ng`（Kokoro/Piper 音素化，dlopen，GPL 的 espeak 数据故意不打包）、
  `mpv`（media_kit 的 libmpv 播放后端）。
- 上游默认把日志/模型放到 `~/Documents/logs`、`~/Documents/models`（与 cwd 无关），
  首次运行还会在 `~/.local/share/com.crispstrobe.crisperweaver.crisper_weaver` 建配置，打包不用管。
- 上游如果哪天发了 aarch64 或补上 hicolor 尺寸的图标，`arch` 和 imagemagick 重采样那步可以再简化。
