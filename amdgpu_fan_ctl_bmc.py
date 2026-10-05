#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
amdgpu-fan-ctl-bmc —— 用 rocm-smi 读到的 AMD GPU 温度驱动 H3C HDM 机箱风扇的闭环控制器

背景
    H3C HDM（AMI MegaRAC 系）的风扇自动温控只认 BMC 自己能读到的传感器。
    在 MI210 这类卡上 BMC 拿不到 GPU 遥测：
        GPU_MAX_TEMP / GPU_HBM_TEMP / SLOT03_GPU_TEMP 全为 "No Reading"
    所以 GPU 再热，BMC 的自动曲线也不会理它。本程序把这个缺口补上。

温度源：只有 rocm-smi
    `rocm-smi -t --json` 是 ROCm 自己维护的接口，读数最全
    （edge / junction / memory / HBM 0..3 ...），而且不用去猜各家 sysfs 里
    hwmon 标签怎么命名。本程序**只**认这一种温度源。

    传感器名不写死：`Temperature (Sensor XXX) (C)` 会被自动展开成 `xxx`
    （小写、非字母数字转下划线），所以换一张卡、ROCm 多报一个传感器
    （HBM 4、GFX、SOC...）都能自动跟上，不用改代码。没有同名曲线的传感器
    走 `gpu_default` 曲线，不会因为"没配曲线"就被静默忽略。

    本程序不绑定任何型号：不查 PCI ID、不比对型号名。卡的身份只用来显示
    （`--status` / `--selftest` 会打印 card0=AMD Instinct MI210 (gfx90a)），
    确实需要白名单时再用可选的 `gpu.rocm_smi_match`。

    默认在本机执行 rocm-smi。脚本不一定要跑在插着卡的那台机器上：
    给 `--remote user@host`（`-p` 指端口，例如 `--remote lucas@127.0.0.1 -p 2222`）
    就经 SSH 到那台机器上执行同一条命令（同一份 JSON，只是换了个执行位置），
    不给就在本机跑。`--gpu-local` 可以强制忽略远端设置。

三种工作模式
    observe  只读、只打印决策，一个字节都不写 BMC（最安全的观察模式）
    assist   平时把风扇完全交回 BMC 自动；只在 GPU 变热时临时接管，冷下来再交还
    control  一直由本程序接管（BMC 处于手动模式，本程序决定 PWM）

安全设计（这是和网上那些脚本最大的区别）
    1. 接管期间 BMC 自己的曲线是停摆的 -> 所以本程序**同时**监控 CPU/主板/进风温度，
       各自有独立曲线，最终取所有曲线的最大值。只盯 GPU 的脚本会让 CPU 失控。
    2. 临界阈值优先取 BMC 自己的 /api/sensors 里的 higher_critical_threshold；
       BMC 没报的（H3C 上 OCP_INLET_TEMP 就是这样）退回配置的
       `bmc.sensor_thresholds`。任何被监控传感器越线直接拉满。
    3. 升温不限速（安全优先），降温按 ramp_down_step 限速（降噪）。
    4. 读不到 GPU 温度 -> fail-safe 拉高，而不是维持低转速。
    5. BMC 写失败 -> 重试；连续失败超过阈值则退出，交给 systemd 重启。
    6. 退出/崩溃时恢复接管前的 BMC 模式（快照落盘，--restore 可手动恢复）。
    7. 只在需要时写 BMC（死区 write_deadband + 最小间隔 min_write_interval），
       避免高频写 BMC 配置。

依赖
    Python 3.11+ 标准库 + 一个能用的 rocm-smi。
    不需要 ipmitool、不需要第三方 pip 包、不需要直接读 sysfs。
"""

from __future__ import annotations

import argparse
import atexit
import http.cookiejar
import json
import logging
import os
import re
import shlex
import signal
import ssl
import subprocess
import sys
import tempfile
import time
import tomllib
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass, field
from pathlib import Path

LOG = logging.getLogger("amdgpu-fan-ctl-bmc")

# BMC 传感器名 -> 曲线名的固定映射（这些名字是 H3C HDM /api/sensors 里的实际名字）
BMC_CPU_SENSORS = ("CPU1_TEMP", "CPU2_TEMP")
BMC_MB_SENSORS = ("MB_TEMP",)
BMC_INLET_SENSORS = ("INPUT_TEMP_01", "INPUT_TEMP_02", "OCP_INLET_TEMP")
# H3C HDM 上这些 GPU 温度传感器永远读 0：BMC 要读 GPU 温度得要有 GPU sideband
# （SMBus / MCTP-PLDM）支持，这台机器没有。留着只是为了发现"哪天 BMC 真的能读了"。
BMC_GPU_SENSORS = ("GPU_MAX_TEMP", "GPU_HBM_TEMP", "SLOT00_GPU_TEMP", "SLOT03_GPU_TEMP")


def sensor_threshold(sensors: dict, name: str, fallbacks: dict) -> tuple[float | None, bool]:
    """取某传感器的临界阈值，返回 (阈值, 是否来自配置兜底)。

    BMC 自己报了 higher_critical_threshold 就用它；没报（H3C 上 OCP_INLET_TEMP
    就是这种情况，直接给 NA）就退回配置里的兜底值。
    """
    entry = sensors.get(name) or {}
    thr = entry.get("higher_critical_threshold")
    if isinstance(thr, (int, float)):
        return float(thr), False
    fallback = (fallbacks or {}).get(name)
    if isinstance(fallback, (int, float)):
        return float(fallback), True
    return None, False


# --------------------------------------------------------------------------- #
# 曲线
# --------------------------------------------------------------------------- #
@dataclass
class Curve:
    """分段线性风扇曲线。points = [[温度°C, PWM%], ...]"""

    name: str
    points: list[tuple[float, float]]

    def __post_init__(self) -> None:
        self.points = sorted((float(t), float(p)) for t, p in self.points)
        if len(self.points) < 1:
            raise ValueError(f"曲线 {self.name} 至少要有一个点")

    def eval(self, temp: float) -> float:
        pts = self.points
        if temp <= pts[0][0]:
            return pts[0][1]
        if temp >= pts[-1][0]:
            return pts[-1][1]
        for (t0, p0), (t1, p1) in zip(pts, pts[1:]):
            if t0 <= temp <= t1:
                if t1 == t0:
                    return p1
                ratio = (temp - t0) / (t1 - t0)
                return p0 + ratio * (p1 - p0)
        return pts[-1][1]

    def describe(self) -> str:
        return " ".join(f"{t:g}°C→{p:g}%" for t, p in self.points)


# --------------------------------------------------------------------------- #
# 配置
# --------------------------------------------------------------------------- #
DEFAULTS: dict = {
    "general": {
        "mode": "observe",
        "dry_run": True,
        "poll_interval": 2.0,
        "log_level": "info",
        "state_dir": "/var/lib/amdgpu-fan-ctl-bmc",
        "metrics_file": "",
    },
    "gpu": {
        # rocm-smi 的唯一入口。一定要写绝对路径：它只被 /etc/profile.d/rocm.sh
        # 加进**登录 shell** 的 PATH，systemd 和 `ssh host 'cmd'` 都取不到。
        "rocm_smi": "/opt/rocm/bin/rocm-smi",
        # 可选白名单：只有型号串里含这个子串的卡才参与。留空 = 本机所有 AMD 卡都参与
        # （多卡时每个标签取最热的那张）。故意留空，不绑定具体型号。
        "rocm_smi_match": "",
        # 默认在本机跑 rocm-smi。要远程就命令行给 --remote user@host（-p 指端口），
        # 或在下面预置 remote/port —— 命令行优先。
        "remote": "",
        "port": 0,
        # 传给 ssh 的额外选项（放在目标主机之前）。默认带 -F /dev/null 是有原因的：
        # 本机 /etc/ssh/ssh_config.d/ 下有个属主被搞坏的文件，不加它 ssh 会直接报
        # "Bad owner or permissions"，连不上任何主机。副作用：~/.ssh/config 里的
        # Host 别名/跳板机不再生效——要用别名就把 -F /dev/null 从这里去掉。
        "ssh_options": [
            "-F", "/dev/null",
            "-o", "BatchMode=yes",
            "-o", "ConnectTimeout=10",
            "-o", "StrictHostKeyChecking=accept-new",
        ],
        # 可选 -i 私钥路径（支持 ~ 展开）。留空 = 交给 ssh 自己找默认私钥
        "ssh_identity": "",
        "timeout": 20.0,
        "smoothing": 0.35,
        "critical_temp": 90.0,
        # 空闲判定的温度上限，比的是"最热的那一路 GPU 传感器"
        "idle_max_temp": 55.0,
        # 空闲判定还要求 GPU 利用率 <= 这个值。设成 100 就退化成"只看温度"
        "idle_max_gpu_use": 0.0,
        "idle_pwm": 22.0,
    },
    "bmc": {
        "host": "192.168.1.56",
        "username": "admin",
        "password_env": "IPMI_PASSWORD",
        "password_cmd": [],
        "verify_tls": False,
        "timeout": 15.0,
        "min_write_interval": 5.0,
        "write_deadband": 3.0,
        "critical_sensors": ["CPU1_TEMP", "CPU2_TEMP", "MB_TEMP", "OCP_INLET_TEMP"],
        # BMC 不报 higher_critical_threshold 的传感器（目前只有 OCP_INLET_TEMP 是这样），
        # 用这里的兜底值。BMC 只要自己报了阈值，一律以 BMC 为准。
        "sensor_thresholds": {"OCP_INLET_TEMP": 54.0},
        "max_consecutive_errors": 8,
    },
    "fan": {"min_pwm": 20.0, "max_pwm": 100.0, "ramp_down_step": 5.0},
    "assist": {
        "trigger_temp": 78.0,
        "trigger_pwm": 45.0,
        "release_temp": 62.0,
        "release_cycles": 10,
    },
    "restore": {"on_exit": True},
}

DEFAULT_CURVES: dict[str, list[list[float]]] = {
    # 曲线名 = 温度读数的名字（gpu_<传感器>、cpu_max、mb、inlet）
    "gpu_junction": [[40, 20], [55, 25], [65, 35], [75, 50], [80, 65], [85, 80], [88, 100]],
    "gpu_edge": [[45, 20], [65, 30], [78, 50], [88, 100]],
    # 显存域：喂进来的是 max(mem, HBM 0..N)，所以一张曲线管住所有显存堆
    "gpu_mem": [[45, 20], [65, 30], [80, 45], [90, 70], [95, 100]],
    # 兜底：rocm-smi 报出来但没有同名曲线的传感器走这条，免得被静默忽略
    "gpu_default": [[50, 20], [70, 35], [85, 70], [95, 100]],
    "cpu_max": [[45, 20], [60, 28], [70, 38], [80, 55], [90, 80], [97, 100]],
    "mb": [[30, 20], [45, 30], [55, 50], [62, 100]],
    "inlet": [[25, 20], [32, 35], [38, 60], [45, 100]],
}


def deep_merge(base: dict, override: dict) -> dict:
    out = dict(base)
    for key, value in override.items():
        if isinstance(value, dict) and isinstance(out.get(key), dict):
            out[key] = deep_merge(out[key], value)
        else:
            out[key] = value
    return out


def curve_points(value) -> list:
    """兼容两种写法：points = [[40,20],...]  或  [curves.foo] 下的 points 键"""
    if isinstance(value, dict):
        value = value.get("points")
    if not value:
        raise ValueError("曲线缺少 points 定义")
    return value


class Config:
    def __init__(self, raw: dict, path: str = ""):
        self.raw = deep_merge(DEFAULTS, raw)
        # 实际读的是哪个文件。空字符串 = 一个文件都没读，全用内置默认值
        # （mode=observe、dry_run=true）。这个字段存在的唯一目的就是能把它打出来：
        # 否则"改了 config.toml 却没生效"会看起来毫无头绪。
        self.path = str(path or "")
        self.curves: dict[str, Curve] = {}
        for name, pts in DEFAULT_CURVES.items():
            self.curves[name] = Curve(name, curve_points(self.raw.get("curves", {}).get(name, pts)))
        for name, value in (self.raw.get("curves") or {}).items():
            if name not in self.curves:
                self.curves[name] = Curve(name, curve_points(value))

    def __getitem__(self, key: str) -> dict:
        return self.raw[key]

    @classmethod
    def load(cls, path: str | None) -> "Config":
        if not path:
            return cls({}, path="")
        text = Path(path).read_text(encoding="utf-8")
        if path.endswith(".json"):
            return cls(json.loads(text), path=path)
        return cls(tomllib.loads(text), path=path)


def resolve_config_path(explicit: str | None = None) -> str:
    """决定读哪个配置文件，返回 "" 表示一个都没找到、将使用内置默认值。

    显式给了 `-c` 就用它（文件不存在时 `Config.load` 会抛 OSError，这是有意的）。
    没给就依次找：`./config.toml` → 脚本自己所在目录的 `config.toml`。

    之所以要这层兜底：以前 `-c` 没有默认值，`Config.load(None)` 直接返回内置默认值
    （mode=observe、dry_run=true），于是 `python3 amdgpu_fan_ctl_bmc.py` 会**静默忽略**
    同目录下改得好好的 config.toml —— 表现就是"配置改了却不生效"。
    """
    if explicit:
        return explicit
    for candidate in (Path("config.toml"), Path(__file__).resolve().parent / "config.toml"):
        if candidate.is_file():
            return str(candidate)
    return ""


# --------------------------------------------------------------------------- #
# GPU 温度：只走 rocm-smi
# --------------------------------------------------------------------------- #
class GpuError(RuntimeError):
    """rocm-smi 相关的错误。"""


# `Temperature (Sensor XXX) (C)` 里的名字 -> 内部标签
_TEMP_KEY_RE = re.compile(r"^Temperature \(Sensor (.+?)\) \(C\)$")
_LABEL_ALIASES = {"memory": "mem"}   # rocm-smi 叫 memory，曲线里习惯叫 mem


def temp_label(key: str) -> str | None:
    """`Temperature (Sensor HBM 0) (C)` -> `hbm0`；不是温度键返回 None。

    故意用正则 + 别名，而不是写死的映射表：换一张卡、或 ROCm 多报一个传感器
    （HBM 4、GFX、SOC...）都能自动跟上，不用改代码。
    """
    match = _TEMP_KEY_RE.match(str(key).strip())
    if not match:
        return None
    name = re.sub(r"[^a-z0-9]+", "_", match.group(1).strip().lower()).strip("_")
    if not name:
        return None
    return _LABEL_ALIASES.get(name, name)


# --------------------------------------------------------------------------- #
# rocm-smi 读取器
# --------------------------------------------------------------------------- #
class RocmSmiGpuReader:
    """用 `rocm-smi` 读 GPU 温度、利用率和型号。这是本程序唯一的 GPU 数据来源。

    三条命令，走同一条通道（本机直接跑，或经 SSH 到插着卡的那台机器上跑）：
        rocm-smi -t --json                  温度（唯一温度源）
        rocm-smi --showuse --json           GPU 利用率（判断"是不是真闲着"）
        rocm-smi --showproductname --json   型号（只用于显示 / 可选白名单）

    多卡时每个标签取最热的那张 —— 风扇只能往快了吹，取最热是安全方向。
    """

    def __init__(
        self,
        binary: str,
        smoothing: float,
        timeout: float = 20.0,
        match: str = "",
        ssh_argv: list[str] | None = None,
    ):
        self.binary = str(binary)
        self.alpha = min(max(smoothing, 0.0), 1.0)
        self.timeout = float(timeout)
        self.match = str(match or "")
        self.ssh = [str(a) for a in (ssh_argv or [])]
        self.smoothed: dict[tuple[str, str], float] = {}   # (card, 标签) -> 平滑值
        self.last_error = ""
        self._cards: dict[str, str] = {}

    # -- 执行 --------------------------------------------------------------- #
    @property
    def via_ssh(self) -> bool:
        return bool(self.ssh)

    def _argv(self, args: list[str]) -> list[str]:
        cmd = [self.binary, *args, "--json"]
        if self.ssh:
            # 整条远端命令作为**一个** argv 交给 ssh；每段单独 quote，避免引号地狱
            return [*self.ssh, " ".join(shlex.quote(part) for part in cmd)]
        return cmd

    def _run(self, *args: str) -> dict:
        cmd = self._argv(list(args))
        where = "SSH " if self.ssh else ""
        try:
            proc = subprocess.run(cmd, capture_output=True, text=True, timeout=self.timeout)
        except FileNotFoundError as exc:
            raise GpuError(f"找不到 {cmd[0]}") from exc
        except subprocess.TimeoutExpired as exc:
            raise GpuError(f"{where}rocm-smi 超时(>{self.timeout:.0f}s)") from exc
        text = proc.stdout or ""
        start = text.find("{")
        if start < 0:
            detail = (proc.stderr or text).strip().replace("\n", " ")[:200]
            raise GpuError(f"{where}rocm-smi 没返回 JSON(rc={proc.returncode}): {detail}")
        try:
            return json.loads(text[start:])
        except json.JSONDecodeError as exc:
            raise GpuError(f"{where}rocm-smi 的 JSON 解析失败: {exc}") from exc

    # -- 卡的身份（只用于显示 / 可选白名单） -------------------------------- #
    def cards(self) -> dict[str, str]:
        """cardN -> 'AMD Instinct MI210 (gfx90a)'。读不到返回 {}。"""
        try:
            data = self._run("--showproductname")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            LOG.warning("rocm-smi 读型号失败：%s", exc)
            return {}
        out: dict[str, str] = {}
        for card, info in data.items():
            if not isinstance(info, dict):
                continue
            series = str(info.get("Card Series") or "?")
            gfx = str(info.get("GFX Version") or "")
            out[str(card)] = f"{series} ({gfx})" if gfx else series
        return out

    def known_cards(self) -> dict[str, str]:
        """缓存一份型号表（显卡不会热插拔）。没读到就下次再试。"""
        if not self._cards:
            self._cards = self.cards()
        return self._cards

    def _allowed(self) -> set[str] | None:
        """通过 rocm_smi_match 白名单的 cardN 集合；None = 没配白名单，全都用。"""
        if not self.match:
            return None
        needle = self.match.lower()
        return {c for c, name in self.known_cards().items() if needle in name.lower()}

    # -- 温度（唯一温度源） -------------------------------------------------- #
    def read(self) -> dict[str, float]:
        """返回 {'junction':47.0,'edge':44.0,'mem':44.0,'hbm_0':...}（已指数平滑）。"""
        try:
            data = self._run("-t")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            LOG.warning("rocm-smi 读温度失败：%s", exc)
            return {}
        keep = self._allowed()
        if keep is not None and not keep:
            self.last_error = (
                f"没有一张卡的名字含 '{self.match}'"
                f"（rocm-smi 看到的卡：{self.known_cards() or '读不到型号'}）"
            )
            LOG.warning("rocm_smi_match 白名单没命中：%s", self.last_error)
            return {}
        out: dict[str, float] = {}
        for card, temps in data.items():
            if keep is not None and str(card) not in keep:
                continue
            if not isinstance(temps, dict):
                continue
            for key, val in temps.items():
                label = temp_label(key)
                if label is None:
                    continue
                try:
                    raw = float(str(val).strip())
                except ValueError:
                    continue
                # 平滑状态按 (卡, 标签) 分开存，多卡互不污染
                slot = (str(card), label)
                prev = self.smoothed.get(slot)
                value = raw if prev is None else prev + self.alpha * (raw - prev)
                self.smoothed[slot] = value
                value = round(value, 1)
                out[label] = max(out.get(label, value), value)
        return out

    def raw_labels(self) -> list[str]:
        """rocm-smi 报出来的所有温度标签（--print-curves / describe 用）。"""
        try:
            data = self._run("-t")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            return [f"错误：{exc}"]
        labels = []
        for temps in data.values():
            if isinstance(temps, dict):
                labels.extend(lbl for lbl in (temp_label(k) for k in temps) if lbl)
        return sorted(set(labels))

    # -- 利用率 ------------------------------------------------------------- #
    def gpu_use(self) -> float:
        """所有入选卡的 GPU 利用率最大值（%）。-1 = 读不到，**不要**据此判断空闲。"""
        try:
            data = self._run("--showuse")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            LOG.debug("rocm-smi 读利用率失败：%s", exc)
            return -1.0
        keep = self._allowed()
        best = -1.0
        for card, info in data.items():
            if keep is not None and str(card) not in keep:
                continue
            if not isinstance(info, dict):
                continue
            try:
                best = max(best, float(str(info.get("GPU use (%)", "")).strip()))
            except ValueError:
                continue
        return best

    # -- 状态 --------------------------------------------------------------- #
    def found(self) -> bool:
        return bool(self.read())

    def describe(self) -> str:
        where = f"SSH <{' '.join(self.ssh)}>" if self.ssh else "本机"
        cards = self.known_cards()
        identity = "，".join(f"{c}={n}" for c, n in sorted(cards.items())) or "（读不到型号）"
        guard = (
            f"  白名单='{self.match}'" if self.match
            else "  白名单为空：rocm-smi 报出来的卡全都参与（看上面的卡名）"
        )
        tail = f"  [最后错误：{self.last_error}]" if self.last_error else ""
        return (
            f"rocm-smi {where}（{self.binary}）"
            f"\n  卡：{identity}{guard}"
            f"\n  传感器：{self.raw_labels()}{tail}"
        )


def build_ssh_argv(
    cfg: Config,
    remote: str = "",
    port: int = 0,
    force_local: bool = False,
) -> list[str]:
    """拼出"到远端跑 rocm-smi"用的 ssh argv（不含要执行的命令）。

    默认返回 []（= 本机执行）。目标地址来自 `--remote user@host`，命令行没给才回落到
    配置的 `gpu.remote`；端口同理，`-p` 优先于 `gpu.port`（0 = 不提 -p，走 ssh 默认 22）。
    """
    g = dict(cfg.raw.get("gpu") or {})
    target = (remote or "").strip() or str(g.get("remote") or "").strip()
    if force_local or not target:
        return []
    argv = ["ssh"]
    argv += [str(o) for o in (g.get("ssh_options") or [])]
    identity = str(g.get("ssh_identity") or "").strip()
    if identity:
        argv += ["-i", os.path.expanduser(identity)]
    p = int(port or 0) or int(g.get("port") or 0)
    if p:
        argv += ["-p", str(p)]
    argv.append(target)
    return argv


def make_gpu_reader(
    cfg: Config,
    force_local: bool = False,
    remote: str = "",
    port: int = 0,
) -> RocmSmiGpuReader:
    """按配置造一个 rocm-smi 读取器。

    温度源没有可选项——就只有 rocm-smi。这里决定的只是**在哪台机器上执行它**：
    默认本机；给 `--remote user@host`（或配置里写了 `gpu.remote`）就经 SSH 到那台机器。
    `--gpu-local` 可以强制忽略远端设置（在插着卡的那台机器上直接跑同一份配置时用）。
    """
    g = dict(cfg.raw.get("gpu") or {})
    return RocmSmiGpuReader(
        binary=str(g.get("rocm_smi", "/opt/rocm/bin/rocm-smi")),
        smoothing=float(g.get("smoothing", 0.35)),
        timeout=float(g.get("timeout", 20.0)),
        match=str(g.get("rocm_smi_match", "") or ""),
        ssh_argv=build_ssh_argv(cfg, remote=remote, port=port, force_local=force_local),
    )


# --------------------------------------------------------------------------- #
# H3C HDM REST 客户端
# --------------------------------------------------------------------------- #
class BmcError(RuntimeError):
    pass


class BmcClient:
    """H3C HDM REST 客户端。凭据只从环境变量或外部命令取，绝不落进配置/日志。"""

    def __init__(self, cfg: dict):
        self.host = cfg["host"]
        self.user = cfg["username"]
        self.timeout = float(cfg["timeout"])
        self.base = f"https://{self.host}"
        self._csrf = ""
        self._password = self._resolve_password(cfg)
        ctx = ssl.create_default_context()
        if not cfg.get("verify_tls", False):
            ctx.check_hostname = False
            ctx.verify_mode = ssl.CERT_NONE
        self._jar = http.cookiejar.CookieJar()
        self._opener = urllib.request.build_opener(
            urllib.request.HTTPCookieProcessor(self._jar),
            urllib.request.HTTPSHandler(context=ctx),
        )

    @staticmethod
    def _resolve_password(cfg: dict) -> str:
        env_name = cfg.get("password_env") or ""
        if env_name and os.environ.get(env_name):
            return os.environ[env_name]
        cmd = cfg.get("password_cmd") or []
        if cmd:
            try:
                res = subprocess.run(cmd, capture_output=True, text=True, timeout=20, check=True)
                return res.stdout.rstrip("\n")
            except Exception as exc:  # noqa: BLE001
                raise BmcError(f"password_cmd 执行失败: {exc}") from exc
        raise BmcError(
            f"没有 HDM 密码：请设置环境变量 {env_name or 'IPMI_PASSWORD'}，或在 [bmc].password_cmd 里指定取密码的命令"
        )

    # -- 底层请求 ---------------------------------------------------------- #
    def _open(self, method: str, path: str, body: dict | None) -> str:
        data = json.dumps(body).encode() if body is not None else None
        headers = {
            "X-Requested-With": "XMLHttpRequest",
            "Referer": self.base + "/",
            "Origin": self.base,
            "Accept": "application/json",
        }
        if self._csrf:
            headers["X-CSRFTOKEN"] = self._csrf
        if data is not None:
            headers["Content-Type"] = "application/json"
        req = urllib.request.Request(self.base + path, data=data, headers=headers, method=method)
        try:
            with self._opener.open(req, timeout=self.timeout) as resp:
                return resp.read().decode("utf-8", "replace")
        except urllib.error.HTTPError as exc:
            return exc.read().decode("utf-8", "replace")
        except OSError as exc:
            raise BmcError(f"BMC 连接失败 {self.host}: {exc}") from exc

    def _login(self) -> None:
        import base64

        payload = urllib.parse.urlencode(
            {
                "username": base64.b64encode(self.user.encode()).decode(),
                "password": base64.b64encode(self._password.encode()).decode(),
            }
        ).encode()
        req = urllib.request.Request(
            self.base + "/api/session",
            data=payload,
            headers={
                "X-Requested-With": "XMLHttpRequest",
                "Referer": self.base + "/",
                "Origin": self.base,
                "Content-Type": "application/x-www-form-urlencoded",
            },
            method="POST",
        )
        try:
            with self._opener.open(req, timeout=self.timeout) as resp:
                body = resp.read().decode("utf-8", "replace")
        except urllib.error.HTTPError as exc:
            detail = exc.read().decode("utf-8", "replace").strip()
            hint = ""
            # H3C HDM: code 15000 = 会话数已满（不是密码错），1009 = 密码/用户名错
            if "15000" in detail:
                hint = (
                    "  ← BMC 会话数已满：说明有别的（很可能是之前没登出的）会话还占着，"
                    "等 BMC 空闲超时自动回收、或在 HDM 网页里注销其它会话后重试"
                )
            raise BmcError(
                f"HDM 登录失败 {self.host}: HTTP {exc.code} {detail}{hint}"
            ) from exc
        except OSError as exc:
            raise BmcError(f"HDM 登录失败 {self.host}: {exc}") from exc
        try:
            self._csrf = json.loads(body).get("CSRFToken", "")
        except json.JSONDecodeError:
            self._csrf = ""
        LOG.debug("HDM 会话建立，csrf=%s", "有" if self._csrf else "无")

    def logout(self) -> None:
        """主动结束 HDM 会话。

        不登出的话每次运行都会在 BMC 上留一个会话，直到空闲超时才回收；
        H3C HDM 的并发会话数很小（实测第 5 次登录就 401 Unauthorized），
        连续手动跑几次 --status/--selftest 就会把自己挡在门外。
        """
        if not self._csrf:
            return
        try:
            self._open("DELETE", "/api/session", None)
        except Exception as exc:  # noqa: BLE001 - 登出失败不该影响主流程的退出码
            LOG.debug("登出 HDM 失败（忽略）: %s", exc)
        finally:
            self._csrf = ""

    @staticmethod
    def _is_auth_failure(body: str) -> bool:
        return "Invalid Authentication" in body or '"cc": 7' in body or '"cc":7' in body

    def request(self, method: str, path: str, body: dict | None = None) -> str:
        if not self._csrf:
            self._login()
        out = self._open(method, path, body)
        if self._is_auth_failure(out):
            LOG.debug("HDM 会话失效，重新登录")
            self._login()
            out = self._open(method, path, body)
        return out

    # -- 业务接口 ---------------------------------------------------------- #
    def fan_info(self) -> dict:
        body = self.request("GET", "/api/system_inventory/fan_info")
        try:
            return json.loads(body)
        except json.JSONDecodeError as exc:
            raise BmcError(f"fan_info 解析失败: {body[:200]}") from exc

    def sensors(self) -> dict[str, dict]:
        body = self.request("GET", "/api/sensors")
        try:
            items = json.loads(body)
        except json.JSONDecodeError as exc:
            raise BmcError(f"/api/sensors 解析失败: {body[:200]}") from exc
        if isinstance(items, dict):
            items = items.get("sensors") or items.get("data") or []
        return {str(s.get("name")): s for s in items if isinstance(s, dict)}

    def set_fan(self, manual: bool, pwm: float) -> None:
        payload = {
            "MODE": 0 if manual else 1,
            "PWMid": 0,
            "PWMvalue": int(round(pwm)) if manual else 0,
        }
        body = self.request("PUT", "/api/system_inventory/set_fan", payload)
        if "error" in body.lower():
            raise BmcError(f"set_fan 被拒绝: {body[:200]}")


# --------------------------------------------------------------------------- #
# 控制器
# --------------------------------------------------------------------------- #
@dataclass
class Decision:
    target_pwm: float
    desired_manual: bool
    reasons: list[str] = field(default_factory=list)
    critical: bool = False


class Controller:
    def __init__(self, cfg: Config, gpu: RocmSmiGpuReader, bmc: BmcClient | None, dry_run: bool):
        self.cfg = cfg
        self.gpu = gpu
        self.bmc = bmc
        self.mode = str(cfg["general"]["mode"]).lower()
        self.dry_run = bool(dry_run)
        self.state_dir = _pick_state_dir(str(cfg["general"]["state_dir"]))
        self.snapshot_path = self.state_dir / "original_mode.json"
        self.engaged = self.mode == "control"
        self.release_count = 0
        self.last_written_pwm: float | None = None
        self.last_write_ts = 0.0
        self.consecutive_errors = 0
        self.gpu_missing_cycles = 0
        self.original: dict | None = None
        self.metrics_file = str(cfg["general"].get("metrics_file") or "")
        self.last_decision: Decision | None = None
        self.last_readings: dict[str, float] = {}

    # -- BMC 状态快照 / 恢复 ------------------------------------------------ #
    def snapshot(self) -> None:
        if not self.bmc:
            return
        info = self.bmc.fan_info()
        self.original = {
            "manual": int(info.get("FanControlFlag", 1)) != 0,
            "pwm": float(info.get("PWMValue", 25) or 25),
            "taken_at": time.time(),
        }
        try:
            self.state_dir.mkdir(parents=True, exist_ok=True)
            self.snapshot_path.write_text(json.dumps(self.original, indent=2))
        except OSError as exc:
            LOG.error(
                "无法把原始状态写到 %s：%s（本次退出仍会用内存里的快照还原；"
                "但崩溃后就没法用 --restore 兜底了）",
                self.snapshot_path, exc,
            )
        LOG.info(
            "已记录 BMC 原始状态: %s PWM=%s",
            "手动" if self.original["manual"] else "自动",
            self.original["pwm"],
        )

    def restore(self, snapshot_from_file: bool = False) -> None:
        if not self.bmc:
            LOG.warning("没有 BMC 客户端，无法恢复")
            return
        snap = self.original
        if snap is None and snapshot_from_file and self.snapshot_path.exists():
            snap = json.loads(self.snapshot_path.read_text())
        if snap is None:
            LOG.info("没有快照，恢复为 BMC 自动模式")
            self.bmc.set_fan(manual=False, pwm=0)
        elif snap.get("manual"):
            LOG.info("恢复为 BMC 手动 PWM=%s", snap.get("pwm"))
            self.bmc.set_fan(manual=True, pwm=float(snap.get("pwm", 25)))
        else:
            LOG.info("恢复为 BMC 自动模式")
            self.bmc.set_fan(manual=False, pwm=0)

    # -- 决策 --------------------------------------------------------------- #
    def decide(self) -> Decision:
        c = self.cfg
        min_pwm = float(c["fan"]["min_pwm"])
        max_pwm = float(c["fan"]["max_pwm"])
        reasons: list[str] = []
        critical = False

        gpu_temps = self.gpu.read()
        if not gpu_temps:
            self.gpu_missing_cycles += 1
        else:
            self.gpu_missing_cycles = 0
        readings: dict[str, float] = {f"gpu_{k}": v for k, v in gpu_temps.items()}
        if gpu_temps:
            # 最热的那一路：接管/交还、临界判定、空闲判定都看它，
            # 这样不依赖某张卡一定叫 "junction"
            readings["gpu_hottest"] = max(gpu_temps.values())
            # 显存域：memory 与所有 HBM 堆取最大，统一喂给 gpu_mem 曲线
            mem_domain = [v for k, v in gpu_temps.items() if k == "mem" or k.startswith("hbm")]
            if mem_domain:
                readings["gpu_mem"] = max(mem_domain)

        # 1) BMC 传感器（也是接管期间唯一能保护 CPU 的信息源）
        thresholds: dict[str, float] = {}
        if self.bmc:
            try:
                sensors = self.bmc.sensors()
                cpu = [float(sensors[n]["reading"]) for n in BMC_CPU_SENSORS if n in sensors]
                mb = [float(sensors[n]["reading"]) for n in BMC_MB_SENSORS if n in sensors]
                inlet = [float(sensors[n]["reading"]) for n in BMC_INLET_SENSORS if n in sensors]
                if cpu:
                    readings["cpu_max"] = max(cpu)
                if mb:
                    readings["mb"] = max(mb)
                if inlet:
                    readings["inlet"] = max(inlet)
                for name in c["bmc"]["critical_sensors"]:
                    s = sensors.get(name)
                    if not s:
                        continue
                    thr, from_config = sensor_threshold(sensors, name, c["bmc"]["sensor_thresholds"])
                    if thr is None:
                        continue
                    thresholds[name] = thr
                    if float(s.get("reading", 0)) >= thr:
                        critical = True
                        suffix = "（配置兜底）" if from_config else ""
                        reasons.append(f"{name} {s.get('reading')}°C ≥ 临界 {thr:g}°C{suffix}")
            except BmcError as exc:
                self.consecutive_errors += 1
                LOG.warning("读取 BMC 传感器失败(%d): %s", self.consecutive_errors, exc)

        # 2) 各曲线求值，取最大
        #    - 名字对得上就用同名曲线（gpu_junction / gpu_edge / cpu_max / ...）
        #    - 其它 gpu_* 传感器（新卡上多出来的 HBM 堆、GFX、SOC...）走 gpu_default，
        #      免得因为"没配曲线"而被静默忽略
        demands: dict[str, float] = {}
        for name, temp in readings.items():
            if name == "gpu_hottest":
                continue
            curve = c.curves.get(name)
            if curve is None and name.startswith("gpu_"):
                curve = c.curves.get("gpu_default")
                LOG.debug("传感器 %s 没有同名曲线，走 gpu_default", name)
            if curve is None:
                continue
            demands[name] = curve.eval(temp)

        # 3) GPU 空闲时压低 GPU 项（但不影响 CPU/主板项）
        hottest = readings.get("gpu_hottest")
        if hottest is not None:
            use = self.gpu.gpu_use()
            # use < 0 = 读不到利用率 -> 不当作空闲（宁可多吹一点）
            if (
                hottest <= float(c["gpu"]["idle_max_temp"])
                and 0 <= use <= float(c["gpu"]["idle_max_gpu_use"])
            ):
                idle_pwm = float(c["gpu"]["idle_pwm"])
                for key in [k for k in demands if k.startswith("gpu_")]:
                    demands[key] = min(demands[key], idle_pwm)
                reasons.append(
                    f"GPU 空闲(最热 {hottest:g}°C, 利用率 {use:g}%) → GPU 项封顶 {idle_pwm:g}%"
                )

        # 4) 任何一路 GPU 传感器过热就直接拉满
        if hottest is not None and hottest >= float(c["gpu"]["critical_temp"]):
            critical = True
            reasons.append(f"GPU 最高温 {hottest:g}°C ≥ {c['gpu']['critical_temp']:g}°C")

        # 5) 读不到 GPU 温度 -> fail-safe
        fail_safe = False
        if self.gpu_missing_cycles >= 3:
            fail_safe = True
            reasons.append(f"连续 {self.gpu_missing_cycles} 次读不到 GPU 温度 → fail-safe")

        if critical:
            target = max_pwm
        elif fail_safe:
            target = max(min_pwm, float(c["assist"]["trigger_pwm"]))
        elif demands:
            best_name = max(demands, key=lambda k: demands[k])
            target = demands[best_name]
            reasons.append(f"最大需求来自 {best_name}={demands[best_name]:.0f}%")
        else:
            target = max(min_pwm, float(c["fan"].get("min_pwm", min_pwm)))

        target = min(max(target, min_pwm), max_pwm)

        # 6) 模式：assist 只在热的时候接管
        desired_manual = False
        if self.mode == "control":
            desired_manual = True
        elif self.mode == "observe":
            desired_manual = False
        elif self.mode == "assist":
            if not self.engaged:
                hot = hottest is not None and hottest >= float(c["assist"]["trigger_temp"])
                if critical or fail_safe or hot:
                    self.engaged = True
                    self.release_count = 0
                    why = "GPU 过热" if hot else ("临界越线" if critical else "GPU 温度连续读不到")
                    reasons.append(f"{why} → 接管风扇")
            else:
                cool = hottest is not None and hottest <= float(c["assist"]["release_temp"])
                if cool and not critical and not fail_safe:
                    self.release_count += 1
                    if self.release_count >= int(c["assist"]["release_cycles"]):
                        self.engaged = False
                        self.release_count = 0
                        reasons.append("GPU 已冷却 → 交还 BMC 自动控制")
                else:
                    self.release_count = 0
            desired_manual = self.engaged

        if desired_manual and self.mode == "assist":
            target = max(target, float(c["assist"]["trigger_pwm"]))

        self.last_readings = readings
        return Decision(target_pwm=target, desired_manual=desired_manual, reasons=reasons, critical=critical)

    # -- 执行 --------------------------------------------------------------- #
    def apply(self, decision: Decision) -> None:
        c = self.cfg
        now = time.time()
        # dry_run / observe 下只模拟：任何分支都绝不能碰 BMC
        simulate = self.dry_run or self.mode == "observe"

        if not decision.desired_manual:
            if simulate:
                if self.last_written_pwm is not None:
                    LOG.info("[dry-run] 将把风扇交还 BMC 自动模式")
                self.last_written_pwm = None
                return
            if self.bmc and self.last_written_pwm is not None:
                LOG.info("把风扇交还 BMC 自动模式")
                try:
                    self.bmc.set_fan(manual=False, pwm=0)
                except BmcError as exc:
                    self.consecutive_errors += 1
                    LOG.error("交还 BMC 自动模式失败(%d): %s", self.consecutive_errors, exc)
                    return
                self.last_written_pwm = None
                self.last_write_ts = now
            return

        current = self.last_written_pwm
        target = decision.target_pwm
        if current is not None and target < current:
            step = float(c["fan"]["ramp_down_step"])
            target = max(target, current - step)
        if current is not None and abs(target - current) < float(c["bmc"]["write_deadband"]):
            LOG.debug("变化 %.1f%% 小于死区，跳过写入", abs(target - current))
            return
        if now - self.last_write_ts < float(c["bmc"]["min_write_interval"]):
            LOG.debug("距上次写入不足 %.1fs，跳过", c["bmc"]["min_write_interval"])
            return

        if simulate:
            LOG.info("[dry-run] 将把 PWM 设为 %.0f%%（当前记录 %s）", target, current)
            self.last_written_pwm = target
            self.last_write_ts = now
            return

        if not self.bmc:
            return
        try:
            self.bmc.set_fan(manual=True, pwm=target)
            LOG.info("PWM %.0f%% → %.0f%%（已下发 HDM）", current if current is not None else -1, target)
            self.last_written_pwm = target
            self.last_write_ts = now
            self.consecutive_errors = 0
        except BmcError as exc:
            self.consecutive_errors += 1
            LOG.error("写入 HDM 失败(%d): %s", self.consecutive_errors, exc)

    def write_metrics(self) -> None:
        if not self.metrics_file or not self.last_decision:
            return
        lines = ["# HELP amdgpu_fan_ctl_bmc_pwm 当前下发的 PWM 百分比", "# TYPE amdgpu_fan_ctl_bmc_pwm gauge"]
        lines.append(f"amdgpu_fan_ctl_bmc_pwm {self.last_decision.target_pwm:g}")
        for key, value in sorted(self.last_readings.items()):
            lines.append(f'amdgpu_fan_ctl_bmc_temp_celsius{{sensor="{key}"}} {value:g}')
        snap = self.original or {}
        lines.append(f"amdgpu_fan_ctl_bmc_engaged {1 if self.engaged else 0}")
        lines.append(f"amdgpu_fan_ctl_bmc_original_manual {1 if snap.get('manual') else 0}")
        try:
            Path(self.metrics_file).write_text("\n".join(lines) + "\n")
        except OSError as exc:
            LOG.debug("写 metrics 失败: %s", exc)

    def step(self) -> None:
        decision = self.decide()
        self.last_decision = decision
        LOG.info(
            "目标 %.0f%% | %s%s | %s",
            decision.target_pwm,
            "接管" if decision.desired_manual else "不接管",
            " [临界]" if decision.critical else "",
            "；".join(decision.reasons) or "-",
        )
        self.apply(decision)
        self.write_metrics()


# --------------------------------------------------------------------------- #
# 命令行
# --------------------------------------------------------------------------- #
def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        description="用 AMD/ROCm GPU 温度驱动 H3C HDM 机箱风扇（默认只读，不写 BMC）",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    p.add_argument(
        "-c", "--config",
        help="TOML/JSON 配置文件。不给就依次找 ./config.toml 和脚本同目录的 config.toml；"
             "都没有则用内置默认值（mode=observe, dry_run=true）",
    )
    p.add_argument("--mode", choices=["observe", "assist", "control"], help="覆盖配置里的工作模式")
    p.add_argument("--dry-run", action="store_true", help="只打印决策，不写 BMC")
    p.add_argument("--live", action="store_true", help="关闭 dry_run（真的会写 BMC！）")
    p.add_argument("--once", action="store_true", help="只跑一个周期就退出")
    p.add_argument("--status", action="store_true", help="打印 BMC 当前风扇状态 + GPU 温度")
    p.add_argument("--simulate", action="store_true", help="离线跑温度扫描，检查曲线（不连 BMC）")
    p.add_argument("--restore", action="store_true", help="把 BMC 恢复成快照里的模式后退出")
    p.add_argument("--print-curves", action="store_true", help="打印所有曲线后退出")
    p.add_argument(
        "--remote",
        metavar="USER@HOST",
        default="",
        help="要 SSH 到哪台机器上跑 rocm-smi（如 lucas@127.0.0.1）；不给就在本机跑",
    )
    p.add_argument("-p", "--port", type=int, default=0, help="SSH 端口（配合 --remote，0 = ssh 默认 22）")
    p.add_argument("--gpu-local", action="store_true", help="忽略 --remote / 配置里的 gpu.remote，强制在本机跑 rocm-smi")
    p.add_argument(
        "--selftest",
        action="store_true",
        help="一次性的风扇通道自检：读温度→算决策→（--live 时）小幅试探 PWM 并立刻还原",
    )
    p.add_argument("--delta", type=float, default=5.0, help="--selftest 试探时 PWM 的改动量（负数更安静）")
    p.add_argument("--seconds", type=float, default=25.0, help="--selftest 试探时等待转速稳定的秒数")
    p.add_argument("--log-level", default=None, help="debug/info/warning/error")
    return p


def setup_logging(level: str) -> None:
    logging.basicConfig(
        level=getattr(logging, level.upper(), logging.INFO),
        format="%(asctime)s %(levelname)-7s %(message)s",
        datefmt="%H:%M:%S",
        stream=sys.stderr,
    )


def cmd_status(cfg: Config, gpu: RocmSmiGpuReader, bmc: BmcClient) -> int:
    print(
        f"配置：{cfg.path or '（未找到配置文件，全部用内置默认值）'}"
        f"  模式={cfg['general']['mode']}  dry_run={cfg['general']['dry_run']}"
    )
    info = bmc.fan_info()
    manual = int(info.get("FanControlFlag", 0)) != 0
    print(f"BMC 风扇：{'手动' if manual else '自动'}  PWM={info.get('PWMValue')}%")
    fans = [(i, info.get(f"Fan{i}_Reading")) for i in range(16) if info.get(f"Fan{i}_Reading")]
    print("转速：" + " ".join(f"Fan{i}={v}rpm" for i, v in fans))
    print(f"GPU：{gpu.describe()}")
    print(f"  读数：{gpu.read() or '拿不到（看上面的 WARNING）'}")
    use = gpu.gpu_use()
    print(f"  GPU 利用率：{f'{use:g}%' if use >= 0 else '读不到'}")
    sensors = bmc.sensors()
    fallbacks = cfg["bmc"].get("sensor_thresholds") or {}
    for name in (*BMC_CPU_SENSORS, *BMC_MB_SENSORS, *BMC_INLET_SENSORS):
        s = sensors.get(name)
        if not s:
            continue
        thr, from_config = sensor_threshold(sensors, name, fallbacks)
        if thr is None:
            shown = "NA（BMC 没提供，bmc.sensor_thresholds 里也没兜底）"
        else:
            shown = f"{thr:g}°C" + ("（配置兜底，BMC 没报）" if from_config else "")
        print(f"  {name:16} {s.get('reading')}°C  临界 {shown}")
    # BMC 那几路 GPU 温度在这台机器上永远是 0（BMC 没有 GPU sideband）。
    # 不把 0 当读数打印，免得看起来像"脚本没取到"。
    live_bmc_gpu = []
    for name in BMC_GPU_SENSORS:
        s = sensors.get(name)
        if not s:
            continue
        try:
            val = float(s.get("reading"))
        except (TypeError, ValueError):
            continue
        if val > 0:
            live_bmc_gpu.append((name, val))
    present = [n for n in BMC_GPU_SENSORS if n in sensors]
    if live_bmc_gpu:
        for name, val in live_bmc_gpu:
            print(f"  {name:16} {val}°C   <- BMC 自己读到的 GPU 温度")
    elif present:
        print(
            f"  BMC 侧 GPU 温度：读不到（{', '.join(present)} 全是 0；"
            "H3C HDM 要有 GPU sideband 支持才读得到，本机没有）"
        )
        print("  ↑ 这不影响控制：本程序用的 GPU 温度一律来自上面的 rocm-smi")
    return 0


def _dir_writable(path: Path) -> bool:
    """真的写一个探针文件。

    注意不能用 os.access(W_OK)：它只看权限位，**不会**发现只读挂载
    （例如把 /var/lib 挂成只读时仍然返回 True）。
    """
    probe = path / ".amdgpu-fan-ctl-bmc-write-test"
    try:
        path.mkdir(parents=True, exist_ok=True)
        probe.touch()
    except OSError:
        return False
    try:
        probe.unlink()
    except OSError:
        pass
    return True


def _pick_state_dir(configured: str) -> Path:
    """配置的 state_dir 不可写时（非 root 手动跑、或 /var/lib 被挂成只读）挑一个能写的。

    顺序：配置值 → $XDG_STATE_HOME|~/.local/state/amdgpu-fan-ctl-bmc → $TMPDIR/amdgpu-fan-ctl-bmc-<uid>。
    落到临时目录只影响 --restore 的兜底快照，正常退出仍用内存里的快照还原。
    """
    path = Path(configured)
    if _dir_writable(path):
        return path
    candidates = [
        Path(os.environ.get("XDG_STATE_HOME") or (Path.home() / ".local" / "state")) / "amdgpu-fan-ctl-bmc",
        Path(tempfile.gettempdir()) / f"amdgpu-fan-ctl-bmc-{os.getuid()}",
    ]
    for fallback in candidates:
        if _dir_writable(fallback):
            LOG.warning(
                "state_dir %s 不可写，临时改用 %s（systemd 下请用 root 跑，别让它落到临时目录）",
                path, fallback,
            )
            return fallback
    LOG.error("state_dir %s 及所有备用目录都不可写，快照无法落盘", path)
    return path


def _avg_rpm(info: dict) -> float:
    vals = []
    for key, val in info.items():
        if key.startswith("Fan") and key.endswith("_Reading") and val:
            try:
                vals.append(float(val))
            except (TypeError, ValueError):
                continue
    return sum(vals) / len(vals) if vals else 0.0


def cmd_selftest(
    cfg: Config, gpu, bmc: BmcClient, live: bool, delta: float, seconds: float
) -> int:
    print("=== 1) GPU 温度源（rocm-smi）===")
    print(f"  {gpu.describe()}")
    temps = gpu.read()
    print(f"  读数：{temps if temps else '拿不到（看上面的 WARNING）'}")
    use = gpu.gpu_use()
    print(f"  GPU 利用率：{f'{use:g}%' if use >= 0 else '读不到'}")

    print("\n=== 2) BMC 风扇现状 ===")
    info = bmc.fan_info()
    orig_manual = int(info.get("FanControlFlag", 0)) != 0
    orig_pwm = float(info.get("PWMValue") or 0)
    before = _avg_rpm(info)
    print(f"  模式={'手动' if orig_manual else '自动'}  PWM={orig_pwm:.0f}%  平均转速={before:.0f}rpm")

    print("\n=== 3) 脚本此刻会怎么决策 ===")
    ctrl = Controller(cfg, gpu, bmc, dry_run=True)
    ctrl.snapshot()  # 只读：把当前模式/占空比记进 state_dir，供 --restore 用
    decision = ctrl.decide()
    print(f"  目标 PWM={decision.target_pwm:.0f}%  接管={decision.desired_manual}  临界={decision.critical}")
    print(f"  理由：{'; '.join(decision.reasons) if decision.reasons else '(无)'}")

    if not live:
        print("\n(dry-run) 到此为止，一个字节都没写 BMC。加 --live 才会真的试探。")
        return 0

    lo, hi = float(cfg["fan"]["min_pwm"]), float(cfg["fan"]["max_pwm"])
    target = min(max(orig_pwm + delta, lo), hi)
    print(f"\n=== 4) 试探：PWM {orig_pwm:.0f}% → {target:.0f}%，等 {seconds:.0f}s 看转速 ===")
    after = before
    bmc.set_fan(manual=True, pwm=target)
    try:
        deadline = time.time() + seconds
        while True:
            remaining = deadline - time.time()
            if remaining <= 0:
                break
            time.sleep(min(5.0, remaining))
        after = _avg_rpm(bmc.fan_info())
        print(f"  转速 {before:.0f}rpm → {after:.0f}rpm  （变化 {after - before:+.0f}rpm）")
    finally:
        print(f"\n=== 5) 还原原始状态（{'手动 PWM=%.0f%%' % orig_pwm if orig_manual else '自动模式'}） ===")
        if orig_manual:
            bmc.set_fan(manual=True, pwm=orig_pwm)
        else:
            bmc.set_fan(manual=False, pwm=0)
        print("  已还原")
    ok = abs(after - before) >= 20
    print(
        "\n结论：" + (
            "风扇通道有效——PWM 改动确实带动了转速，脚本的 set_fan 能真正影响风扇。"
            if ok else
            "转速没有明显变化。可能这个档位落在风扇调速死区，或 BMC 覆盖了写入；换个 --delta 再试。"
        )
    )
    return 0 if ok else 1


def cmd_simulate(cfg: Config) -> int:
    print("温度扫描（只算曲线，不连 BMC）：\n")
    header = f"{'温度':>6} | " + " | ".join(f"{n:>12}" for n in cfg.curves) + " |  最终目标"
    print(header)
    print("-" * len(header))
    for temp in range(25, 101, 5):
        vals = {name: curve.eval(temp) for name, curve in cfg.curves.items()}
        target = min(max(max(vals.values()), cfg["fan"]["min_pwm"]), cfg["fan"]["max_pwm"])
        row = f"{temp:>4}°C | " + " | ".join(f"{v:>11.0f}%" for v in vals.values()) + f" | {target:>6.0f}%"
        print(row)
    print()
    for name, curve in cfg.curves.items():
        print(f"{name:14}: {curve.describe()}")
    return 0


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    cfg_path = resolve_config_path(args.config)
    try:
        cfg = Config.load(cfg_path)
    except (OSError, tomllib.TOMLDecodeError) as exc:
        print(f"读取配置失败 {cfg_path or '(未指定配置文件)'}: {exc}", file=sys.stderr)
        return 2
    if args.mode:
        cfg.raw["general"]["mode"] = args.mode
    if args.live and args.dry_run:
        print("--live 和 --dry-run 互斥，别同时给", file=sys.stderr)
        return 2
    if args.live:
        cfg.raw["general"]["dry_run"] = False
    elif args.dry_run:
        # 显式覆盖配置里可能为 false 的 dry_run —— 只想看一眼、绝不写 BMC 时用
        cfg.raw["general"]["dry_run"] = True
    setup_logging(args.log_level or str(cfg["general"]["log_level"]))
    if cfg.path:
        LOG.info(
            "配置文件：%s（模式=%s dry_run=%s）",
            cfg.path, cfg["general"]["mode"], cfg["general"]["dry_run"],
        )
    else:
        LOG.warning(
            "没找到配置文件：./config.toml 和 %s 都不存在，本次**全部用内置默认值**"
            "（mode=observe, dry_run=true，绝不写 BMC）。"
            "改过配置文件却不生效时先看这一行——用 -c <文件> 指定，"
            "或把 config.toml 放到当前工作目录。",
            Path(__file__).resolve().parent / "config.toml",
        )

    try:
        gpu = make_gpu_reader(cfg, force_local=args.gpu_local, remote=args.remote, port=args.port)
    except GpuError as exc:
        print(str(exc), file=sys.stderr)
        return 2

    if args.print_curves:
        for name, curve in cfg.curves.items():
            print(f"{name:14}: {curve.describe()}")
        print(f"\nGPU: {gpu.describe()}")
        return 0
    if args.simulate:
        return cmd_simulate(cfg)

    try:
        bmc: BmcClient | None = BmcClient(cfg["bmc"])
    except BmcError as exc:
        if args.status or args.restore or args.selftest or str(cfg["general"]["mode"]) != "observe":
            print(f"{exc}", file=sys.stderr)
            return 2
        bmc = None

    if bmc is not None:
        # 不管从哪条路径返回（--status / --selftest / 异常）都要把 HDM 会话还回去，
        # 否则 BMC 的并发会话会被自己占满。
        atexit.register(bmc.logout)

    if args.status:
        assert bmc is not None
        return cmd_status(cfg, gpu, bmc)
    if args.selftest:
        if bmc is None:
            print("--selftest 需要 BMC 凭据", file=sys.stderr)
            return 2
        return cmd_selftest(cfg, gpu, bmc, args.live, args.delta, args.seconds)

    ctrl = Controller(cfg, gpu, bmc, dry_run=not args.live and bool(cfg["general"]["dry_run"]))
    if args.restore:
        if bmc is None:
            print("需要 BMC 凭据才能恢复", file=sys.stderr)
            return 2
        ctrl.restore(snapshot_from_file=True)
        return 0

    LOG.info(
        "启动：模式=%s dry_run=%s 轮询=%.1fs 接管/交还阈值=%.0f/%.0f°C",
        ctrl.mode,
        ctrl.dry_run,
        float(cfg["general"]["poll_interval"]),
        float(cfg["assist"]["trigger_temp"]),
        float(cfg["assist"]["release_temp"]),
    )
    if ctrl.mode == "observe":
        LOG.info("observe 模式：只读观察，不会写 BMC")
    if bmc is not None and not ctrl.dry_run:
        try:
            ctrl.snapshot()
        except BmcError as exc:
            LOG.error("无法读取 BMC 初始状态，拒绝在无快照的情况下接管: %s", exc)
            return 3

    stopping = {"flag": False}

    def _stop(signum, _frame):  # noqa: ANN001
        LOG.info("收到信号 %s，准备退出", signum)
        stopping["flag"] = True

    signal.signal(signal.SIGTERM, _stop)
    signal.signal(signal.SIGINT, _stop)

    code = 0
    try:
        while not stopping["flag"]:
            try:
                ctrl.step()
            except BmcError as exc:
                ctrl.consecutive_errors += 1
                LOG.error("采集失败(%d): %s", ctrl.consecutive_errors, exc)
            if ctrl.consecutive_errors >= int(cfg["bmc"]["max_consecutive_errors"]):
                LOG.error("连续失败过多，退出交由 systemd 重启")
                code = 3
                break
            if args.once:
                break
            for _ in range(int(float(cfg["general"]["poll_interval"]) * 10)):
                if stopping["flag"]:
                    break
                time.sleep(0.1)
    finally:
        if bool(cfg["restore"]["on_exit"]) and bmc is not None and not ctrl.dry_run and ctrl.last_written_pwm is not None:
            try:
                ctrl.restore()
            except BmcError as exc:
                LOG.error("退出时恢复 BMC 状态失败: %s", exc)
    return code


if __name__ == "__main__":
    sys.exit(main())
