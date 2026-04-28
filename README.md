<p align="center">
  <img src="https://img.shields.io/aur/version/astrbot-git?label=AUR&logo=archlinux&color=1793D1">
  <img src="https://img.shields.io/aur/maintainer/astrbot-git?label=Maintainer&color=blue">
  <img src="https://img.shields.io/badge/License-AGPL--3.0-blue">
  <img src="https://img.shields.io/badge/arch-linux?logo=archlinux&label=Arch%20Linux&color=1793D1">
</p>

# AstrBot (AUR Package)

[📖 English](#english) · [📖 中文说明](#chinese)

---

<details>
<summary id="english"><b>📖 English</b></summary>

AstrBot is an Agentic IM Chatbot infrastructure. This AUR package (`astrbot-git`) provides a system-level, multi-instance deployment of AstrBot using `uv` for environment isolation.

### Features

- **Multi-Instance Support**: Run multiple bots on the same server with isolated data and environments.
- **Systemd Integration**: Manage bots as system services (`systemctl start astrbot@instance`).
- **Environment Isolation**: Uses `uv` to manage a per-instance virtualenv under `/var/lib/astrbot/<instance>/.venv`, keeping your system Python clean.
- **Secure by Default**: Runs as a dedicated `astrbot` user with restricted permissions.

### Installation

#### Arch Linux (via AUR)

```bash
paru -S astrbot-git
```

#### Other Distributions (Debian / Ubuntu / RHEL / Fedora / openSUSE)

```bash
bash <(curl -s https://raw.githubusercontent.com/AstrBotDevs/astrbot-aur/master/setup.sh)
```

Or download and inspect manually:

```bash
git clone https://github.com/AstrBotDevs/astrbot-aur.git
cd astrbot-aur
./setup.sh
```

The `setup.sh` script auto-detects your distribution and installs required dependencies, creates the `astrbot` system user, sets up directories, clones the app to `/opt/astrbot`, and installs the systemd service. Run `./setup.sh help` for step-by-step options.

### Quick Start

1.  **Initialize an instance**:
    ```bash
    sudo astrbotctl init bot1
    ```
    This creates configuration in `/etc/astrbot/bot1.conf` and data directory in `/var/lib/astrbot/bot1`. It also bootstraps the AstrBot data files.

2.  **Start the service**:
    ```bash
    sudo systemctl enable --now astrbot@bot1
    ```

3.  **Check status**:
    ```bash
    astrbotctl status bot1
    # or
    systemctl status astrbot@bot1
    ```

### Management Commands (`astrbotctl`)

The `astrbotctl` utility is the main entry point for managing AstrBot instances.

#### Create & Delete

- **Init new instance**:
    ```bash
    sudo astrbotctl init <name>
    ```
    Or initialize directly from an AstrBot backup archive:
    ```bash
    sudo astrbotctl init -f /path/to/backup.zip <name>
    ```
- **Copy/Clone instance**:
    ```bash
    sudo astrbotctl cp <source> <dest>
    ```
    Clones data and generates a new config with a non-conflicting port.
- **Remove instance**:
    ```bash
    sudo astrbotctl rm <name>
    ```
    Stops service, deletes data, config, and cache.

#### Operation

- **List instances**:
    ```bash
    astrbotctl ls
    ```
- **Change dashboard credentials quickly**:
    ```bash
    sudo astrbotctl admin -u admin -p 'new-password' <name>
    ```
- **Export instance backup quickly**:
    ```bash
    astrbotctl export <name>
    astrbotctl export -o /tmp -d sha256 <name>
    ```
- **Import backup into an instance quickly**:
    ```bash
    astrbotctl import <name> /path/to/backup.zip
    astrbotctl import -y <name> /path/to/backup.zip.gpg
    ```
- **Run natively (CLI)**:
    Execute AstrBot commands directly within the instance's environment (e.g., manage plugins).
    ```bash
    # List plugins
    astrbotctl cli <name> plug list
    
    # Install a plugin
    astrbotctl cli <name> plug install <plugin_repo>
    ```
- **Refresh an instance venv after package updates**:
    Package upgrades try to sync existing instance virtualenvs automatically. If `/opt/astrbot` has been updated but an instance still appears to run old AstrBot code:
    ```bash
    sudo astrbotctl sync <name>
    # or sync all instances
    sudo astrbotctl sync --all
    ```
	- **Auto-rollback on update failure**:
	    `astrbotctl update` and `astrbotctl sync` automatically back up the current venv before rebuilding.
	    If the sync, service start fails, or the instance crashes within the stability monitoring window (default 60s),
	    the previous venv is restored and the instance restarted with the old code.
	    Control via `UPDATE_AUTO_ROLLBACK=0` in `/etc/astrbot/update.conf`.

### Architecture & File Structure

This package uses a read-only application source (`/opt`) with per-instance mutable data and virtualenvs under `/var/lib`.

```bash
/
├── opt/
│   └── astrbot/                  # [Read-Only] App source code
│       ├── astrbot/              # Python source package
│       ├
|       ── pyproject.toml        # Dependency definitions
│     
│
├── usr/
│   ├── bin/
│   │   └── astrbotctl            # [CLI Entrypoint] Management script
│   │
│   └── lib/systemd/system/
│       └── astrbot@.service      # [Systemd Template] Service unit
│
├── etc/
│   └── astrbot/                  # [Config Center] Instance config files
│       ├── bot1.conf             # Config for 'bot1'
│       └── bot2.conf             # Config for 'bot2'
│
├── var/
│   └── lib/astrbot/              # [Data + Venv] Per-instance runtime state
│       ├── bot1/                 # Data for 'bot1' (DB, logs, plugins, .venv)
│       └── bot2/                 # Data for 'bot2' (DB, logs, plugins, .venv)
```

### Configuration

Configuration files are located at `/etc/astrbot/<instance>.conf`.

```bash
# /etc/astrbot/bot1.conf

# Network
ASTRBOT_HOST=0.0.0.0
ASTRBOT_PORT=3000

# Storage
ASTRBOT_ROOT="/var/lib/astrbot/bot1"

# Advanced
EXTRA_ARGS=""
```

### Troubleshooting

- **Logs**:
  ```bash
  journalctl -u astrbot@<instance> -f
  ```

- **Permission Errors**:
  Ensure directories in `/var/lib/astrbot` and the instance venv are owned by `astrbot:astrbot`.
  ```bash
  sudo chown -R astrbot:astrbot /var/lib/astrbot
  sudo chown -R astrbot:astrbot /var/lib/astrbot/<instance>/.venv
  ```
  If the venv was created by `root`, also ensure its Python interpreter is not linked into `/root/.local/share/uv/...`.
  Rebuild the venv after installing the fixed package if needed.

- **Package Updated But Runtime Still Looks Old**:
  Package upgrades try to sync instance virtualenvs automatically. If `/opt/astrbot/.version` has changed but the instance still behaves like the old AstrBot code is installed:
  ```bash
  sudo astrbotctl sync <instance>
  # or
  sudo astrbotctl sync --all
  ```

- **Stale Lock File**:
  The lock file lives at `ASTRBOT_ROOT/astrbot.lock` (for example `/var/lib/astrbot/<instance>/astrbot.lock`). If an instance exits unexpectedly and leaves the lock behind, remove it manually:
  ```bash
  sudo rm -f /var/lib/astrbot/<instance>/astrbot.lock
  ```

- **Clean Cache**:
  If python dependencies break after an update:
  ```bash
  sudo rm -rf /var/lib/astrbot/<instance>/.venv
  sudo systemctl restart astrbot@<instance>
  ```

- **Build-time validation**:
    The PKGBUILD ships a `check()` function that runs smoke tests (syntax check + critical symbol grep) during `makepkg`,
    preventing broken AstrBot code from being packaged.

### Package Information

- **AUR Page**: [astrbot-git](https://aur.archlinux.org/packages/astrbot-git)
- **Git Clone URL**: `https://aur.archlinux.org/astrbot-git.git`
- **Upstream URL**: [AstrBotDevs/AstrBot](https://github.com/AstrBotDevs/AstrBot)
- **Maintainer**: lightjunction
- **License**: AGPL-3.0-only

### Contributing

Contributions to the packaging scripts are welcome!

- **Packaging Issues**: Please comment on the AUR page or submit issues to the maintainer.
- **AstrBot Issues**: Please report bugs related to the bot functionality to the [upstream repository](https://github.com/AstrBotDevs/AstrBot/issues).
- **Co-Maintainership**: Please apply at [AUR Co-maintainers](https://aur.archlinux.org/pkgbase/astrbot-git/comaintainers) and email `lightjunction.me@gmail.com` with your AUR username and details for review.

</details>

<details>
<summary id="chinese"><b>📖 中文说明</b></summary>

AstrBot 是一个支持多模型、多平台的即时通讯机器人框架。本 AUR 软件包 (`astrbot-git`) 提供了基于系统级服务、多实例部署的 AstrBot 环境，并使用 `uv` 进行环境隔离。

### 功能特性

- **多实例支持**: 在同一台服务器上运行多个机器人，数据和环境相互隔离。
- **Systemd 集成**: 将机器人作为系统服务管理 (`systemctl start astrbot@instance`)。
- **环境隔离**: 使用 `uv` 为每个实例管理位于 `/var/lib/astrbot/<instance>/.venv` 的独立虚拟环境，保持系统 Python 环境整洁。
- **默认安全**: 作为专用的 `astrbot` 用户运行，权限受限。

### 安装

#### Arch Linux（通过 AUR）

```bash
paru -S astrbot-git
```

#### 其他发行版（Debian / Ubuntu / RHEL / Fedora / openSUSE）

```bash
bash <(curl -s https://raw.githubusercontent.com/AstrBotDevs/astrbot-aur/master/setup.sh)
```

或手动下载查看后执行：

```bash
git clone https://github.com/AstrBotDevs/astrbot-aur.git
cd astrbot-aur
./setup.sh
```

`setup.sh` 脚本会自动检测发行版，安装系统依赖、创建 `astrbot` 系统用户、创建目录、克隆应用到 `/opt/astrbot`、安装 systemd 服务。运行 `./setup.sh help` 查看分步安装选项。

### 快速开始

1.  **初始化实例**:
    ```bash
    sudo astrbotctl init bot1
    ```
    这将在 `/etc/astrbot/bot1.conf` 创建配置文件，在 `/var/lib/astrbot/bot1` 创建数据目录，并自动初始化 AstrBot 数据文件。

2.  **启动服务**:
    ```bash
    sudo systemctl enable --now astrbot@bot1
    ```

3.  **检查状态**:
    ```bash
    astrbotctl status bot1
    # 或者
    systemctl status astrbot@bot1
    ```

### 管理命令 (`astrbotctl`)

`astrbotctl` 工具是管理 AstrBot 实例的主要入口。

#### 创建与删除

- **初始化新实例**:
    ```bash
    sudo astrbotctl init <name>
    ```
    也可以直接从 AstrBot 备份文件初始化:
    ```bash
    sudo astrbotctl init -f /path/to/backup.zip <name>
    ```
- **复制/克隆实例**:
    ```bash
    sudo astrbotctl cp <source> <dest>
    ```
    克隆数据并生成一个新的配置文件（自动分配不冲突的端口）。
- **删除实例**:
    ```bash
    sudo astrbotctl rm <name>
    ```
    停止服务，删除数据、配置和缓存。

#### 操作

- **列出实例**:
    ```bash
    astrbotctl ls
    ```
- **快速修改控制台账号密码**:
    ```bash
    sudo astrbotctl admin -u admin -p 'new-password' <name>
    ```
- **快速导出实例备份**:
    ```bash
    astrbotctl export <name>
    astrbotctl export -o /tmp -d sha256 <name>
    ```
- **快速导入实例备份**:
    ```bash
    astrbotctl import <name> /path/to/backup.zip
    astrbotctl import -y <name> /path/to/backup.zip.gpg
    ```
- **原生运行 (CLI)**:
    直接在实例环境中执行 AstrBot 命令（例如管理插件）。
    ```bash
    # 列出插件
    astrbotctl cli <name> plug list
    
    # 安装插件
    astrbotctl cli <name> plug install <plugin_repo>
    ```
- **在包更新后刷新实例虚拟环境**:
    包升级时会尽量自动同步现有实例虚拟环境。如果 `/opt/astrbot` 已更新，但实例看起来仍在运行旧版本代码：
    ```bash
    sudo astrbotctl sync <name>
    # 或同步全部实例
    sudo astrbotctl sync --all
    ```

### 架构与文件结构

本软件包使用只读的应用程序源码 (`/opt`)，配合每个实例位于 `/var/lib` 下的可变数据和虚拟环境。

```bash
/
├── opt/
│   └── astrbot/                  # [只读] 应用程序核心代码库
│       ├── astrbot/              # Python 源码包
│       ── pyproject.toml        # 依赖定义文件
│      
│
├── usr/
│   ├── bin/
│   │   └── astrbotctl            # [核心入口] 管理脚本
│   │
│   └── lib/systemd/system/
│       └── astrbot@.service      # [Systemd 模板] 服务单元文件
│
├── etc/
│   └── astrbot/                  # [配置中心] 实例配置文件
│       ├── bot1.conf             # 'bot1' 的配置
│       └── bot2.conf             # 'bot2' 的配置
│
├── var/
│   └── lib/astrbot/              # [数据 + 虚拟环境] 每个实例的运行时状态
│       ├── bot1/                 # 'bot1' 的数据（数据库、日志、插件、.venv）
│       └── bot2/                 # 'bot2' 的数据（数据库、日志、插件、.venv）
```

### 配置文件

配置文件位于 `/etc/astrbot/<实例名>.conf`。

```bash
# /etc/astrbot/bot1.conf

# 网络
ASTRBOT_HOST=0.0.0.0
ASTRBOT_PORT=3000

# 存储
ASTRBOT_ROOT="/var/lib/astrbot/bot1"

# 高级
EXTRA_ARGS=""
```

### 故障排除

- **查看日志**:
  ```bash
  journalctl -u astrbot@<instance> -f
  ```

- **权限错误**:
  确保 `/var/lib/astrbot` 以及 `/var/lib/astrbot/<instance>/.venv` 归 `astrbot:astrbot` 所有。
  ```bash
  sudo chown -R astrbot:astrbot /var/lib/astrbot
  sudo chown -R astrbot:astrbot /var/lib/astrbot/<instance>/.venv
  ```
  如果 venv 是由 `root` 创建的，还要确认其中的 Python 解释器没有链接到 `/root/.local/share/uv/...`。
  安装修复后的包后，必要时重建该实例的 venv。

- **锁文件残留**:
  锁文件位于 `ASTRBOT_ROOT/astrbot.lock`，例如 `/var/lib/astrbot/<instance>/astrbot.lock`。如果实例异常退出后锁文件未删除，可以手动删除：
  ```bash
  sudo rm -f /var/lib/astrbot/<instance>/astrbot.lock
  ```

- **清理缓存**:
  如果更新后 Python 依赖出现问题：
  ```bash
  sudo rm -rf /var/lib/astrbot/<instance>/.venv
  sudo systemctl restart astrbot@<instance>
  ```

- **自动回滚**：
    `astrbotctl update` 和 `astrbotctl sync` 会在重建 venv 前自动备份。
    如果 sync 失败、服务启动失败、或在稳定性监控窗口（默认 60s）内崩溃，
    会自动恢复旧 venv 并用旧代码重启。
    通过 `/etc/astrbot/update.conf` 中的 `UPDATE_AUTO_ROLLBACK=0` 控制。

- **构建时验证**：
    PKGBUILD 包含 `check()` 函数，在 `makepkg` 时自动执行 smoke test（语法检查 + 关键符号 grep），
    确保有问题的 AstrBot 代码不会被打包。

### 软件包信息

- **AUR 页面**: [astrbot-git](https://aur.archlinux.org/packages/astrbot-git)
- **Git 克隆地址**: `https://aur.archlinux.org/astrbot-git.git`
- **上游地址**: [AstrBotDevs/AstrBot](https://github.com/AstrBotDevs/AstrBot)
- **维护者**: lightjunction
- **许可证**: AGPL-3.0-only

### 贡献指南

欢迎对打包脚本进行贡献！

- **打包问题**: 请在 AUR 页面评论或联系维护者。
- **AstrBot 问题**: 关于机器人本身的功能问题，请反馈至 [上游仓库](https://github.com/AstrBotDevs/AstrBot/issues)。
- **申请共同维护**: 请在 [AUR](https://aur.archlinux.org/pkgbase/astrbot-git/comaintainers) 上提交申请，并发送邮件至 `lightjunction.me@gmail.com`，附带您的 AUR 用户名及相关信息以供审核。

</details>
