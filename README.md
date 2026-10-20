# amdgpu-fan-ctl

用 `rocm-smi` 读到的 AMD GPU 温度，通过本机 `ipmitool` 控制泰安 S8030 机箱风扇的闭环控制器。

当前拓扑（程序、GPU、BMC 在同一台机器上）：

| 项目 | 值 |
| --- | --- |
| GPU | AMD Instinct MI210（`gfx90a`），温度来自 `rocm-smi -t --json` |
| 主板 | 泰安 S8030，BMC 固件 6.02 |
| 受控风扇 | `SYS_FAN4` = PWM 通道 **5** |
| 控制通道 | 本机 `/dev/ipmi0`，不依赖 BMC 网络 |

## 风扇控制命令

泰安 OEM 原始命令（已实测）：

```bash
# 设置 PWM（0-100）
ipmitool raw 0x2e 0x44 0xfd 0x19 0x00 0x05 0x01 0x64   # PWM5 = 100%
ipmitool raw 0x2e 0x44 0xfd 0x19 0x00 0x05 0x01 0x3c   # PWM5 = 60%

# 读回
ipmitool raw 0x2e 0x45 0xfd 0x19 0x00 0x05
```

S8030 的 PWM 通道：`0=CPU_FAN`、`2=SYS_FAN_1`、`3=SYS_FAN_2`、`4=SYS_FAN_3`、`5=SYS_FAN_4`。

## 两种模式

| 模式 | 行为 |
| --- | --- |
| `observe` | 只读，只打印决策，不写 PWM |
| `control` | 一直按曲线控制（推荐） |

## 安全设计

1. **GPU 任一路传感器瞬时值 ≥ 60°C → 立即 100%**，不受温度平滑延迟影响。
2. 接管期间同时监控 CPU / 主板排风 / 进风温度，各自有曲线，最终取所有曲线的最大值。
3. BMC 传感器的临界阈值取每个传感器自带的 `higher_critical_threshold`，越线直接拉满。
4. 升温不限速，降温按 `ramp_down_step` 限速。
5. 连续 3 次读不到 GPU 温度 → fail-safe 拉高到 `fan.fail_safe_pwm`。
6. 写 PWM 失败会重试；连续失败超过 `max_consecutive_errors` 则退出，交由 systemd 重启。
7. 启动时把原始 PWM 落盘到 `state_dir`，退出 / SIGTERM 时恢复；`--restore` 可手动兜底。
8. 死区 `write_deadband` + 最小写入间隔 `min_write_interval`，避免高频写 BMC。
9. `dry_run = true` 时绝不写 PWM。

## 依赖

- Python 3.11+
- `/opt/rocm/bin/rocm-smi`
- `/usr/bin/ipmitool`；服务通过包内 udev 规则以 `amdgpu-fan-ctl` 组访问 `/dev/ipmi0`，不需要 root

## 使用

```bash
python3 -m unittest test_amdgpu_fan_ctl                 # 离线单元测试
python3 amdgpu_fan_ctl.py -c config.toml --simulate      # 离线看曲线
python3 amdgpu_fan_ctl.py -c config.toml --print-curves  # 确认 rocm-smi 和传感器
sudo python3 amdgpu_fan_ctl.py -c config.toml --status   # 风扇 + GPU + BMC 传感器
sudo python3 amdgpu_fan_ctl.py -c config.toml --selftest # 只读自检
sudo python3 amdgpu_fan_ctl.py -c config.toml --selftest --live --delta -20 --seconds 15
sudo python3 amdgpu_fan_ctl.py -c config.toml --live     # 正式控制
sudo python3 amdgpu_fan_ctl.py -c config.toml --restore  # 恢复快照 PWM
```

配置文件查找顺序：`-c 路径` → `./config.toml` → 脚本同目录的 `config.toml`。

安装后调试时请用 `sudo -u amdgpu-fan-ctl` 运行会写快照的命令（`--selftest --live`、`--live`、
`--restore`）；直接用 root 运行会让 `state_dir` 和快照文件变成 root 属主，服务用户之后无法覆盖。

## 安装

AUR 包名：`amdgpu-fan-ctl-tyan-s8030gm2ne`

```bash
yay -S amdgpu-fan-ctl-tyan-s8030gm2ne
# 或
git clone https://aur.archlinux.org/amdgpu-fan-ctl-tyan-s8030gm2ne.git
cd amdgpu-fan-ctl-tyan-s8030gm2ne && makepkg -si
```

安装后：

```bash
# 新装 / 升级后把 udev 规则应用到已存在的 /dev/ipmi0（重启也行）
sudo udevadm trigger --subsystem-match=ipmi

sudoedit /etc/amdgpu-fan-ctl/config.toml   # 确认 pwm_id / 曲线
sudo -u amdgpu-fan-ctl amdgpu-fan-ctl -c /etc/amdgpu-fan-ctl/config.toml --status
sudo systemctl enable --now amdgpu-fan-ctl
journalctl -u amdgpu-fan-ctl -f
```

服务以专用系统用户 `amdgpu-fan-ctl`（无登录 shell）运行：

- `/usr/lib/sysusers.d/amdgpu-fan-ctl.conf` 在安装时自动创建用户和同名组。
- `/usr/lib/udev/rules.d/90-amdgpu-fan-ctl.rules` 把 `/dev/ipmi0` 设为
  `amdgpu-fan-ctl:amdgpu-fan-ctl 0660`，避免用 root 跑整个服务。
- 服务单元额外加入 `render` / `video` 组，便于读取 GPU 传感器。

包内路径：

| 内容 | 路径 |
| --- | --- |
| 命令 | `/usr/bin/amdgpu-fan-ctl` |
| 程序 | `/usr/lib/amdgpu-fan-ctl/amdgpu_fan_ctl.py` |
| 配置 | `/etc/amdgpu-fan-ctl/config.toml` |
| 状态目录 | `/var/lib/amdgpu-fan-ctl` |
| systemd unit | `/usr/lib/systemd/system/amdgpu-fan-ctl.service` |
| sysusers | `/usr/lib/sysusers.d/amdgpu-fan-ctl.conf` |
| udev 规则 | `/usr/lib/udev/rules.d/90-amdgpu-fan-ctl.rules` |
| 许可证 | `/usr/share/licenses/amdgpu-fan-ctl/LICENSE` |
| 文档 | `/usr/share/doc/amdgpu-fan-ctl/` |

## 调参

- `[curves.*]` 是分段线性曲线，最终 PWM 取所有曲线中的最大值；`gpu.critical_temp` 是独立的硬阈值（默认 60°C）。
- GPU 传感器名自动展开为 `gpu_<名字>`；没有同名曲线的走 `gpu_default`。
- `gpu_mem` 吃的是 `max(memory, 所有 HBM 堆)`。
- `idle_pwm` 是 GPU 空闲时的封顶值，要求最热一路 ≤ `idle_max_temp` 且利用率 ≤ `idle_max_gpu_use`。
- `fail_safe_pwm` 是连续读不到 GPU 温度时的兜底 PWM。
- `[bmc] cpu_sensors / mb_sensors / inlet_sensors / critical_sensors` 是传感器名映射，换主板只改这里。

## 已知限制

- 主板无法从硬件读取 GPU 温度，SYS_FAN4 没有硬件自动控制，转速完全由本程序写 PWM。
- 本机 BMC 的 `ipmitool sensor` / `ipmitool sdr` 单次约 5–6 秒，因此实际控制周期约 6 秒。
- S8030 没有软件层的“自动模式”开关：退出/`--restore` 写回快照里的原始 PWM；没有快照时写回 `fan.max_pwm`。AC 掉电或 `mc reset cold` 后由 BIOS 默认策略接管。
- BMC 读不到 MI210 的 GPU 温度，本程序只是把 GPU 温度代管进风扇决策。
