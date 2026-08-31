# 打包权限模型

## 当前决策

- 目标环境按单用户桌面系统处理。安装时只创建权限为 `777` 的 `data` 和
  `data/sing-box`，其余内容由 GUI 按需创建并归运行用户所有。
- 安装或升级本包时，对 `/usr/bin/sing-box` 设置
  `cap_net_admin,cap_net_raw,cap_net_bind_service=ep`，保证 TUN、直连 UDP 和
  低端口监听具备所需权限。
- 通过 alpm hook 监听 `usr/bin/sing-box` 的安装和升级，在核心二进制被替换后
  自动恢复 capability。
- 启动 GUI 时不再请求管理员认证，桌面入口和上游自启动项都可以直接运行。
- sing-box 在 TUN 启停时通过 `resolvectl` 设置和恢复接口 DNS。`sing-box` 软件包
  自带规则只覆盖系统用户，因此额外允许本机活动会话用户执行所需的四个
  resolve1 动作，避免核心启停时重复认证。

## 已知限制

- 该方案会修改 `sing-box` 软件包拥有的二进制。hook 只覆盖 pacman 管理的安装和
  升级；手动替换或显式清除 capability 后，需要重新安装本包或手动恢复。
- capability 会保留到 `sing-box` 二进制被替换或显式清除，并非仅对本次进程有效。
- 上游生成的 `~/.config/autostart/GUI.for.SingBox.desktop` 直接启动
  `/opt/gui-for-singbox/GUI.for.SingBox`，但不再依赖软件包启动器恢复 capability。
- 真正的按进程临时授权需要上游提供受控 helper 或 service。
- 旧版本留下的递归 `777` 内容不会在升级时自动迁移。

## CoreCtrl 对照

CoreCtrl 的普通用户配置位于 `~/.config/corectrl`。GUI 通过 system D-Bus 调用
位于 `/usr/lib/corectrl` 的 root helper，polkit 授权的是 helper 操作，而不是给
GUI 或其他软件包的二进制永久设置 capability。
