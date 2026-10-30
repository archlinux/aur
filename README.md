# astragram-desktop

Arch Linux 打包文件，使用 AstraGram 官方预编译 Linux 发布包。
包名为 `astragram-desktop`，支持 `x86_64` 和 `aarch64`。

```bash
makepkg -si
```

安装后从应用菜单启动 AstraGram，或运行 `astragram-desktop`。
程序和上游 Updater 安装到 `/opt/astragram-desktop/`，Qt 等静态库由上游提供。
启动脚本设置 `DESKTOPINTEGRATION=1`，使用包内桌面入口，避免程序重复生成用户级入口。
预编译程序使用带实例哈希的 D-Bus 名称，桌面入口直接执行程序，不使用固定名称的 D-Bus 激活。

上游保留 `com.ayugram.desktop` 应用标识，因此此包声明与 AyuGram 包冲突。
它不替代 `telegram-desktop`，也不修改 Telegram 的默认协议处理器设置。

图标和许可证从固定版本标签下载，所有下载源均固定 SHA-256。
优先通过更新 PKGBUILD 并重新构建来升级，使安装文件与 pacman 数据库保持一致。

7.3.3.4 已包含上游对关闭代理配置窗口时崩溃的修复（issue #59，提交 f2faddf）。
验证情况：x86_64 执行完整 `makepkg` 构建、`check()` 和动态链接依赖检查；
ARM64 核验发布包 SHA-256、ELF 架构及动态库需求，未在 ARM64 设备运行。
