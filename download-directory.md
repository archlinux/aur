# 修改下载目录（baidupcs-rust-bin）

本文档说明在本机 systemd 部署下如何把下载目录改到任意路径，以及目标目录属主不是服务用户时的权限处理。与上游 README 的差别仅在路径：本包以专用系统用户运行，配置文件不在解压目录。

## 配置存放位置（本包特有）

| 项目 | 值 |
| --- | --- |
| 服务单元 | `baidupcs-rust.service`（默认不自启，需 `systemctl enable --now baidupcs-rust`） |
| 运行用户 | `baidupcs`（sysusers 创建，无登录 shell） |
| 状态目录 | `/var/lib/baidupcs-rust/`（tmpfiles 创建，0750 `baidupcs:baidupcs`），程序的工作目录即此处 |
| 配置文件 | `/var/lib/baidupcs-rust/config/app.toml`，下载目录在 `[download] download_dir` |
| Web UI | `http://127.0.0.1:18888` |

首次启动时程序会自建 `app.toml`，默认指向状态目录下的 `downloads/`。

## 方法一：Web UI（推荐）

打开 `系统设置 → 下载目录` 填写新路径并保存；单个任务也可在下载对话框里用文件资源管理器临时选目录。v1.14.1 起目录选择器会显示该目录的属主、服务运行用户与是否可写，权限不对在发起下载前就能看到。

## 方法二：直接改配置文件

程序在界面上任何一次「保存设置」都会整体重写 `app.toml`，因此手改必须停服进行，否则改动会被之后的某次保存覆盖：

```bash
sudo systemctl stop baidupcs-rust
sudo editor /var/lib/baidupcs-rust/config/app.toml   # 修改 [download] download_dir
sudo systemctl start baidupcs-rust
```

## 目标目录属主不是 baidupcs（权限问题）

程序以 `baidupcs` 用户运行，往普通用户拥有的目录写入会失败。v1.12.0 起启动时会检查配置里的下载目录：不存在或不可写会输出提示并优雅退出；运行中则是任务报「没有权限」。

**推荐用 ACL，不要 chown**——目录仍可归你自己的用户所有，双方共用互不影响：

```bash
# 一次性：存量内容补权限（目录属主自己执行即可，无需 root）
setfacl -R -m u:baidupcs:rwX /data/baidu-netdisk
# 默认 ACL：此后任一方新建的文件/子目录对方均可读写
setfacl -m d:u:baidupcs:rwX,d:u:lucas:rwX /data/baidu-netdisk
```

> 注意 POSIX ACL 的语义：默认条目只授予**设置之后**新建的条目，已有内容必须跑一次上面的递归命令。若日后从别处拷入历史子树，再手动补一次 `setfacl -R -m u:baidupcs:rwX <目录>`。

### 可选：systemd drop-in（机器本地配置，本包不附带）

重启后如需自动保证目录存在且 ACL 就位（目录被误删也能自愈），可加一个 root 前缀脚本单元。**故意不带 `-R`**——每次启动递归遍历整个下载树会拖慢服务启动，存量权限由上面的一次性命令负责：

```ini
# /etc/systemd/system/baidupcs-rust.service.d/download-dir.conf
[Service]
# "+" = 以 root 身份在启动主进程前执行；三条均幂等
ExecStartPre=+mkdir -p /data/baidu-netdisk
ExecStartPre=+setfacl -m u:baidupcs:rwX /data/baidu-netdisk
ExecStartPre=+setfacl -m d:u:baidupcs:rwX,d:u:lucas:rwX /data/baidu-netdisk
```

```bash
sudo systemctl daemon-reload && sudo systemctl restart baidupcs-rust
```

ACL 在 ExecStartPre 阶段就绪，赶在 v1.12.0+ 的启动目录检查之前。

## 验证

```bash
# 服务用户能否写入（测试文件用完即删）
sudo -u baidupcs touch /data/baidu-netdisk/.acl-test && sudo -u baidupcs rm /data/baidu-netdisk/.acl-test
# 查看生效的 ACL，应含 user:baidupcs:rwx 及 default 条目
getfacl /data/baidu-netdisk
```
