# xpad-beitong-dkms 1.4-1

为现有北通 GIP 初始化补丁提供纯源码 DKMS 打包。原补丁作者为 Zixing Liu；ilevnn 在上游 PR #3/#4 报告了 GCC 工具链及 headers 缺少源码的问题。本后继实现保留归属，不执行贡献者 recipe。固定源码、签名和 SHA 校验详见 SOURCES.md。

支持经过审阅的精确 x86_64 内核：官方 Arch `7.3.4-arch1-2`、linux-zen `7.3.4-zen2-2-zen`、CachyOS `7.3.4-1-cachyos` 与 `6.18.60-2-cachyos-lts`，以及历史已验证的 `7.3.3-1-cachyos`（本轮该 headers 已移除，未重新编译）。

需要每个目标匹配的 headers 和编译器；Makefile 按目标配置选择 GCC/Clang。未列出的 release 明确拒绝，不下载、不回退旧源码。若依赖未列内核的北通补丁功能，不应直接升级本包，需先审阅并增加该内核；stock 回退不等于保留补丁功能。

包只含版本化 /usr/src 中的源码、配置和来源说明，不含预编译 .ko 或 .INSTALL。标准 Arch DKMS hooks 负责生命周期，模块签名沿用 DKMS framework 策略，不主动重载现场模块。请核对事务日志及 DKMS 状态，pacman 返回 0 不足以证明每项 hook 都成功。

官方包和 source tag 已用既有 Arch keyring 验证；四个当前可用目标的受控根目录真实安装、升级、旧 1.0-1 迁移和卸载通过，stock 文件精确恢复。这不是宿主模块装载、Secure Boot 接受或完整实体手柄验证。KP70C1 仍未验证，未猜测添加设备 quirk。

上游：https://github.com/675076143/xpad-beitong-dkms
后继实现：af6f96e33fa18700a695a5a4e98d7a26ea373ed6
