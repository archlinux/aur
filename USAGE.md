# amdgpu-fan-ctl-bmc 使用手册

面向"脚本在笔记本上跑、MI210 插在另一台服务器上、风扇归 BMC 管"这个具体拓扑，
把 SSH 怎么连、每个参数干什么、什么情况下用哪条命令一次讲清。
设计取舍和代码结构见 [README.md](README.md)。

---

## 0. 拓扑：谁在哪

| | 位置 | 说明 |
| --- | --- | --- |
| 跑脚本的机器 | 笔记本 `lucas@Arch`，仓库 `/home/lucas/harness/amdgpu-fan-ctl-bmc/` | **没有 MI210**，只有 `1002:1900` 核显 |
| MI210 | 服务器 `lucas-gpu-server`，PCI `43:00.0` `1002:740f`，gfx90a | 通过 SSH 隧道从笔记本访问 |
| 风扇 | H3C HDM，`https://192.168.1.56` | REST API，账号 `admin` |

隧道是**反向**的：服务器上的 `relay-tunnel.service`（User=lucas）执行
`ssh -NT -R 127.0.0.1:2222:127.0.0.1:22 lucas@<笔记本>`，
所以**在笔记本上** `127.0.0.1:2222` 就是服务器的 22 端口。
细节记录在 `/home/lucas/harness/.ipmi/remote-access-README.md`。

```
笔记本 ──(127.0.0.1:2222, 经反向隧道)──▶ 服务器 22 ──▶ MI210（rocm-smi）
   │
   └──(https, 192.168.1.56)────────────▶ H3C HDM ──▶ 机箱风扇
```

**因此脚本必须同时能：(1) SSH 到服务器读温度；(2) 直连 BMC 写风扇。** 见下面两节。

---

## 1. SSH 到 GPU 服务器

### 1.1 现状与已知故障

`~/.ssh/config` 里已经有：

```
Host gpu-server
  HostName 127.0.0.1
  Port 2222
  User lucas
  StrictHostKeyChecking accept-new
```

但**直接 `ssh gpu-server` 目前会失败**：

```
Bad owner or permissions on /etc/ssh/ssh_config.d/20-systemd-ssh-proxy.conf
```

原因：`/etc/ssh/ssh_config.d/` 下两个文件的属主是 `nobody:nobody`（容器遗留），
ssh 出于安全拒绝加载。它们是：

- `20-systemd-ssh-proxy.conf` → 符号链接到 `/usr/lib/systemd/ssh_config.d/20-systemd-ssh-proxy.conf`
- `30-libvirt-ssh-proxy.conf`

**这两个文件跟本任务无关**（只定义 `machine/*`、`unix/*` 之类的 ProxyCommand），
所以下面给了两种处理：改掉它，或绕开它。

### 1.2 一次性修好（需要笔记本 root）

```bash
# 20-systemd-... 是个符号链接，真正被 ssh 读取的是它指向的那个文件，
# 所以链接本身（-h）和目标文件都要改属主。
sudo chown -h root:root /etc/ssh/ssh_config.d/20-systemd-ssh-proxy.conf
sudo chown root:root \
  /usr/lib/systemd/ssh_config.d/20-systemd-ssh-proxy.conf \
  /etc/ssh/ssh_config.d/30-libvirt-ssh-proxy.conf

ssh gpu-server 'uname -n'      # 之后就直接能用了
```

> 这条**没有在本机实测过**（要 root）。判断依据是 ssh 的检查规则：配置文件必须属于
> root 或当前用户，且不能对组/其他可写；这两个文件当前是 `nobody:nobody`，正因此被拒。
> 改完仍报同样的错就退回 1.3 的绕行命令，功能上没有任何损失。

### 1.3 不改系统配置的绕行命令（★ 日常都用这条）

```bash
ssh -F /dev/null -o BatchMode=yes -o ConnectTimeout=10 \
    -o StrictHostKeyChecking=accept-new \
    -i ~/.ssh/id_ed25519 -p 2222 lucas@127.0.0.1 '<要在服务器上执行的命令>'
```

每个参数为什么必须有：

| 参数 | 作用 |
| --- | --- |
| `-F /dev/null` | 不读任何 ssh_config —— 绕开上面那个坏文件；**代价是 `~/.ssh/config` 也不再生效**，所以 `Host gpu-server` 里的端口/用户都得显式写出 |
| `-o BatchMode=yes` | 禁止交互提问，认证失败立即返回（脚本里用不会卡住） |
| `-o ConnectTimeout=10` | 隧道断了的话 10 秒就失败，不无限等 |
| `-o StrictHostKeyChecking=accept-new` | 首次连接的 known_hosts 自动接受（隧道每次重启端口不变，指纹稳定） |
| `-i ~/.ssh/id_ed25519` | 指明私钥；不写也能用默认路径，写了更明确 |
| `-p 2222` | **小写 p**，隧道端口 |

建议在 shell 里存成变量，后面的例子都用它：

```bash
SSH='ssh -F /dev/null -o BatchMode=yes -o ConnectTimeout=10 -o StrictHostKeyChecking=accept-new -i /home/lucas/.ssh/id_ed25519 -p 2222 lucas@127.0.0.1'
$SSH 'hostname; uname -r'
```

### 1.4 往服务器传文件

`scp` 的端口参数是**大写 `-P`**（ssh 是小写 `-p`），其余选项同名：

```bash
cd /home/lucas/harness/amdgpu-fan-ctl-bmc
scp -F /dev/null -o BatchMode=yes -P 2222 -i ~/.ssh/id_ed25519 \
    amdgpu_fan_ctl_bmc.py config.toml test_amdgpu_fan_ctl_bmc.py README.md USAGE.md \
    lucas@127.0.0.1:/home/lucas/amdgpu-fan-ctl-bmc/
```

一次传整个目录：

```bash
scp -F /dev/null -o BatchMode=yes -P 2222 -i ~/.ssh/id_ed25519 -r \
    /home/lucas/harness/amdgpu-fan-ctl-bmc lucas@127.0.0.1:/home/lucas/
```

服务器上的部署路径是 `~/amdgpu-fan-ctl-bmc/`（即 `/home/lucas/amdgpu-fan-ctl-bmc/`）。

### 1.5 在服务器上免交互执行 sudo

服务器上 `sudo` 要密码（`LUCAS_PASSWORD`，存在笔记本 `~/.zshrc` **第 258 行**）。
不要用 `chsh`（它会 `Authentication token manipulation error`），直接用 `sudo`：

```bash
# 1) 在本机把密码读进环境变量（这行只赋值，不会回显密码）
eval "$(sed -n 258p /home/lucas/.zshrc | sed 's/^[[:space:]]*export //')"

# 2) 把密码经 stdin 喂给 sudo -S；-p "" 消掉提示符
printf '%s\n' "$LUCAS_PASSWORD" | $SSH 'sudo -S -p "" systemctl status amdgpu-fan-ctl-bmc --no-pager'
```

- `sudo -S`：从标准输入读密码。
- `-p ""`：不打印 `[sudo] password for lucas:`，保持输出干净。
- 只想验证能免密：`printf '%s\n' "$LUCAS_PASSWORD" | $SSH 'sudo -S -p "" -v && echo SUDO_OK'`。

### 1.6 BMC（HDM）密码从哪来

**密码值不写在这个文档里、也不要提交进仓库。** 它存在两处：

| 位置 | 变量 |
| --- | --- |
| 笔记本 `/home/lucas/.zshrc` **第 257 行** | `IPMI_PASSWORD` |
| 服务器 `~/.bashrc` | `IPMI_PASSWORD` |

脚本读的是 `[bmc] password_env` 指定的环境变量（默认 `IPMI_PASSWORD`），所以要转存一下。

**在笔记本上跑脚本：**

```bash
eval "$(sed -n 257p /home/lucas/.zshrc | sed 's/^[[:space:]]*export //')"
export IPMI_PASSWORD="$IPMI_PASSWORD"
python3 amdgpu_fan_ctl_bmc.py -c config.toml --status
```

**在服务器上跑脚本：**

```bash
eval "$(grep -m1 -E '^[[:space:]]*export[[:space:]]+IPMI_PASSWORD=' ~/.bashrc \
        | sed 's/^[[:space:]]*export[[:space:]]*//')"
export IPMI_PASSWORD="$IPMI_PASSWORD"
python3 amdgpu_fan_ctl_bmc.py -c config.toml --status
```

**systemd 常驻**（推荐，密码不进 `ps`、不进 shell 历史）：
见 `amdgpu-fan-ctl-bmc.service` 里的 `EnvironmentFile=/etc/amdgpu-fan-ctl-bmc/bmc.env`，
该文件内容形如 `IPMI_PASSWORD=<值>`，权限 `0600`、属主 root。

另一种不落盘的做法是配 `[bmc] password_cmd`（默认注释在 `config.toml` 里），
让脚本每次现取一次密码——代价是每次要起一个 shell。

### 1.7 常用只读检查命令

> ⚠️ 服务器的登录 shell 已经被改成 **zsh**，而 `ssh host '<命令>'` 走的就是它。
> zsh 的默认行为是：**通配符匹配不到任何东西就报 `no matches found` 并让整条命令失败**
> （bash 会把 `[0-9]*` 原样传给命令）。所以下面这些命令都避开了裸通配符，
> 改用 `ls | grep` 或 `find`。写远程命令时踩到这个坑的表现是莫名其妙的报错。

```bash
# 隧道通不通 / 机器是否活着（服务器上没有 hostname 命令，用 uname -n）
$SSH 'uname -n; uptime'

# 服务器上 GPU 的温度（唯一温度源：rocm-smi -t --json；绝对路径，见 1.8）
$SSH '/opt/rocm/bin/rocm-smi -t --json'

# 这张卡是谁 + 有哪些传感器（脚本的身份校验 rocm_smi_match 就比对这里）
$SSH '/opt/rocm/bin/rocm-smi --showproductname --json'

# GPU 利用率（脚本用它判断"是不是真闲着"；0 = 空闲）
$SSH '/opt/rocm/bin/rocm-smi --showuse --json'

# 服务器到 BMC 通不通
$SSH 'curl -sk -o /dev/null -w "%{http_code}\n" https://192.168.1.56/'

# 隧道服务在不在
$SSH 'systemctl is-active relay-tunnel.service'
```

实测输出（2026-10-04）：

```
lucas-gpu-server
13:15:35 up 1:23, 4 users, load average: 0.23, 0.29, 0.31
{"card0": {"Temperature (Sensor edge) (C)": "38.0",
           "Temperature (Sensor junction) (C)": "41.0",
           "Temperature (Sensor memory) (C)": "38.0",
           "Temperature (Sensor HBM 0) (C)": "36.0", ... "HBM 3": "36.0"}}
{"card0": {"GPU use (%)": "0", "GFX Activity": "408"}}
{"card0": {"Card Series": "AMD Instinct MI210", "Card Model": "0x740f",
           "GFX Version": "gfx90a", ...}}
200                    # BMC 可达
active                 # relay-tunnel 在跑
```

> `rocm-smi` 在 GPU 空闲时会往 **stderr** 打
> `WARNING: AMD GPU device(s) is/are in a low-power state.`——这是正常的，与 JSON 无关。
> 脚本只看 stdout，且只从 stdout 里找第一个 `{`，所以这些 WARNING 不会污染解析。

### 1.8 文档里那些"看起来多余"的写法，为什么必须这样

| 写法 | 原因 |
| --- | --- |
| `-F /dev/null` + 显式 `-p 2222 lucas@127.0.0.1` | 绕开坏掉的 `ssh_config.d`；副作用是 `Host gpu-server` 别名失效，必须写全 |
| scp 用 `-P` | scp 的历史遗留：端口是大写，ssh 是小写 |
| 密码用 `sed -n 257p` 现取而不是硬编码 | 凭据不落仓库；`.zshrc` 行号变了要同步改这里 |
| `sudo -S -p ""` | 免交互 + 不污染输出 |
| `rocm_smi` 用 `/opt/rocm/bin/rocm-smi` 绝对路径 | 该目录只在**登录 shell** 的 `PATH` 里（`/etc/profile.d/rocm.sh`），systemd 和 `ssh host 'cmd'` 都取不到 |
| 温度源只认 `rocm-smi`，不做 sysfs 兜底 | `rocm-smi` 报的传感器更全（HBM 各堆）、且不用猜 PCI ID；而静默换源比直接报错危险得多 |
| 只看 stdout、只从第一个 `{` 开始解析 | GPU 空闲时 `rocm-smi` 会往 stderr 打 low-power WARNING；拿 stderr 当数据会解析出垃圾 |
| 不用 `hostname`、不用裸通配符 | 服务器是最小化 Arch（没有 `hostname`），且远程 shell 是 zsh（无匹配的通配符会直接报错） |

---

## 2. 命令行参数

```
python3 amdgpu_fan_ctl_bmc.py [-c CONFIG] [--mode {observe,assist,control}]
                       [--dry-run | --live] [--once] [--status]
                       [--simulate] [--restore] [--print-curves]
                       [--remote USER@HOST] [-p PORT] [--gpu-local]
                       [--selftest]
                       [--delta DELTA] [--seconds SECONDS]
                       [--log-level LEVEL]
```

### 2.1 选配置

| 参数 | 默认 | 说明 |
| --- | --- | --- |
| `-c, --config PATH` | 依次找 `./config.toml` → 脚本同目录的 `config.toml` | 配置文件路径，`.toml` 或 `.json`。给了就一定用它（路径不存在会直接报错）；一个都没找到才退回内置默认值（`mode=observe`、`dry_run=true`，绝不写 BMC），并打一条 WARNING |
| `--log-level LEVEL` | 跟配置 `general.log_level` | `debug` / `info` / `warning` / `error` |

> **`-c` 能不能省？** 能——只要 `config.toml` 在当前工作目录或脚本所在目录。
> 每次启动都会先打一行 `配置文件：<路径>（模式=… dry_run=…）`，`--status` 的第一行也是它。
> 改了配置却不生效，先看这一行：如果打的是 `没找到配置文件 …全部用内置默认值`，说明
> 程序压根没读你改的那个文件（这正是"把 `mode` 改成 `control`、`dry_run` 改成 `false`
> 却毫无反应"的经典原因）。

### 2.1b 选"在哪台机器上跑 rocm-smi"

温度源只有一个（`rocm-smi -t --json`），这里决定的只是**在哪台机器上执行它**。
**默认在本机跑**——在本仓库的拓扑下（脚本在笔记本、MI210 在服务器），
不带 `--remote` 就是读笔记本自己的核显。

| 参数 | 默认 | 说明 |
| --- | --- | --- |
| `--remote USER@HOST` | 空（= 本机） | 经 SSH 到这台机器上执行同一条 `rocm-smi` 命令。例：`--remote lucas@127.0.0.1` |
| `-p, --port PORT` | `0`（= ssh 默认 22） | SSH 端口，配合 `--remote`。例：`-p 2222` |
| `--gpu-local` | 关 | 忽略 `--remote` 和配置里的 `gpu.remote`，强制在**本机**跑 `rocm-smi`。在服务器上直接跑同一份配置时用 |

命令行给的 `--remote` / `-p` 优先于 `config.toml` 里的 `gpu.remote` / `gpu.port`。
最常用的三个组合：

```bash
python3 amdgpu_fan_ctl_bmc.py -c config.toml --status                                    # 本机
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --status   # 服务器
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --gpu-local  # 强制本机
```

SSH 的额外参数（含为什么默认带 `-F /dev/null`）在 2.6 和 3 的 `[gpu] ssh_options` 里。

### 2.2 选模式（决定"是否接管风扇"）

| 模式 | 行为 | 什么时候用 |
| --- | --- | --- |
| `observe` | **纯只读**。读温度、算决策、打日志，绝不写 BMC | 第一次上手、排查、长期只观察 |
| `assist` | 平时把风扇交还 BMC 自动；结温越过 `trigger_temp` 才接管，降到 `release_temp` 以下满 `release_cycles` 个周期再交还 | **推荐**。贴合"平时让 BMC 管、GPU 热了才介入" |
| `control` | 启动即手动接管，一直按曲线控制 | 你确定要全程自己管 |

`--mode` 覆盖配置文件里的 `general.mode`，只对本次运行有效。

### 2.3 选动作（做一件事就退出）

| 动作 | 是否写 BMC | 用途 |
| --- | --- | --- |
| `--print-curves` | 否 | 打印 7 条曲线 + **确认 rocm-smi 能连上、报出了哪些传感器**。改完 `[gpu]` 先跑这个 |
| `--simulate` | 否 | 25→100°C 逐档跑一遍曲线，看最终 PWM 合不合理。**完全不连 BMC**，没有凭据也能跑 |
| `--status` | 否 | 一次性打印：BMC 当前模式/PWM/16 个风扇转速 + GPU 各传感器温度 + BMC 关键温度及其临界值。**只读**（BMC 读不到的传感器会明确标注，见 2.7） |
| `--selftest` | 否 | 自检：温度源 + BMC 现状 + 此刻的决策。一个字节都不写 |
| `--selftest --live` | **是** | 真正试探一次风扇通道（见 2.5） |
| `--once` | 取决于模式 | 跑一个周期就退出，而不是常驻轮询 |
| `--restore` | **是** | 把 BMC 恢复成快照里记录的模式后退出。崩溃后的手动兜底 |

### 2.4 安全开关

| 参数 | 说明 |
| --- | --- |
| `--dry-run` | 强制只打印决策、绝不写 BMC。**优先级最高**，用来覆盖配置里 `dry_run = false` |
| `--live` | 关闭 dry-run，**真的会写 BMC**。与 `--dry-run` 互斥，同时给会报错退出 |

配置文件的 `general.dry_run` 默认为 `true`。也就是说：**不加 `--live`，程序不会碰风扇**，
哪怕 `mode = "control"`。`observe` 模式即使加 `--live` 也不会写（模式本身只读）。

### 2.5 自检试探相关

| 参数 | 默认 | 说明 |
| --- | --- | --- |
| `--delta N` | `5.0` | 试探时在**当前 PWM 基础上**加减多少个百分点。正数更吵、更容易看出变化；`-5` 更安静 |
| `--seconds N` | `25.0` | 改完 PWM 等多少秒再读转速。太短风扇还没加速完，太长浪费时间 |

试探流程：记下 BMC 原模式/占空比 → 切手动 → 下发 `当前±delta` → 等 N 秒 → 读平均转速比对 →
**在 `finally` 里还原**（原来自动就还原自动，原来手动 N% 就还原 N%）。
判据是转速变化 ≥20 rpm；不达标会提示可能撞了死区（`[bmc] write_deadband`）。

### 2.6 温度源：只有 rocm-smi

程序**没有**第二个温度源。唯一的读数是 `/opt/rocm/bin/rocm-smi -t --json`，
它一次返回全部传感器：

```json
{"card0": {"Temperature (Sensor edge) (C)": "38.0",
           "Temperature (Sensor junction) (C)": "41.0",
           "Temperature (Sensor memory) (C)": "38.0",
           "Temperature (Sensor HBM 0) (C)": "36.0", ...}}
```

传感器名**不写死**：任何匹配 `Temperature (Sensor XXX) (C)` 的键都会自动变成标签
`XXX`（转小写、非字母数字转下划线；`memory` 归一成 `mem`）。
所以 `HBM 0` → `hbm_0`，将来多出来的 `HBM 10` → `hbm_10`，换一张卡也照样能用。

**在哪台机器上跑：默认本机，用 `--remote` 切到远端**（不是一个独立温度源）：

| 命令行 | 行为 | 用在什么机器上 |
| --- | --- | --- |
| 不给 `--remote`（配置里 `gpu.remote` 也为空） | 本机直接跑 `rocm_smi` | 脚本就跑在插着卡的那台机器上 |
| `--remote user@host [-p 端口]` | 同一条 `rocm-smi -t --json` 经 SSH 到那台机器上跑 | 脚本在笔记本、卡在服务器 |

`--remote` 的值就是普通 ssh 目标（`user@host` 或只有 `host`），端口用 `-p` 给。
命令行没给时回落到配置的 `gpu.remote` / `gpu.port`。

SSH 命令用 `shlex.quote` 逐段拼成**一个** argv 交给 ssh，不经过本地 shell，
所以二进制路径里就算有空格也不会散架。`--gpu-local` 可临时忽略远端设置。

传给 ssh 的其它参数在 `[gpu] ssh_options` 里（默认含 `-F /dev/null -o BatchMode=yes
-o ConnectTimeout=10 -o StrictHostKeyChecking=accept-new`）；私钥路径用可选的
`[gpu] ssh_identity`（`-i`，支持 `~`）。

> ⚠️ 默认本机的代价：在笔记本上不带 `--remote` 跑，读到的是笔记本自己的 AMD 卡
> （这里是核显 `gfx1103`），而**不是**服务器上 MI210 的结温。想让脚本按 MI210 调风扇，
> 每次都得给 `--remote`；要常驻就把 `remote`/`port` 预置进 `config.toml`。

> 为什么不做 sysfs 兜底 / 不做"自动换源"：`rocm-smi` 会返回本机**每一张** AMD 卡的温度，
> 包括核显。如果程序在本机找不到目标卡就悄悄改用别的源或别的卡，就会出现
> "拿笔记本核显的 63°C 去调服务器风扇"这种**静默错数据**。
> 现在的做法是：读不到就 `WARNING` + fail-safe 拉高，绝不换源。
> 同一台机器上确实有多张卡、又只想认其中一张时，用 `[gpu] rocm_smi_match` 白名单。

### 2.7 `--status` 里"取不到的值"怎么看

`--status` 里有两类容易被误会成"脚本没取到"的东西，现在都明确标注了：

**① BMC 侧的 GPU 温度永远是 0。** H3C HDM 读 GPU 温度需要 GPU sideband
（SMBus / MCTP-PLDM）遥测支持，这台机器没有——所以 `GPU_MAX_TEMP` / `GPU_HBM_TEMP` /
`SLOT00_GPU_TEMP` / `SLOT03_GPU_TEMP` 在 BMC 眼里一直是 0。旧版本会把它们当读数打出来
（`0.0°C`），看起来像脚本的锅；现在改成一行结论：

```
  BMC 侧 GPU 温度：读不到（GPU_MAX_TEMP, GPU_HBM_TEMP, SLOT00_GPU_TEMP, SLOT03_GPU_TEMP 全是 0；H3C HDM 要有 GPU sideband 支持才读得到，本机没有）
  ↑ 这不影响控制：本程序用的 GPU 温度一律来自上面的 rocm-smi
```

如果哪台机器的 BMC 真能读到（值 > 0），那一路就会照常显示成普通读数
`GPU_HBM_TEMP  61.0°C   <- BMC 自己读到的 GPU 温度`。

**② BMC 不报临界阈值的传感器不再显示裸 `NA`。** H3C 上 `OCP_INLET_TEMP` 的
`higher_critical_threshold` 直接返回 `NA`，而同组的 `INPUT_TEMP_01/02` 报 `54`。
现在优先用 BMC 报的，BMC 没报就用配置兜底，并标注来源：

```
  INPUT_TEMP_01    23.0°C  临界 54°C
  OCP_INLET_TEMP   26.0°C  临界 54°C（配置兜底，BMC 没报）
```

兜底值配在 `[bmc] sensor_thresholds`。万一 BMC 不报、配置里也没有，会显示
`NA（BMC 没提供，bmc.sensor_thresholds 里也没兜底）`——把解法写在屏幕上。

---

## 3. `config.toml` 全量键

### `[general]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `mode` | `observe` | `observe` / `assist` / `control` |
| `dry_run` | `true` | `true` = 只打印不写。确认无误后再改 `false`，或用 `--live` |
| `poll_interval` | `2.0` | 采样周期（秒） |
| `log_level` | `info` | 日志级别 |
| `state_dir` | `/var/lib/amdgpu-fan-ctl-bmc` | 存"接管前的原始状态"快照，供 `--restore` 用。目录不可写时会自动退到 `$XDG_STATE_HOME/amdgpu-fan-ctl-bmc` 或 `/tmp/amdgpu-fan-ctl-bmc-<uid>` 并打 WARNING |
| `metrics_file` | 空 | 例如 `/run/amdgpu-fan-ctl-bmc/metrics.prom`，给 node_exporter textfile collector。该目录由 unit 的 `RuntimeDirectory=` 建好并授权给服务账户 |

### `[gpu]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `rocm_smi` | `/opt/rocm/bin/rocm-smi` | **必须绝对路径**，`/opt/rocm/bin` 不在 systemd 的 PATH 里 |
| `rocm_smi_match` | `""`（空 = 不校验） | 可选**白名单子串**：只认 `rocm-smi --showproductname` 里名字含它的卡。默认留空，因为"不特定于某一型号"；同一台机器上有多张 AMD 卡（含核显）时建议填 `"MI210"` |
| `remote` | `""`（= 本机） | 预置的远端目标，如 `"lucas@127.0.0.1"`。命令行 `--remote` 优先 |
| `port` | `0`（= ssh 默认 22） | 预置的 SSH 端口。命令行 `-p` 优先 |
| `ssh_options` | 见下 | 传给 ssh 的额外参数数组，放在目标主机之前。逐项进 `argv`，不经过本地 shell |
| `ssh_identity` | `""` | 可选 `-i` 私钥路径（支持 `~`）。留空 = 交给 ssh 找默认私钥（实测这台机器不需要显式指定） |
| `timeout` | `20` | 单次 `rocm-smi` 调用的超时（秒），对本地和 SSH 都生效。**没有单独的 SSH 超时**：连不上时 ssh 自己会按 `ConnectTimeout` 退出，读数按"读不到"处理 |
| `smoothing` | `0.35` | 温度指数平滑系数，越小越平滑、反应越慢。平滑状态按 `(卡, 传感器)` 分开存，多卡互不污染 |
| `critical_temp` | `90` | **最热的那一路** GPU 传感器到此直接 100%（MI210 的 non-recoverable 阈值就是 90）。任意传感器越线都算，不只是结温 |
| `idle_max_temp` | `55` | 空闲判定：最热一路 ≤ 此值**且**利用率 ≤ `idle_max_gpu_use` 时，所有 GPU 项封顶到 `idle_pwm` |
| `idle_max_gpu_use` | `0` | 还要求的 GPU 利用率上限（%）。`rocm-smi --showuse` 读不到时返回 -1，**不当作空闲**。设成 `100` 就退化成"只看温度" |
| `idle_pwm` | `22` | 空闲时 GPU 曲线项的上限 |

曲线名怎么和传感器对上、对不上时怎么办，见 2.6 和 3 的 `[curves.*]`。

当前 `ssh_options` 值（就是 1.3 那条绕行命令里的选项，**不含目标主机和端口**）：

```toml
ssh_options = ["-F", "/dev/null", "-o", "BatchMode=yes", "-o", "ConnectTimeout=10",
               "-o", "StrictHostKeyChecking=accept-new"]
```

默认带 `-F /dev/null` 是有原因的：本机 `/etc/ssh/ssh_config.d/` 下有个属主被搞坏的
文件（见 1.1），不加它 `ssh` 会直接报 `Bad owner or permissions` 而**连不上任何主机**。
代价是 `~/.ssh/config` 里的 Host 别名/跳板机不再生效。要用别名（前提是 1.2 已经修好）：

```toml
ssh_options = []
remote = "gpu-server"
```

要指定私钥：

```toml
ssh_identity = "~/.ssh/id_ed25519"
```

彻底本机运行（脚本部署在服务器上时，也是默认状态）：

```toml
remote = ""
```

### `[bmc]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `host` | `192.168.1.56` | HDM 地址，可带 `https://` |
| `username` | `admin` | HDM 账号 |
| `password_env` | `IPMI_PASSWORD` | 从哪个环境变量读密码 |
| `password_cmd` | `[]` | 备选：现取密码的命令数组，例如 `["zsh","-c","..."]` |
| `verify_tls` | `false` | HDM 自签证书，保持 `false` |
| `timeout` | `15` | 单次 HTTP 超时（秒） |
| `min_write_interval` | `5.0` | 两次写 BMC 的最小间隔，避免高频写配置 |
| `write_deadband` | `3` | PWM 变化小于此值就不写 |
| `critical_sensors` | `["CPU1_TEMP","CPU2_TEMP","MB_TEMP","OCP_INLET_TEMP"]` | 这些传感器越线就直接 100%。阈值优先取 BMC 自己的 `higher_critical_threshold`，取不到时用 `sensor_thresholds` |
| `sensor_thresholds` | `{ OCP_INLET_TEMP = 54.0 }` | BMC 不报阈值的传感器（H3C 上只有 `OCP_INLET_TEMP` 这样，返回 `NA`）用这里的兜底值。BMC 报了就一律以 BMC 为准 |
| `max_consecutive_errors` | `8` | 连续失败这么多次就退出，交给 systemd 重启 |

### `[fan]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `min_pwm` | `20` | HDM 的下限就是 20 |
| `max_pwm` | `100` | 上限 |
| `ramp_down_step` | `5` | 每次最多**降**多少（降噪用）。升温不限速（安全优先） |

### `[assist]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `trigger_temp` | `78` | 结温到这里接管。MI210 阈值 87/88/90，留了余量 |
| `trigger_pwm` | `45` | 接管瞬间的 PWM 下限 |
| `release_temp` | `62` | 降到这以下开始计时交还 |
| `release_cycles` | `10` | 连续这么多个周期都够凉才交还 |

### `[restore]`

| 键 | 默认 | 说明 |
| --- | --- | --- |
| `on_exit` | `true` | 退出 / SIGTERM 时恢复接管前的 BMC 模式 |

### `[curves.*]`

`points = [[温度°C, PWM%], ...]`，分段线性插值，两端外推用端点值。
**最终 PWM = 所有曲线在该时刻取值的最大值**，再被 `min_pwm`/`max_pwm` 夹住。

这 7 条曲线的意义：接管期间 BMC 自己的曲线是停摆的，所以 CPU / 主板 / 进风必须由本脚本一并兜住；
GPU 那边则是"每个传感器一条，谁热听谁的"。

**曲线名 = 传感器读数的名字。** `rocm-smi` 报出的每个传感器自动变成 `gpu_<标签>`
（`Temperature (Sensor junction) (C)` → `gpu_junction`，`HBM 0` → `gpu_hbm_0`）。
某个 `gpu_*` 传感器**没有同名曲线**时，走 `gpu_default`——所以换一张有奇怪传感器的卡也不会被静默忽略。
多张卡时每个标签取最热的那张。

| 曲线 | 数据来源 | 关键点 |
| --- | --- | --- |
| `gpu_junction` | `Temperature (Sensor junction) (C)` | 88°C → 100%（对应 non-recoverable 90） |
| `gpu_edge` | `Temperature (Sensor edge) (C)` | 更钝的备份 |
| `gpu_mem` | `max(memory, 所有 HBM 堆)` | 95°C → 100%。**特殊**：它吃的是 mem 和全部 hbm_* 里最大的那个 |
| `gpu_default` | 任何没有同名曲线的 `gpu_*` 传感器 | 兜底曲线，防止新传感器被静默丢掉 |
| `cpu_max` | `CPU1_TEMP`/`CPU2_TEMP` 取大 | 97°C → 100% |
| `mb` | `MB_TEMP` | 62°C → 100%（BMC 临界就是 62） |
| `inlet` | `INPUT_TEMP_01/02`/`OCP_INLET_TEMP` | 进风 45°C → 100% |

---

## 4. 典型场景

### A. 改完代码/配置，先验证（不碰风扇）

```bash
cd /home/lucas/harness/amdgpu-fan-ctl-bmc
python3 -m unittest test_amdgpu_fan_ctl_bmc              # 55 个离线用例，不连硬件
python3 amdgpu_fan_ctl_bmc.py -c config.toml --print-curves    # rocm-smi 连不连得上、报出了哪些传感器
python3 amdgpu_fan_ctl_bmc.py -c config.toml --simulate        # 25~100°C 逐档看曲线输出
python3 amdgpu_fan_ctl_bmc.py -c config.toml --selftest        # 温度源 + BMC 现状 + 此刻的决策（只读）
```

上面三条读的是**本机**的 AMD 卡。要看服务器上的 MI210，全都加上
`--remote lucas@127.0.0.1 -p 2222`（见 2.1b）。

改完记得同步到服务器：

```bash
scp -F /dev/null -o BatchMode=yes -P 2222 -i ~/.ssh/id_ed25519 \
    amdgpu_fan_ctl_bmc.py config.toml test_amdgpu_fan_ctl_bmc.py README.md USAGE.md \
    lucas@127.0.0.1:/home/lucas/amdgpu-fan-ctl-bmc/
$SSH 'cd ~/amdgpu-fan-ctl-bmc && python3 -m unittest test_amdgpu_fan_ctl_bmc'
```

### B. 在笔记本上看服务器的风扇和温度（只读，零风险）

```bash
eval "$(sed -n 257p /home/lucas/.zshrc | sed 's/^[[:space:]]*export //')"
export IPMI_PASSWORD="$IPMI_PASSWORD"
cd /home/lucas/harness/amdgpu-fan-ctl-bmc
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --status
```

`--remote` 让同一条 `rocm-smi` 命令经 SSH 到服务器上跑（**默认不给 `--remote` 时
读的是笔记本自己的核显**）；BMC 则由脚本直接连 `192.168.1.56`。
两边都不需要事先手动登录服务器。

### C. 证明"通道真的能调风扇"

```bash
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --selftest                    # 只读
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --selftest --live --delta 5 --seconds 25
```

预期：转速上升几百 rpm，结束时自动还原。2026-10-04 实测 `30%→35%` 使
`4960rpm → 5770rpm`，随后还原成自动 30%。

### D. 正式启用（systemd 常驻）

**前置条件**：步骤 C 已经通过；并且决定让守护进程真的写 BMC —— 把
`config.toml` 里的 `general.dry_run` 改成 `false`（`ExecStart` 里没带 `--live`，
是否写全看这个配置项）。想先空跑就把 `mode` 留在 `observe`。

```bash
cd /home/lucas/harness/amdgpu-fan-ctl-bmc
eval "$(sed -n 257p /home/lucas/.zshrc | sed 's/^[[:space:]]*export //')"
export IPMI_PASSWORD="$IPMI_PASSWORD"

# 1) 建目录
printf '%s\n' "$LUCAS_PASSWORD" | $SSH \
  'sudo -S -p "" install -d -m 0755 /etc/amdgpu-fan-ctl-bmc /opt/amdgpu-fan-ctl-bmc'

# 2) 传程序 / 配置 / 文档 / unit / 账户定义
scp -F /dev/null -o BatchMode=yes -P 2222 -i ~/.ssh/id_ed25519 \
    amdgpu_fan_ctl_bmc.py config.toml README.md USAGE.md \
    amdgpu-fan-ctl-bmc.service amdgpu-fan-ctl-bmc.sysusers lucas@127.0.0.1:/tmp/

# 3) 就位
printf '%s\n' "$LUCAS_PASSWORD" | $SSH 'sudo -S -p "" bash -lc "
    install -m 0644 /tmp/amdgpu_fan_ctl_bmc.py /opt/amdgpu-fan-ctl-bmc/amdgpu_fan_ctl_bmc.py &&
    install -m 0644 /tmp/config.toml    /etc/amdgpu-fan-ctl-bmc/config.toml &&
    install -m 0644 /tmp/README.md /tmp/USAGE.md /opt/amdgpu-fan-ctl-bmc/ &&
    rm -f /tmp/amdgpu_fan_ctl_bmc.py /tmp/config.toml /tmp/README.md /tmp/USAGE.md"'

# 4) HDM 密码落成 EnvironmentFile（0600，root）。注意 unit 里读的是 hdm.env
umask 077
printf 'IPMI_PASSWORD=%s\n' "$IPMI_PASSWORD" > /tmp/hdm.env
scp -F /dev/null -o BatchMode=yes -P 2222 -i ~/.ssh/id_ed25519 \
    /tmp/hdm.env lucas@127.0.0.1:/tmp/hdm.env
rm -f /tmp/hdm.env
printf '%s\n' "$LUCAS_PASSWORD" | $SSH 'sudo -S -p "" install -m 0600 -o root -g root /tmp/hdm.env /etc/amdgpu-fan-ctl-bmc/hdm.env'

# 5) 装 unit + 建专用账户并启动
printf '%s\n' "$LUCAS_PASSWORD" | $SSH 'sudo -S -p "" bash -lc "
    install -m 0644 /tmp/amdgpu-fan-ctl-bmc.service /etc/systemd/system/ &&
    install -Dm0644 /tmp/amdgpu-fan-ctl-bmc.sysusers /usr/lib/sysusers.d/amdgpu-fan-ctl-bmc.conf &&
    systemd-sysusers &&
    systemctl daemon-reload && systemctl enable --now amdgpu-fan-ctl-bmc"'

# 6) 看日志（这条不需要 sudo）
$SSH 'journalctl -u amdgpu-fan-ctl-bmc -f'
```

unit 以专用系统账户 `amdgpu-fan-ctl-bmc` 运行（`User=`/`Group=`，账户由上面的
`.sysusers` 文件创建），不再用 root；账户还被加进 `render`/`video` 组，以便本机跑
`rocm-smi` 时访问 `/dev/kfd`、`/dev/dri/renderD*`。`state_dir=/var/lib/amdgpu-fan-ctl-bmc`
由 unit 的 `StateDirectory=` 建好并把属主改成这个账户——**它同时是账户的家目录**，
所以用 `--remote` 经 SSH 读温度时，私钥/`known_hosts` 放在
`/var/lib/amdgpu-fan-ctl-bmc/.ssh/`。别把 `state_dir` 改到别处，否则快照写不进去。

### E. 上负载验证闭环

```bash
# 在服务器上起负载（另开一个会话）
$SSH 'systemctl is-active amdgpu-fan-ctl-bmc'                    # 守护进程在跑
$SSH '/opt/rocm/bin/rocm-smi --showuse'                   # 必须绝对路径！非登录 shell 的 PATH 里没有它
# 然后跑任意 HIP/ROCm 负载，或 python-pytorch-rocm
```

另开一个观察窗口，每 2 秒打一次"GPU 温度 + 此刻的决策"（用 `--selftest` 而不是 `--status`：
`--status` 只报 BMC 现状，`--selftest` 会多打一行 `目标 PWM / 接管 / 理由`）：

```bash
while true; do
  date +%H:%M:%S
  python3 amdgpu_fan_ctl_bmc.py -c config.toml --selftest --log-level warning 2>&1 \
    | grep -E '读数|模式=|目标 PWM|接管|理由'
  sleep 2
done
```

输出形如（2026-10-04 实测；`grep` 只留下这几行）：

```
13:16:41
  读数：{'edge': 38.0, 'junction': 41.0, 'mem': 38.0, 'hbm_0': 36.0, ...}
  模式=自动  PWM=30%  平均转速=4995rpm
  目标 PWM=20%  接管=False  临界=False
  理由：GPU 空闲(最热 41°C, 利用率 0%) → GPU 项封顶 22%; 最大需求来自 gpu_junction=20%
```

不加 `grep`、直接跑一次 `--selftest` 看到的分段输出：

```
13:16:40 WARNING state_dir /var/lib/amdgpu-fan-ctl-bmc 不可写，临时改用 /tmp/amdgpu-fan-ctl-bmc-1000
13:16:41 INFO    已记录 BMC 原始状态: 自动 PWM=30.0
=== 1) GPU 温度源（rocm-smi）===
  rocm-smi SSH <ssh -F /dev/null ... -p 2222 lucas@127.0.0.1>（/opt/rocm/bin/rocm-smi）
  卡：card0=AMD Instinct MI210 (gfx90a)  白名单为空：rocm-smi 报出来的卡全都参与
  传感器：['edge', 'hbm_0', 'hbm_1', 'hbm_2', 'hbm_3', 'junction', 'mem']
  读数：{'edge': 38.0, 'junction': 41.0, 'mem': 38.0, 'hbm_0': 36.0, ...}
  GPU 利用率：0%
=== 2) BMC 风扇现状 ===
  模式=自动  PWM=30%  平均转速=4995rpm
=== 3) 脚本此刻会怎么决策 ===
  目标 PWM=20%  接管=False  临界=False
  理由：GPU 空闲(最热 41°C, 利用率 0%) → GPU 项封顶 22%; 最大需求来自 gpu_junction=20%
(dry-run) 到此为止，一个字节都没写 BMC。加 --live 才会真的试探。
```

跑负载时 `junction` 会往上走，`接管` 会翻成 `True`，`目标 PWM` 跟着曲线抬高。

守护进程的日志（这条不需要 sudo）：

```bash
$SSH 'journalctl -u amdgpu-fan-ctl-bmc -f'
```

要看到三件事：结温越过 78°C 后**接管**；PWM 按曲线跟上去；负载结束降温后**交还 BMC**。

### F. 一键回滚

```bash
python3 amdgpu_fan_ctl_bmc.py -c config.toml --restore      # 用快照恢复 BMC 模式
$SSH 'sudo systemctl disable --now amdgpu-fan-ctl-bmc'
# 甚至在 BMC 上直接强制回自动：
cd /home/lucas/harness && ./.ipmi/fan.sh auto
```

---

## 5. 排障速查

| 现象 | 原因 | 处理 |
| --- | --- | --- |
| **改了 `config.toml`（如 `mode=control`、`dry_run=false`）却"没生效"** | 程序根本没读那个文件：`-c` 没给、当前工作目录也不是配置文件所在目录 | 启动日志第一行看 `配置文件：…（模式=… dry_run=…）`；`--status` 第一行同款。打的是 `没找到配置文件 …全部用内置默认值` 就说明读的是内置默认（`observe` + `dry_run=true`，必然不写 BMC）。加 `-c 路径`，或 `cd` 到配置文件所在目录。<br>⚠️ 另两个"看起来没生效"的正当行为：`--status`/`--selftest` 本来就是只读；`[restore] on_exit=true` 会在进程退出时把 BMC 还给自动模式，所以 `--once` 跑完看不出痕迹是正常的 |
| `Bad owner or permissions on .../20-systemd-ssh-proxy.conf` | `ssh_config.d` 下文件属主是 `nobody` | 见 1.2 改属主；或直接用 1.3 的绕行命令 |
| `amdgpu_fan_ctl_bmc.py: 找不到 /opt/rocm/bin/rocm-smi` / `rocm-smi 没返回 JSON` | GPU 不在脚本跑的这台机器上，或 `rocm-smi` 不在这台机器的 PATH/该路径 | 卡在别的机器上就加 `--remote user@host -p 端口`（或预置 `[gpu] remote`/`port`）；本机跑就确认 `[gpu] rocm_smi` 是绝对路径。`--selftest` 会打印它实际用的二进制和位置 |
| 温度显示的是**笔记本核显** 63°C / `card0=N/A (gfx1103)` | **默认就是本机执行**，而本机也有 AMD 卡；`rocm_smi_match` 又留空了 | 加 `--remote lucas@127.0.0.1 -p 2222`（或预置进 `[gpu] remote`/`port`）指向 MI210 那台机器；同一台机器上有多张卡时填 `rocm_smi_match = "MI210"` |
| `[gpu] remote` 配好了但还在读本机 | 命令行给了 `--gpu-local`（它的优先级最高） | 去掉 `--gpu-local` |
| 脚本里冒出 ssh 的 `Bad owner or permissions on .../20-systemd-ssh-proxy.conf` | 本机 `ssh_config.d` 下文件属主是 `nobody`，而 `[gpu] ssh_options` 里的 `-F /dev/null` 被去掉了 | 见 1.2 改属主，或把 `-F /dev/null` 加回 `[gpu] ssh_options` |
| `HDM 登录失败 ... code 15000` | **不是密码错**，是 BMC 会话数已满 | 等 BMC 空闲超时回收（实测约 4 分钟）；或在 HDM 网页里注销其它会话。当前版本每个退出路径都会主动登出，正常不会再累积 |
| `HDM 登录失败 ... code 1009` | 用户名/密码错 | 检查 `IPMI_PASSWORD` 是否真导出（`sed` 取出来的是 shell 变量，**要再 `export` 一次**） |
| `state_dir ... 不可写，临时改用 ...` | `/var/lib` 只读、或手动跑时没权限 | 手动跑属正常；systemd 下 `StateDirectory=` 会建好目录并授权给服务账户，不该出现此告警——真出现就查 `/var/lib/amdgpu-fan-ctl-bmc` 属主是否为 `amdgpu-fan-ctl-bmc` |
| `--selftest` 说"可能撞了死区"，转速没变 | `--delta` 太小 | 加大 `--delta`；注意 5% 的降幅比升幅更不容易看出变化 |
| GPU 温度读得到，但 BMC 界面 `GPU_MAX_TEMP` 仍是 0 | **预期行为**。BMC 物理上读不到 MI210 温度 | 无需处理；想根治要 H3C 固件支持 GPU sideband |
| 风扇在"自动"但转速偏高 | 接管/交还的瞬间有一档变化，属正常 | 观察一两个周期；仍不对就 `--restore` |
| `sudo: a terminal is required` | 没走 `-S` | 用 1.5 的 `printf ... | sudo -S -p ""` |

---

## 6. 安全边界

**以下情况程序绝不会写 BMC：**

- `mode = "observe"`（无论加不加 `--live`）
- `dry_run = true`（配置默认值，或显式 `--dry-run`）
- `--simulate` / `--print-curves` / `--status` / `--selftest`（不带 `--live`）

**以下情况会写 BMC：**

- `--selftest --live`（试探后自动还原）
- `--restore`（把 BMC 恢复成快照模式）
- 常驻运行且 `mode` 为 `assist`/`control` 且 `dry_run = false` 或给了 `--live`

**始终成立的兜底：**

- 退出、SIGTERM、崩溃（`atexit`）都会尝试还原接管前的模式；
- 快照同时写在 `state_dir` 文件里和内存里，文件写失败只降级告警；
- 每个退出路径都会 `DELETE /api/session` 主动登出 BMC，不占会话；
- GPU 温度**连续 3 个周期**读不到 → 接管并把 PWM 拉到 `max(min_pwm, trigger_pwm)`
  （默认 45%），而不是维持低转速（fail-safe）。
