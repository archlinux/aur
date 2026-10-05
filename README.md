# amdgpu-fan-ctl-bmc

用 **AMD/ROCm GPU 温度**驱动 **H3C HDM 机箱风扇**的闭环控制器。

针对的具体问题：H3C HDM（AMI MegaRAC 系）的风扇自动温控只认 BMC 自己能读到的传感器，
而它读不到 MI210 的 GPU 温度：

```
SLOT03_GPU_TEMP  | C3h | No Reading     <- 就是这张卡
GPU_MAX_TEMP     | 6Ah | No Reading
GPU_HBM_TEMP     | 6Bh | No Reading
```

所以 **GPU 再热，BMC 的自动曲线也不理它**。本程序把这个缺口补上。

---

## 1. 为什么不直接用现成的项目

网上同类项目全部是"主机读温度 → 主机设转速"，但 **没有一个能用在 H3C 上**，
因为它们都依赖厂商私有的 IPMI raw 命令（Dell `0x30 0x30`、ASRock `0x30 0x70`、联想 IMM2 各一套）。

本程序改用 **HDM 自己的 REST API**（`PUT /api/system_inventory/set_fan`），
这条路已经在本机实测可用（见 `../.ipmi/fan.sh`）。

和 [asrock-rack-fan-control](https://github.com/Visual-Synthesizer/asrock-rack-fan-control) 的对比：

| 能力 | asrock-rack-fan-control | amdgpu-fan-ctl-bmc |
|---|---|---|
| 控制通道 | ASRock 私有 IPMI raw | ✅ H3C HDM REST API（通用、已实测） |
| 温度来源 | `nvidia-smi`（NVIDIA 专有） | ✅ `rocm-smi -t --json`（AMD 官方，自动展开全部传感器：edge / junction / memory / HBM 各堆） |
| **接管期间保护 CPU** | ❌ 只看 GPU | ✅ **CPU / 主板 / 进风各有曲线，取最大值** |
| 临界越线拉满 | ❌ 无 | ✅ 阈值优先从 BMC 自己的 `/api/sensors` 读；它不报的（如 `OCP_INLET_TEMP`）用 config 兜底，不硬编码 |
| "平时仍由 BMC 管" | ❌ 一直是主机控制 | ✅ **`assist` 模式：只在 GPU 变热时接管，冷下来交还** |
| 读不到 GPU 温度 | 报告失败 | ✅ fail-safe 拉高 + 尝试交还 |
| 退出/崩溃恢复 | ✅ 恢复 BMC auto | ✅ 恢复**接管前的模式**（快照落盘，可 `--restore` 手动兜底） |
| 写 BMC 频率 | 每次循环都可能写 | ✅ 死区 + 最小间隔，减少 BMC 配置反复写入 |
| 升降速 | — | ✅ 升温不限速（安全），降温限速（降噪） |
| 离线验证 | dry-run | ✅ dry-run **+ `--simulate` 温度扫描**（完全不连 BMC） |
| 依赖 | ipmitool + nvidia-smi | ✅ **仅 Python 3.11+ 标准库** |

---

## 2. 三种模式

| 模式 | 行为 | 用途 |
|---|---|---|
| `observe` | 只读、只打印决策，**一个字节都不写 BMC** | 先看几天日志，确认曲线合理 |
| `assist` | **平时风扇完全归 BMC 自动管**；GPU 结温 ≥ `trigger_temp` 时临时接管，降到 `release_temp` 并持续 `release_cycles` 个周期后交还 | ✅ 推荐。最贴近"平时让 BMC 自己管"的诉求 |
| `control` | 一直由本程序接管（BMC 长期处于手动模式） | 跑长时重载时需要精确控制 |

---

## 3. 安全设计

接管期间 **BMC 自己的温控曲线是停摆的**——这是所有同类脚本最大的隐患。
本程序为此做了这些事：

1. **CPU / 主板 / 进风独立曲线**，最终 PWM 取所有曲线的最大值，所以接管不会让 CPU 失控。
2. **临界阈值来自 BMC 本身**：从 `/api/sensors` 读每个传感器的 `higher_critical_threshold`
   和实时读数，任何被监控传感器越线 → 直接拉满。BMC 不报阈值的传感器
   （H3C 上 `OCP_INLET_TEMP` 就是这样，返回 `NA`）退回 `bmc.sensor_thresholds` 里配的兜底值。
3. **升温不限速，降温按 `ramp_down_step` 限速**（避免风扇忽高忽低）。
4. **读不到 GPU 温度连续 3 次 → fail-safe**（拉高到接管转速并尝试接管），而不是维持低转速。
5. **BMC 写失败重试**，连续失败超过 `max_consecutive_errors` 则退出，交给 systemd 重启。
6. **启动时快照 BMC 原始模式并落盘**；退出 / SIGTERM / 崩溃时恢复；
   `--restore` 可在任何时候手动恢复。
7. **只在需要时写 BMC**：PWM 变化小于 `write_deadband` 跳过，
   两次写入间隔小于 `min_write_interval` 也跳过。
8. **默认 `dry_run = true`**：不显式改配置或加 `--live`，永远不会动风扇。

---

## 4. 安装

> **本文档只讲设计。** 本机 → 服务器这条链路的每一条 SSH/scp/sudo 命令、
> 所有参数的逐项说明、配置键全表、场景化 SOP 和排障速查，都在
> **[USAGE.md](USAGE.md)** 里。

```bash
# 1) 拷到服务器
scp -P 2222 amdgpu_fan_ctl_bmc.py config.toml amdgpu-fan-ctl-bmc.service \
    amdgpu-fan-ctl-bmc.sysusers root@server:/tmp/   # 或用你自己的通道
sudo mkdir -p /opt/amdgpu-fan-ctl-bmc /etc/amdgpu-fan-ctl-bmc
sudo cp amdgpu_fan_ctl_bmc.py /opt/amdgpu-fan-ctl-bmc/
sudo cp config.toml     /etc/amdgpu-fan-ctl-bmc/

# 2) 放密码（0600、属主 root，别提交进仓库）
sudo sh -c "echo 'IPMI_PASSWORD=你的HDM密码' > /etc/amdgpu-fan-ctl-bmc/hdm.env"
sudo chmod 600 /etc/amdgpu-fan-ctl-bmc/hdm.env

# 3) 装 unit + 建专用账户
sudo cp amdgpu-fan-ctl-bmc.service /etc/systemd/system/
sudo install -Dm644 amdgpu-fan-ctl-bmc.sysusers /usr/lib/sysusers.d/amdgpu-fan-ctl-bmc.conf
sudo systemd-sysusers
sudo systemctl daemon-reload
```

> unit 以**专用系统账户** `amdgpu-fan-ctl-bmc` 运行（`User=`/`Group=`，账户由上面的
> `.sysusers` 文件创建），不再用 root。`/var/lib/amdgpu-fan-ctl-bmc`（即 `state_dir`，
> 也是该账户的家目录）**不用手动建**——systemd 的 `StateDirectory=` 会建好并把属主改成
> 这个账户。用 `--remote` 经 SSH 读温度时，私钥 / `known_hosts` 放在
> `/var/lib/amdgpu-fan-ctl-bmc/.ssh/`；本机跑 `rocm-smi` 时 unit 已把账户加进
> `render`/`video` 组以访问 `/dev/kfd`、`/dev/dri/renderD*`。
>
> 用 `amdgpu-fan-ctl-bmc` 软件包安装时，账户和这些目录都由 pacman 自动处理好，无需以上手动步骤。

> 用 `password_cmd` 从 `~/.zshrc` 取密码也行（见 `config.toml` 注释），
> 但 `EnvironmentFile` 更干净，也不受 `ProtectHome` 影响。

---

## 5. 使用

**第 0 步：自检（`--selftest`）——一条命令回答"它到底看不看得见我的卡、会不会调风扇"**

```bash
# 只读：读一次 GPU 温度 + BMC 现状 + 算出此刻会怎么决策，一个字节都不写 BMC
sudo python3 amdgpu_fan_ctl_bmc.py -c config.toml --selftest

# 真写：把当前占空比 +5 保持 25 秒再还原（会听到转速变化，证明通道真的通了）
sudo python3 amdgpu_fan_ctl_bmc.py -c config.toml --selftest --live --delta 5 --seconds 25
```

`--live` 会先记下 BMC 原来的模式/占空比，试探结束后**在 `finally` 里还原**
（原来是自动 → 还原成自动；原来是手动 N% → 还原成手动 N%）。`--delta -5` 更安静。

实测记录（2026-10-04，笔记本 → MI210 所在服务器，`--delta 5 --seconds 25`）：

```
=== 4) 试探：PWM 30% → 35%，等 25s 看转速 ===
  转速 4960rpm → 5770rpm  （变化 +810rpm）
=== 5) 还原原始状态（自动模式） ===
  已还原
结论：风扇通道有效——PWM 改动确实带动了转速，脚本的 set_fan 能真正影响风扇。
```

转速变化 ≥20 rpm 即判通道有效。判据取"转速"而不是"温度"，理由是 25 秒内 GPU
温度不会因为风扇变了就立刻动，但转速会；温度响应要放到第 3 步的长跑里看。

**GPU 不在本机时（本仓库的实际情况：MI210 在 gpu-server 上）**

温度源只有一个：`rocm-smi -t --json`。差别只在**在哪台机器上执行它**——
**默认在本机跑**；要用远程，用 `--remote user@host`（`-p` 指端口）：

```bash
python3 amdgpu_fan_ctl_bmc.py -c config.toml --status                                  # 默认：本机
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --status # 经 SSH 到服务器
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --selftest
python3 amdgpu_fan_ctl_bmc.py -c config.toml --remote lucas@127.0.0.1 -p 2222 --gpu-local  # --gpu-local 优先，仍在本机跑
```

SSH 只是执行位置，不是第二个温度源——读到的仍然是同一份 rocm-smi 输出。
⚠️ **默认本机就意味着：在笔记本上不带 `--remote` 跑，读到的是笔记本自己的 AMD 卡
（这里是核显 `gfx1103`），而不是服务器上的 MI210。** 想让脚本按 MI210 的结温调风扇，
每次都要给 `--remote`；要长期常驻就把 `remote`/`port` 预置进 `config.toml`
（命令行给的参数优先于配置）。
`[gpu] rocm_smi_match` 是可选的**白名单子串**：留空表示 rocm-smi 报出来的卡全都参与；
填了（如 `"MI210"`）则只有名字含它的卡算数。同一台机器上如果还插着别的 AMD 卡
（核显也算），建议填上，否则会读到那张卡的温度。

**第 1 步：离线看曲线（不连 BMC、不碰风扇）**

```bash
python3 amdgpu_fan_ctl_bmc.py -c config.toml --simulate
python3 amdgpu_fan_ctl_bmc.py -c config.toml --print-curves     # 顺便确认探测到 GPU
```

> **配置文件怎么找**：给了 `-c 路径` 就用它（不存在直接报错）；没给就依次找
> `./config.toml` → 脚本同目录的 `config.toml`；一个都没有才退回内置默认值
> （`mode=observe`、`dry_run=true`，绝不写 BMC）并打一条 WARNING。
> 每次启动都会先打 `配置文件：<路径>（模式=… dry_run=…）`，`--status` 第一行也是它。
> **改了 `config.toml` 却不生效，先看这一行**——多半是程序读的根本不是那个文件。
> 另外注意两个"看起来没生效"的正当行为：`--status`/`--selftest` 本来就是只读；
> `[restore] on_exit=true` 会在进程退出时把 BMC 交还自动模式，所以 `--once`
> 跑完在 BMC 上不留痕迹是正常的。

**第 2 步：observe 模式跑一段时间，只看不写**

```bash
sudo python3 /opt/amdgpu-fan-ctl-bmc/amdgpu_fan_ctl_bmc.py -c /etc/amdgpu-fan-ctl-bmc/config.toml --status
python3 amdgpu_fan_ctl_bmc.py -c config.toml --mode observe --once     # 单次
python3 amdgpu_fan_ctl_bmc.py -c config.toml --mode observe            # 持续
```

**第 3 步：`--live` 正式启用（会写 BMC）**

```bash
sudo python3 /opt/amdgpu-fan-ctl-bmc/amdgpu_fan_ctl_bmc.py -c /etc/amdgpu-fan-ctl-bmc/config.toml --live
sudo systemctl enable --now amdgpu-fan-ctl-bmc
```

**看日志**

```bash
journalctl -u amdgpu-fan-ctl-bmc -f
```

**随时手动兜底回到 BMC 自动**

```bash
sudo python3 /opt/amdgpu-fan-ctl-bmc/amdgpu_fan_ctl_bmc.py -c /etc/amdgpu-fan-ctl-bmc/config.toml --restore
# 或者直接
sudo ../.ipmi/fan.sh auto
```

---

## 6. 调参建议

- 先从 `assist` + `trigger_temp = 78` 开始：MI210 的 junction 阈值是 87/88/90°C，
  78°C 接管留了足够余量，平时又完全安静。
- `idle_pwm` 就是"完全空闲时的转速"。当前机器上 25% ≈ 3840–4560 rpm，
  想更安静可以往下调（HDM 下限是 20）。
- `ramp_down_step` 调小 → 降温更平缓但略吵得久；调大 → 反应快但会有明显转速变化。
- 嫌接管时段太不安静，可以把 `gpu_junction` 曲线整体下移（更早拉高、更早降温），
  代价是平均噪音上升。

---

## 7. 卸载 / 回滚

```bash
sudo systemctl disable --now amdgpu-fan-ctl-bmc
sudo python3 /opt/amdgpu-fan-ctl-bmc/amdgpu_fan_ctl_bmc.py -c /etc/amdgpu-fan-ctl-bmc/config.toml --restore
sudo rm -rf /opt/amdgpu-fan-ctl-bmc /etc/amdgpu-fan-ctl-bmc
sudo rm -f /etc/systemd/system/amdgpu-fan-ctl-bmc.service
sudo systemctl daemon-reload
```

---

## 8. 已知限制

- **BMC 依然不知道 GPU 温度**。本程序只是把 GPU 温度"代管"进风扇决策，
  HDM 界面里的 `GPU_MAX_TEMP` 仍会是 0，也不会产生 GPU 温度告警。
  想从根本上解决需要 H3C 固件支持 GPU sideband（SMBus / MCTP-PLDM）遥测。
  对应地，`--status` **不再把这几路 0 当读数打印**，而是明确写一行
  `BMC 侧 GPU 温度：读不到（...）`，免得看起来像脚本没取到数据；
  哪台机器的 BMC 真能读到，那一路就会照常显示成普通读数。
  同理，BMC 不报阈值的传感器不再显示裸 `NA`：有配置兜底就显示兜底值并标注
  `（配置兜底，BMC 没报）`，实在没有就显示 `NA（BMC 没提供，bmc.sensor_thresholds 里也没兜底）`。
- 曲线名 = 传感器名。rocm-smi 报出来的每个传感器自动变成 `gpu_<名字>`
  （`Temperature (Sensor junction) (C)` → `gpu_junction`，`HBM 0` → `gpu_hbm_0`）；
  没有同名曲线的传感器走 `gpu_default`，**不会被静默丢掉**。
  `gpu_mem` 这条曲线特殊：喂进去的是 `max(memory, 所有 HBM 堆)`。
  多张卡时每个传感器取最热的那张（风扇只能往快了吹）。
- **必须能跑通 `rocm-smi`。** 程序不做 sysfs 兜底：读不到 rocm-smi 输出就是
  fail-safe（连续读失败 → 接管并拉高），而不是悄悄换一个温度源——
  静默换源比直接报错危险得多（比如笔记本核显的 `rocm-smi` 也能返回温度）。
- 空闲封顶（把 GPU 项压到 `idle_pwm`）要求**最热一路 ≤ `idle_max_temp` 且
  GPU 利用率 ≤ `idle_max_gpu_use`**。利用率读不到（返回 -1）时**不当作空闲**。
- `assist` 模式在接管/交还的瞬间会有一档转速变化，属正常现象。
- **HDM 的并发会话数很小。** 脚本每次运行都会在 BMC 上占一个会话，所以每个
  退出路径都会 `DELETE /api/session` 主动登出（`atexit` 兜底）。如果曾经用旧版本
  连续跑过几次、把会话池占满，登录会返回 `HTTP 401 {"code": 15000}`——
  这不是密码错，等 BMC 空闲超时回收即可（脚本会把这个区别打印出来）。
  同一个 BMC 上如果还有网页端 / 其它工具开着会话，也会占用同一个额度。

---

## 9. 这套东西有多"通用"

**通用的是骨架和决策逻辑**，换任何一家 BMC / 任何一块卡都不变：

1. 轮询温度 → 2. 每条曲线取值 → 3. 取最大值 → 4. 迟滞 + 死区 + 最小写间隔 → 5. 下发 PWM；
   外加 fail-safe（读不到 GPU 温度就拉高）、退出还原、`--restore` 兜底。
这部分是从 asrock-rack-fan-control 那个项目里真正值得抄的，本文档第 1、3 节讲的就是它。

**不通用的是两个 IO 端点**，换机器必须替换：

| 接缝 | 现在是什么 | 换厂商要改哪里 |
| --- | --- | --- |
| 控风扇 | H3C HDM REST `PUT /api/system_inventory/set_fan` | `class Bmc` 的 `fan_info()` / `set_fan()` / `sensors()` |
| 读温度 | `rocm-smi -t --json`（默认本机，`--remote user@host -p <端口>` 换成经 SSH 到别的机器） | `make_gpu_reader()` 换个命令即可；换 NVIDIA 就换 `nvidia-smi` |
| 临界阈值 | `GET /api/sensors` 的 `higher_critical_threshold`，缺的用 `bmc.sensor_thresholds` 兜底 | 若 BMC 不暴露，就在 `bmc.sensor_thresholds` 里写死 |

也就是说：**要把它移植到 Dell iDRAC / Supermicro 上，工作量集中在 `class Bmc` 那 4 个方法，
控制逻辑一行都不用动。** 反过来，如果你拿来的是以 `nvidia-smi` + 私有 IPMI raw 写成的脚本，
换到 H3C + AMD 上通信层和探测层都要重写——这正是"以 asrock 当骨架"省不下来的部分。
