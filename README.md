# 天翼云电脑 Public 的 Arch 打包候选

维护者：Ca11back。保留原维护者 venhal 的贡献记录与 AUR Git 历史。
当前版本为官方 Debian 包 `4.1.0.1346`，仅支持 x86_64，本地改名候选为
`ctyun-clouddesk-bin 4.1.0.1346-2`。用户已报告旧名第二版安装后简单测试无异常；
详细功能覆盖尚未确定，USB 测试延后。新名包的迁移事务仍待验证。

配方按固定下载 ID 获取官方二进制并验证 SHA-256；保留私有 Qt、OpenSSL
和其他厂商库。`ctyun-clouddesk` 启动器只设置自身及子进程的库/Qt 路径，
转发命令行参数，并沿用 xcb 平台。Wayland 会话需要 XWayland，未验证原生 Wayland。
`!strip`、`!debug` 防止 makepkg 改写厂商 ELF 或拆出调试包。

## 服务、更新与目录权限

保留 `/usr/lib/systemd/system/clouddesktop-daemon.service`，安装不会自动
启用或启动它。该服务默认以 root 运行，是否影响登录、连接或外设功能仍需实测，
不能据此断言 USB 必须启用 daemon。

安装后如需手动测试后台 daemon，可执行 `sudo systemctl start clouddesktop-daemon.service`；
确认需要开机运行时，再执行 `sudo systemctl enable --now clouddesktop-daemon.service`。
前者仅立即启动系统服务，不设置开机启动，后者同时启用开机启动并立即启动。
这些命令启动后台 daemon，不启动桌面 GUI。GUI 通过应用菜单或 `ctyun-clouddesk`
启动；若要登录桌面后自动打开 GUI，应在桌面环境的自动启动设置中单独配置。

第二版排除 `/usr/bin/ark-update-CtyunClouddeskPublic`、
`/usr/bin/ark-update-CtyunClouddeskPublicd` 和对应 updater 服务。
它们使用 Debian `dpkg` 更新逻辑，不适用于本包的文件管理方式；版本升级通过
pacman/AUR 完成。客户端私有目录完整保留；复杂运行耦合和详细外设功能尚未建立完整验证。

tmpfiles 声明 `/var/lib/CtyunClouddeskPublic` 为 `root:root 1777`，沿用上游
postinst 的共享目录语义。客户端和 daemon 都引用其中的 `userpath.txt`。
1777 允许所有本地用户创建文件，sticky 位限制删除他人文件，但不解决共享
文件的预创建、内容信任或 root daemon 读取风险。收紧权限须先验证协议和多用户行为。
不打包 Debian maintainer scripts，不修改用户自动启动、用户组、USB 规则或 NTP。

## 后续版本更新

1. 查询官方下载目录，确认 Public 产品线、完整 Debian 版本和新的固定下载 ID。
2. 下载并独立核对版本、架构、SHA-256；更新 `pkgver`、source ID 和校验值，重置 `pkgrel=1`。
3. 重新审计 `DT_NEEDED`、私有库、插件、服务和脚本；不能沿用旧依赖表作兼容性结论。
4. 执行 `bash -n PKGBUILD`、`makepkg --verifysource`、`makepkg --printsrcinfo > .SRCINFO`
   和 `makepkg`。构建不需要执行厂商程序。依赖齐备后再用 namcap、干净 chroot 验证。
5. 在单独授权的安装测试中验证普通用户 GUI、登录、连接、音频、剪贴板、USB/打印、
   daemon 需求与卸载/升级；保留旧包便于回滚。构建成功不代表这些功能已验证。

缺依赖时 `makepkg -d` 只能证明跳过依赖检查的归档构造，不能视为完整构建通过。
AUR 上传仅包含配方、`.SRCINFO` 和必要支持源，不上传 Debian/Arch 二进制或缓存。

本候选提供版本化旧名 `ctyunclouddeskpublic-bin=$pkgver`，与旧名包冲突；不设
`replaces`。迁移需用户明确选择新包并检查包管理器事务，不能假设 AUR helper
自动跟随合并改名。后续发布新目标包及旧包合并请求需要单独执行授权。
本地仓库 origin 指向原本地 Git 仓库，不是 AUR 目标；当前没有提交或推送。
原 Git 历史和 contributor 保留。
不要把独立 Universal 产品线的 `ctyun-cloud-desk` 当作同一包合并。

## 许可证

本仓库新增的打包支持文件使用 `LICENSE` 中的 0BSD；上游二进制与原贡献者内容
不因此重新授权。上游第三方许可证保留在应用 `licenses/`，并复制到
`/usr/share/licenses/ctyun-clouddesk-bin/upstream/`。
这些第三方声明不等于闭源客户端的再分发许可。当前客户端指向的
[官方用户协议](https://www.ctyun.cn/portal/protocol/10538938) 已找到（页首生效日期 2026-01-09），
但未找到明确针对此 Linux 发布版本的二进制再分发或本地重打包许可。
AUR 下载配方发布与分发二进制需分别评估；`LicenseRef-Proprietary` 不代表明确许可。
用户选择继续本地准备并不咨询厂商，相关不确定性保留记录，不把厂商咨询设为先决条件。
