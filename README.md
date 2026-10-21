# Toonflow — Arch Linux (AUR) 打包

本目录包含 Toonflow 的 AUR 打包文件（PKGBUILD、systemd 服务、启动脚本、`.SRCINFO`）。

Toonflow 官方桌面端仅发布 Windows / macOS / Android 安装包，没有 Linux 桌面构建。
本包采用与官方 Dockerfile 相同的**服务端模式**在 Linux 上运行：从源码构建独立的
server + web 资源，由 systemd 管理，浏览器访问 `http://127.0.0.1:3006` 使用。

## 文件说明

| 文件 | 作用 |
| --- | --- |
| `PKGBUILD` | 包定义（版本、源、构建与安装步骤） |
| `toonflow` | 启动包装脚本（`/usr/bin/toonflow`），设置默认数据目录与端口 |
| `toonflow.service` | systemd 服务单元（专用账户 `toonflow`，状态目录 `/var/lib/toonflow`） |
| `toonflow.sysusers` | 服务专用系统账户定义（安装为 `/usr/lib/sysusers.d/toonflow.conf`） |
| `toonflow.conf` | 服务环境变量配置（安装为 `/etc/conf.d/toonflow`，属于 pacman `backup`） |
| `.SRCINFO` | AUR 元数据，由 `makepkg --printsrcinfo` 生成 |
| `LICENSE` / `LICENSES/` / `REUSE.toml` | 打包文件本身的 0BSD 许可（AUR 要求） |
| `.gitignore` | 忽略 `src/`、`pkg/`、`*.pkg.tar.zst` 等构建产物 |

## 构建与测试

```bash
# 本地构建（生成 toonflow-2.0.7-1-x86_64.pkg.tar.zst）
makepkg -s

# 审计
namcap PKGBUILD
namcap toonflow-2.0.7-1-x86_64.pkg.tar.zst
shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD
pkgctl license check

# 安装并启动服务
sudo pacman -U toonflow-2.0.7-1-x86_64.pkg.tar.zst
sudo systemctl enable --now toonflow
```

手动运行（不装服务）直接执行 `/usr/bin/toonflow`，数据目录默认 `~/.local/share/toonflow`。

## 运行说明

### 服务账户

安装时 pacman 的 systemd 钩子会执行 `systemd-sysusers`，自动创建专用系统账户
`toonflow`（无登录 shell，home 为 `/var/lib/toonflow`），**无需手动 `useradd`**。
服务以该账户运行，`StateDirectory=toonflow` 由 systemd 创建 `/var/lib/toonflow`
（权限 `0750`）并归属该账户。

### 配置

`/etc/conf.d/toonflow` 是服务环境变量文件（已列入 `backup=()`，升级时保留改动并生成
`.pacnew`）：

```bash
sudoedit /etc/conf.d/toonflow   # 修改端口 / 数据目录
sudo systemctl restart toonflow
```

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `TOONFLOW_SERVER_PORT` | `3006` | 监听端口（1–65535） |
| `TOONFLOW_DATA_DIR` | `/var/lib/toonflow` | 数据目录；改到其它路径需同时放开单元的 `ReadWritePaths=` |
| `NODE_ENV` | `production` | 由启动脚本兜底设置 |

手动运行（不装服务）直接执行 `/usr/bin/toonflow`，此时数据目录默认
`~/.local/share/toonflow`，端口同样可用上述环境变量覆盖。

### 网络

上游默认监听 `0.0.0.0` 且**无内置鉴权**，公网部署请前置带认证的反向代理；
仅需本机访问时可在 `toonflow.service` 中取消 `IPAddressAllow=localhost` 的注释。

## 打包备注

- **构建工具链**：上游 `package.json` 声明 `packageManager: bun@1.3.14`，但 bun 不强制
  锁定该版本。本包直接依赖官方仓库的 `bun`（当前 extra 中 1.4.x），构建已验证通过。
- **源码来源与校验**：使用上游 `v2.0.7` 标签的归档 tarball（`archive/refs/tags/v2.0.7.tar.gz`，
  sha256 固定）。相比 `git+…` 源，下载量约 11 MB 而非 209 MB（整个仓库历史），
  且不再需要 `git` 作为 `makedepends`。PKGBUILD 中注释了该标签对应的上游提交
  `30139c93…`，便于追溯。
- **bun.lock 补丁**：上游 `bun.lock` 将部分依赖的 tarball 地址固化在已停止服务的
  `registry.npm.taobao.org`（27 处）与国内镜像 `registry.npmmirror.com`（1000+ 处）。
  `prepare()` 把这些地址统一改写为 `registry.npmjs.org`，仅改下载地址，不影响版本与
  sha512 校验。
- **本地文件**：启动脚本与 systemd 单元写在 `source=()` 中（并附 sha256），
  makepkg 会把它们链接进 `$srcdir`，`package()` 再从中安装，避免直接引用
  `$startdir`。
- **appVersion**：构建时传入 `appVersion=$pkgver`，使产物内嵌正确版本号
  （上游 `electrobun.config.ts` 默认值为 `2.0.0`）。
- **node shebang**：上游产物 `build/mcp/stdio.js` 与 anydoc 的 `cli.js` 声明的是
  `#!/usr/bin/env node`，但本包运行时为 bun（MCP stdio 由 bun 启动），安装时统一
  改写为 `bun`，避免引入不必要的 `nodejs` 依赖。
- **运行时依赖**：`build/` 目录自包含（服务端 bundle、`build/web` 前端资源、
  `build/tools|nodes|ext|skills|providers` 动态加载产物、以及 photon/anydoc 的
  原生模块），运行时只依赖 `bun`，无需安装 `node_modules`。
- **服务账户**：使用 `sysusers.d` 定义专用系统账户（`/usr/lib/sysusers.d/toonflow.conf`），
  由 pacman 的 systemd 钩子自动创建；单元中用 `User=`/`Group=` + `StateDirectory=`
  管理数据目录，不再使用 `DynamicUser`。
- **配置文件**：`/etc/conf.d/toonflow` 通过 `EnvironmentFile=-/etc/conf.d/toonflow`
  注入，列入 `backup=('etc/conf.d/toonflow')`，用户改端口/数据目录不会被升级覆盖。
- **FFmpeg**：媒体处理所需的 FFmpeg 由应用自身按需下载到数据目录，或可在设置中选择
  “系统”模式复用系统 `ffmpeg`（列为 `optdepends`）。
- **构建需要网络**：`bun install --frozen-lockfile` 需要访问 npm registry，
  AUR 构建环境允许联网，但离线环境无法构建。
- **check() 校验**：除确认 `build/server/index.js` 与 `build/web` 存在外，还会检查
  服务端 bundle 中未残留构建机的绝对路径（上游曾因此导致运行时找不到 WASM /
  原生文件）。
- **已知 namcap 提示**：`namcap` 会对上游预编译的 anydoc 原生模块报告
  “lacks PIE”“libc.so is an uninstalled dependency”等警告，属于上游二进制自身
  的问题，不影响运行。
