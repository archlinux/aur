#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
amdgpu-fan-ctl —— 用 rocm-smi 读到的 AMD GPU 温度驱动机箱风扇的闭环控制器

拓扑
    程序与 MI210 跑在同一台机器上（本机 rocm-smi）。
    风扇由泰安 S8030 的 BMC 控制，程序通过本机 ipmitool 走 /dev/ipmi0
    直接写 PWM 通道（默认 pwm_id=5 = SYS_FAN4），不依赖 BMC 网络。

    S8030 / BMC 6.02 的 fan table（实测）：
        PWM0 = CPU0_FAN      PWM1 = CPU1_FAN
        PWM2 = SYS_FAN_1     PWM3 = SYS_FAN_2
        PWM4 = SYS_FAN_3     PWM5 = SYS_FAN_4
    即 pwm_id = SYS_FAN 序号 + 1；前两路是 CPU 通道，本程序绝不写。
    实测依据：把 PWM5 从 31% 拉到 100%，SYS_FAN_4 从 4692 升到 8142 RPM，
    而 CPU_FAN 始终是 1242 RPM。

温度源：只有 GPU（rocm-smi）
    `rocm-smi -t --json` 是 ROCm 自己维护的接口，读数最全
    （edge / junction / memory / HBM 0..3 ...）。本程序**只**认这一种温度源，
    不读取 BMC 的 CPU / 主板 / 进风温度传感器。

    传感器名不写死：`Temperature (Sensor XXX) (C)` 会被自动展开成 `xxx`
    （小写、非字母数字转下划线）。没有同名曲线的传感器走 `gpu_default`，
    不会被静默忽略。

两种工作模式
    observe  只读、只打印决策，一个字节都不写（最安全的观察模式）
    control  一直由本程序接管（推荐）

安全设计
    1. 只写 SYS_FAN 通道（2=SYS_FAN_1 … 5=SYS_FAN_4）；0/1 是 CPU 风扇通道，
       配置成这些值会直接拒绝启动。
    2. GPU 曲线按 `gpu.critical_temp` 自适应生成：100% 恰好落在该温度上，
       曲线本身是连续的，不会在中间被硬阈值截断；同时任一路传感器的**瞬时值**
       ≥ 该温度 → 直接 100%，不受温度平滑延迟影响。
    3. 升温不限速（安全优先），降温按 ramp_down_step 限速（降噪）。
    4. 读不到 GPU 温度 -> fail-safe 拉高，而不是维持低转速。
    5. 写 PWM 失败 -> 重试；连续失败超过阈值则退出，交给 systemd 重启。
    6. 退出时恢复接管前的 PWM（快照落盘，--restore 可手动恢复）。
    7. 只在需要时写（死区 write_deadband + 最小间隔 min_write_interval）。

依赖
    Python 3.11+ 标准库、rocm-smi、ipmitool。
"""

from __future__ import annotations

import argparse
import json
import logging
import os
import re
import signal
import subprocess
import sys
import tempfile
import time
import tomllib
from dataclasses import dataclass, field
from pathlib import Path

LOG = logging.getLogger("amdgpu-fan-ctl")

# S8030 / BMC 6.02 的 fan table（实测）：
#   PWM0 = CPU0_FAN      PWM1 = CPU1_FAN
#   PWM2 = SYS_FAN_1     PWM3 = SYS_FAN_2
#   PWM4 = SYS_FAN_3     PWM5 = SYS_FAN_4
# 即 pwm_id = SYS_FAN 序号 + 1。前两路是 CPU 通道，本程序绝不写。
SYS_FAN_PWM_BASE = 2


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
        "state_dir": "/var/lib/amdgpu-fan-ctl",
        "metrics_file": "",
    },
    "gpu": {
        # 必须绝对路径：/opt/rocm/bin 不在 systemd 的 PATH 里
        "rocm_smi": "/opt/rocm/bin/rocm-smi",
        "timeout": 20.0,
        "smoothing": 0.35,
        "critical_temp": 60.0,
        # 空闲判定的温度上限，比的是"最热的那一路 GPU 传感器"
        "idle_max_temp": 55.0,
        # 空闲判定还要求 GPU 利用率 <= 这个值。设成 100 就退化成"只看温度"
        "idle_max_gpu_use": 0.0,
        "idle_pwm": 22.0,
    },
    "bmc": {
        "ipmitool": "/usr/bin/ipmitool",
        # 2=SYS_FAN_1、3=SYS_FAN_2、4=SYS_FAN_3、5=SYS_FAN_4（0/1 是 CPU 通道，禁止选）
        "pwm_id": 5,
        "timeout": 15.0,
        "min_write_interval": 5.0,
        "write_deadband": 3.0,
        "max_consecutive_errors": 8,
    },
    "fan": {
        "min_pwm": 20.0,
        "max_pwm": 100.0,
        "ramp_down_step": 5.0,
        # 连续读不到 GPU 温度时的 fail-safe 下限
        "fail_safe_pwm": 45.0,
    },
    "restore": {"on_exit": True},
}

# GPU 曲线不再写死温度点，而是按（critical_temp 的比例, PWM 区间比例）生成。
# 100% 一定落在 critical_temp 上，所以硬阈值和曲线在同一个点收口，中间不会出现台阶；
# 用户把 critical_temp 填成 60 还是 110，形状不变、温度范围整体伸缩。
GPU_CURVE_SHAPE: tuple[tuple[float, float], ...] = (
    (0.45, 0.000),   # critical_temp 的 45% 处：min_pwm
    (0.60, 0.125),
    (0.72, 0.3125),
    (0.83, 0.525),
    (0.92, 0.775),
    (1.00, 1.000),   # critical_temp 处：max_pwm
)

# 这几条 GPU 曲线全部由 critical_temp 生成；config 里显式写同名曲线可覆盖
GPU_CURVE_NAMES = ("gpu_junction", "gpu_edge", "gpu_mem", "gpu_default")


def adaptive_gpu_points(critical: float, fan: dict) -> list[list[float]]:
    """按 critical_temp 生成 GPU 曲线：低端是 min_pwm，critical_temp 处是 max_pwm。"""
    critical = float(critical)
    if critical <= 0:
        raise ValueError(f"gpu.critical_temp 必须大于 0，当前是 {critical:g}")
    low = float(fan.get("min_pwm", 20.0))
    high = float(fan.get("max_pwm", 100.0))
    span = high - low
    return [[round(critical * t, 2), round(low + duty * span, 2)] for t, duty in GPU_CURVE_SHAPE]


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
        # PWM0/PWM1 是 CPU 通道：本程序只控制机箱风扇，绝不允许碰 CPU 风扇
        pwm_id = int(self.raw["bmc"]["pwm_id"])
        if pwm_id < SYS_FAN_PWM_BASE:
            raise ValueError(
                f"bmc.pwm_id={pwm_id} 是 CPU 风扇通道（S8030: 0=CPU0_FAN、1=CPU1_FAN），"
                "本程序只允许 SYS_FAN 通道（2=SYS_FAN_1 … 5=SYS_FAN_4）"
            )
        self.curves: dict[str, Curve] = {}
        # GPU 曲线跟着 critical_temp 走：改阈值，整条曲线自动伸缩
        gpu_points = adaptive_gpu_points(self.raw["gpu"]["critical_temp"], self.raw["fan"])
        for name in GPU_CURVE_NAMES:
            self.curves[name] = Curve(name, gpu_points)
        # config 里显式写的曲线（包括 gpu_*）优先级最高
        for name, value in (self.raw.get("curves") or {}).items():
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
    （mode=observe、dry_run=true），于是 `python3 amdgpu_fan_ctl.py` 会**静默忽略**
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


def percent(value) -> float:
    """rocm-smi 的百分比字段 -> float；读不到返回 -1（不要据此判断空闲）。"""
    try:
        return float(str(value).strip())
    except (TypeError, ValueError):
        return -1.0


def _fmt_pct(value: float) -> str:
    return "读不到" if value < 0 else f"{value:g}%"


# --------------------------------------------------------------------------- #
# rocm-smi 读取器
# --------------------------------------------------------------------------- #
class RocmSmiGpuReader:
    """用本机 `rocm-smi` 读 GPU 温度、利用率和型号。这是唯一的 GPU 数据来源。

        rocm-smi -t --json                        温度
        rocm-smi --showuse --showmemuse --json    算力 + 显存利用率（判断"是不是真闲着"）
        rocm-smi --showproductname --json         型号（只用于显示）

    多卡时每个标签取最热的那张 —— 风扇只能往快了吹，取最热是安全方向。
    """

    def __init__(self, binary: str, smoothing: float, timeout: float = 20.0):
        self.binary = str(binary)
        self.alpha = min(max(smoothing, 0.0), 1.0)
        self.timeout = float(timeout)
        self.smoothed: dict[tuple[str, str], float] = {}   # (card, 标签) -> 平滑值
        self.last_raw: dict[str, float] = {}               # 最近一次未平滑的读数
        self.last_error = ""

    def _run(self, *args: str) -> dict:
        cmd = [self.binary, *args, "--json"]
        try:
            proc = subprocess.run(cmd, capture_output=True, text=True, timeout=self.timeout)
        except FileNotFoundError as exc:
            raise GpuError(f"找不到 {cmd[0]}") from exc
        except subprocess.TimeoutExpired as exc:
            raise GpuError(f"rocm-smi 超时(>{self.timeout:.0f}s)") from exc
        text = proc.stdout or ""
        start = text.find("{")
        if start < 0:
            detail = (proc.stderr or text).strip().replace("\n", " ")[:200]
            raise GpuError(f"rocm-smi 没返回 JSON(rc={proc.returncode}): {detail}")
        try:
            return json.loads(text[start:])
        except json.JSONDecodeError as exc:
            raise GpuError(f"rocm-smi 的 JSON 解析失败: {exc}") from exc

    # -- 卡的身份（只用于显示） --------------------------------------------- #
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

    # -- 温度 --------------------------------------------------------------- #
    def read(self) -> dict[str, float]:
        """返回平滑后的温度；未平滑的瞬时值留在 `last_raw`（安全阈值用它）。"""
        try:
            data = self._run("-t")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            self.last_raw = {}
            LOG.warning("rocm-smi 读温度失败：%s", exc)
            return {}
        out: dict[str, float] = {}
        raw_out: dict[str, float] = {}
        for card, temps in data.items():
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
                raw_out[label] = max(raw_out.get(label, raw), raw)
                # 平滑状态按 (卡, 标签) 分开存，多卡互不污染
                slot = (str(card), label)
                prev = self.smoothed.get(slot)
                value = raw if prev is None else prev + self.alpha * (raw - prev)
                self.smoothed[slot] = value
                value = round(value, 1)
                out[label] = max(out.get(label, value), value)
        self.last_raw = raw_out
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
    def usage(self) -> tuple[float, float]:
        """所有卡的（算力利用率, 显存利用率）最大值，单位 %。

        显存取的是 `GPU Memory Read/Write Activity (%)`（带宽活动），
        不是 `GPU Memory Allocated (VRAM%)`（占用比例）。
        任一值 -1 = 读不到，**不要**据此判断空闲。
        """
        try:
            data = self._run("--showuse", "--showmemuse")
        except (GpuError, OSError) as exc:
            self.last_error = str(exc)
            LOG.debug("rocm-smi 读利用率失败：%s", exc)
            return -1.0, -1.0
        compute = -1.0
        memory = -1.0
        for info in data.values():
            if not isinstance(info, dict):
                continue
            compute = max(compute, percent(info.get("GPU use (%)")))
            memory = max(memory, percent(info.get("GPU Memory Read/Write Activity (%)")))
        return compute, memory

    # -- 状态 --------------------------------------------------------------- #
    def found(self) -> bool:
        return bool(self.read())

    def describe(self) -> str:
        cards = self.cards()
        identity = "，".join(f"{c}={n}" for c, n in sorted(cards.items())) or "（读不到型号）"
        tail = f"  [最后错误：{self.last_error}]" if self.last_error else ""
        return (
            f"rocm-smi 本机（{self.binary}）"
            f"\n  卡：{identity}"
            f"\n  传感器：{self.raw_labels()}{tail}"
        )


def make_gpu_reader(cfg: Config) -> RocmSmiGpuReader:
    g = dict(cfg.raw.get("gpu") or {})
    return RocmSmiGpuReader(
        binary=str(g.get("rocm_smi", "/opt/rocm/bin/rocm-smi")),
        smoothing=float(g.get("smoothing", 0.35)),
        timeout=float(g.get("timeout", 20.0)),
    )


# --------------------------------------------------------------------------- #
# 风扇后端：本机 ipmitool
# --------------------------------------------------------------------------- #
class BmcError(RuntimeError):
    pass


class IpmiClient:
    """本机 ipmitool 后端（泰安 S8030 实测）。

    走 /dev/ipmi0 的带内 KCS，不需要 BMC 有 IP。泰安 BMC 6.02 的风扇 PWM
    OEM 命令是：
        raw 0x2e 0x44 0xfd 0x19 0x00 <pwm_id> 0x01 <duty 0-100>   # 设置
        raw 0x2e 0x45 0xfd 0x19 0x00 <pwm_id>                     # 读回

    S8030 的 fan table 与丝印不是一一对应的（PWM0/1 被两个 CPU 通道占用）：
        PWM0 = CPU0_FAN      PWM1 = CPU1_FAN
        PWM2 = SYS_FAN_1     PWM3 = SYS_FAN_2
        PWM4 = SYS_FAN_3     PWM5 = SYS_FAN_4
    所以 pwm_id = SYS_FAN 序号 + 1，默认 5 = SYS_FAN4。实测：PWM5 从 31%
    拉到 100% 时 SYS_FAN_4 由 4692 升到 8142 RPM，CPU_FAN 保持 1242 RPM。

    读回的倒数第二字节是模式（00=auto、01=manual），最后一字节是占空比。

    没有软件层的 "自动模式" 开关，所以 hand_back() 写回 max_pwm（默认 100%），
    等价于主板默认全速；正常退出时 Controller 会用快照里的原始占空比还原。
    """

    def __init__(self, cfg: dict, auto_pwm: float = 100.0):
        self.binary = str(cfg.get("ipmitool") or "/usr/bin/ipmitool")
        self.pwm_id = int(cfg.get("pwm_id", 5))
        self.timeout = float(cfg.get("timeout", 15.0))
        self.auto_pwm = float(auto_pwm)

    @staticmethod
    def _hex(value: int) -> str:
        return f"0x{value:02x}"

    def _run(self, args: list[str]) -> str:
        try:
            proc = subprocess.run(
                [self.binary, *args], capture_output=True, text=True, timeout=self.timeout
            )
        except FileNotFoundError as exc:
            raise BmcError(f"找不到 {self.binary}") from exc
        except subprocess.TimeoutExpired as exc:
            raise BmcError(f"ipmitool 超时(>{self.timeout:.0f}s)") from exc
        if proc.returncode != 0:
            lines = (proc.stderr or proc.stdout).strip().splitlines()
            detail = lines[-1] if lines else f"rc={proc.returncode}"
            raise BmcError(f"ipmitool {' '.join(args)} 失败: {detail}")
        return proc.stdout

    def _read_duty(self) -> int:
        out = self._run(["raw", "0x2e", "0x45", "0xfd", "0x19", "0x00", self._hex(self.pwm_id)])
        parts = out.split()
        if not parts:
            raise BmcError("读取 PWM 占空比没有返回数据")
        return int(parts[-1], 16)

    def _write_duty(self, pwm: float) -> None:
        duty = max(0, min(100, int(round(pwm))))
        self._run(
            ["raw", "0x2e", "0x44", "0xfd", "0x19", "0x00",
             self._hex(self.pwm_id), "0x01", self._hex(duty)]
        )

    def fan_info(self) -> dict:
        info = {"PWMValue": self._read_duty()}
        index = 0
        for line in self._run(["sdr"]).splitlines():
            parts = [p.strip() for p in line.split("|")]
            if len(parts) < 2:
                continue
            name = parts[0]
            # CPU 风扇不在本程序的管理范围内，连显示都跳过
            if "FAN" not in name.upper() or "CPU" in name.upper():
                continue
            match = re.match(r"(\d+)\s*RPM", parts[1], re.I)
            if not match:
                continue
            # 编号跟 PWM 通道对齐：SYS_FAN_n -> n+1
            sys_match = re.match(r"SYS_FAN_(\d+)$", name, re.I)
            idx = int(sys_match.group(1)) + 1 if sys_match else index
            info[f"Fan{idx}_Reading"] = int(match.group(1))
            info[f"Fan{idx}_Name"] = name
            index += 1
        return info

    def set_pwm(self, pwm: float) -> None:
        self._write_duty(pwm)

    def hand_back(self) -> None:
        """没有软件层自动模式：写回 max_pwm（主板默认全速）。"""
        self._write_duty(self.auto_pwm)


# --------------------------------------------------------------------------- #
# 控制器
# --------------------------------------------------------------------------- #
@dataclass
class Decision:
    target_pwm: float
    desired_manual: bool
    reasons: list[str] = field(default_factory=list)
    critical: bool = False
    # 每轮都要能打日志：GPU 最高温（瞬时值）、算力/显存利用率（-1 = 读不到）
    gpu_temp: float | None = None
    gpu_use: float = -1.0
    gpu_mem_use: float = -1.0


class Controller:
    def __init__(self, cfg: Config, gpu: RocmSmiGpuReader, bmc: IpmiClient | None, dry_run: bool):
        self.cfg = cfg
        self.gpu = gpu
        self.bmc = bmc
        self.mode = str(cfg["general"]["mode"]).lower()
        if self.mode not in ("observe", "control"):
            LOG.warning("未知模式 %s，按 observe 处理", self.mode)
            self.mode = "observe"
        self.dry_run = bool(dry_run)
        self.state_dir = _pick_state_dir(str(cfg["general"]["state_dir"]))
        self.snapshot_path = self.state_dir / "original_mode.json"
        self.last_written_pwm: float | None = None
        self.last_write_ts = 0.0
        self.consecutive_errors = 0
        self.gpu_missing_cycles = 0
        self.original: dict | None = None
        self.metrics_file = str(cfg["general"].get("metrics_file") or "")
        self.last_decision: Decision | None = None
        self.last_readings: dict[str, float] = {}

    # -- 原始 PWM 快照 / 恢复 ---------------------------------------------- #
    def snapshot(self) -> None:
        if not self.bmc:
            return
        info = self.bmc.fan_info()
        pwm_raw = info.get("PWMValue")
        self.original = {
            "pwm": float(pwm_raw) if pwm_raw is not None else float(self.cfg["fan"]["max_pwm"]),
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
        LOG.info("已记录原始 PWM=%s%%", self.original["pwm"])

    def restore(self, snapshot_from_file: bool = False) -> None:
        if not self.bmc:
            return
        snap = self.original
        if snap is None and snapshot_from_file and self.snapshot_path.exists():
            snap = json.loads(self.snapshot_path.read_text())
        if snap is None:
            LOG.info("没有快照，写回默认全速")
            self.bmc.hand_back()
            return
        LOG.info("恢复原始 PWM=%s%%", snap.get("pwm"))
        self.bmc.set_pwm(float(snap.get("pwm", self.cfg["fan"]["max_pwm"])))

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
            # 最热的那一路：接管、临界判定、空闲判定都看它，
            # 这样不依赖某张卡一定叫 "junction"
            readings["gpu_hottest"] = max(gpu_temps.values())
            # 显存域：memory 与所有 HBM 堆取最大，统一喂给 gpu_mem 曲线
            mem_domain = [v for k, v in gpu_temps.items() if k == "mem" or k.startswith("hbm")]
            if mem_domain:
                readings["gpu_mem"] = max(mem_domain)

        # 1) 各曲线求值，取最大
        #    - 名字对得上就用同名曲线（gpu_junction / gpu_edge / gpu_mem / ...）
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

        # 2) GPU 空闲时压低 GPU 项
        #    算力和显存利用率每轮都读，日志里任何时候都能看到
        hottest = readings.get("gpu_hottest")
        use, mem_use = self.gpu.usage()
        idle_max_use = float(c["gpu"]["idle_max_gpu_use"])
        # 任一利用率 < 0 = 读不到 -> 不当作空闲（宁可多吹一点）
        if (
            hottest is not None
            and hottest <= float(c["gpu"]["idle_max_temp"])
            and 0 <= use <= idle_max_use
            and 0 <= mem_use <= idle_max_use
        ):
            idle_pwm = float(c["gpu"]["idle_pwm"])
            for key in [k for k in demands if k.startswith("gpu_")]:
                demands[key] = min(demands[key], idle_pwm)
            reasons.append(
                f"GPU 空闲(最热 {hottest:g}°C, 算力 {use:g}%, 显存 {mem_use:g}%)"
                f" → GPU 项封顶 {idle_pwm:g}%"
            )

        # 3) 任何一路 GPU 传感器达到上限温度就直接拉满
        #    用未平滑的瞬时值，避免平滑延迟导致越线后还停在低转速。
        limit = float(c["gpu"]["critical_temp"])
        raw_values = getattr(self.gpu, "last_raw", None) or {}
        guard_temp = max(raw_values.values()) if raw_values else hottest
        if guard_temp is not None and guard_temp >= limit:
            critical = True
            reasons.append(f"GPU 最高温 {guard_temp:g}°C ≥ {limit:g}°C")

        # 4) 读不到 GPU 温度 -> fail-safe
        fail_safe = False
        if self.gpu_missing_cycles >= 3:
            fail_safe = True
            reasons.append(f"连续 {self.gpu_missing_cycles} 次读不到 GPU 温度 → fail-safe")

        if critical:
            target = max_pwm
        elif fail_safe:
            target = max(min_pwm, float(c["fan"]["fail_safe_pwm"]))
        elif demands:
            best_name = max(demands, key=lambda k: demands[k])
            target = demands[best_name]
            reasons.append(f"最大需求来自 {best_name}={demands[best_name]:.0f}%")
        else:
            target = max(min_pwm, float(c["fan"].get("min_pwm", min_pwm)))

        target = min(max(target, min_pwm), max_pwm)

        # 5) 模式：control 一直接管；observe 只读
        desired_manual = self.mode == "control"

        self.last_readings = readings
        return Decision(
            target_pwm=target,
            desired_manual=desired_manual,
            reasons=reasons,
            critical=critical,
            gpu_temp=guard_temp,
            gpu_use=use,
            gpu_mem_use=mem_use,
        )

    # -- 执行 --------------------------------------------------------------- #
    def apply(self, decision: Decision) -> None:
        c = self.cfg
        now = time.time()
        # dry_run / observe 下只模拟：任何分支都绝不能碰 BMC
        simulate = self.dry_run or self.mode == "observe"

        if not decision.desired_manual:
            # observe 模式：只读，不写 BMC
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
            self.bmc.set_pwm(target)
            LOG.info("PWM %.0f%% → %.0f%%（已下发）", current if current is not None else -1, target)
            self.last_written_pwm = target
            self.last_write_ts = now
            self.consecutive_errors = 0
        except BmcError as exc:
            self.consecutive_errors += 1
            LOG.error("写入失败(%d): %s", self.consecutive_errors, exc)

    def write_metrics(self) -> None:
        if not self.metrics_file or not self.last_decision:
            return
        lines = ["# HELP amdgpu_fan_ctl_pwm 当前下发的 PWM 百分比", "# TYPE amdgpu_fan_ctl_pwm gauge"]
        lines.append(f"amdgpu_fan_ctl_pwm {self.last_decision.target_pwm:g}")
        for key, value in sorted(self.last_readings.items()):
            lines.append(f'amdgpu_fan_ctl_temp_celsius{{sensor="{key}"}} {value:g}')
        snap = self.original or {}
        lines.append(f"amdgpu_fan_ctl_engaged {1 if self.mode == 'control' else 0}")
        if "pwm" in snap:
            lines.append(f"amdgpu_fan_ctl_original_pwm {float(snap['pwm']):g}")
        try:
            Path(self.metrics_file).write_text("\n".join(lines) + "\n")
        except OSError as exc:
            LOG.debug("写 metrics 失败: %s", exc)

    def step(self) -> None:
        decision = self.decide()
        self.last_decision = decision
        # 每轮都打印 GPU 最高温和利用率，不依赖是否临界 / 是否空闲
        temp = (
            "GPU 温度读不到"
            if decision.gpu_temp is None
            else f"GPU 最高 {decision.gpu_temp:g}°C"
        )
        LOG.info(
            "目标 %.0f%% | %s%s | %s 算力 %s 显存 %s | %s",
            decision.target_pwm,
            "接管" if decision.desired_manual else "不接管",
            " [临界]" if decision.critical else "",
            temp,
            _fmt_pct(decision.gpu_use),
            _fmt_pct(decision.gpu_mem_use),
            "；".join(decision.reasons) or "-",
        )
        self.apply(decision)
        self.write_metrics()


# --------------------------------------------------------------------------- #
# 命令行
# --------------------------------------------------------------------------- #
def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        description="用 AMD/ROCm GPU 温度驱动机箱风扇（默认只读，不写 PWM）",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    p.add_argument(
        "-c", "--config",
        help="TOML/JSON 配置文件。不给就依次找 ./config.toml 和脚本同目录的 config.toml；"
             "都没有则用内置默认值（mode=observe, dry_run=true）",
    )
    p.add_argument("--mode", choices=["observe", "control"], help="覆盖配置里的工作模式")
    p.add_argument("--dry-run", action="store_true", help="只打印决策，不写 PWM")
    p.add_argument("--live", action="store_true", help="关闭 dry_run（真的会写 PWM！）")
    p.add_argument("--once", action="store_true", help="只跑一个周期就退出")
    p.add_argument("--status", action="store_true", help="打印当前风扇状态 + GPU 温度")
    p.add_argument("--simulate", action="store_true", help="离线跑温度扫描，检查曲线（不碰硬件）")
    p.add_argument("--restore", action="store_true", help="把 PWM 恢复成快照里的值后退出")
    p.add_argument("--print-curves", action="store_true", help="打印所有曲线后退出")
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


def cmd_status(cfg: Config, gpu: RocmSmiGpuReader, bmc: IpmiClient) -> int:
    print(
        f"配置：{cfg.path or '（未找到配置文件，全部用内置默认值）'}"
        f"  模式={cfg['general']['mode']}  dry_run={cfg['general']['dry_run']}"
    )
    info = bmc.fan_info()
    print(f"风扇：PWM={info.get('PWMValue')}%（通道 PWM{cfg['bmc'].get('pwm_id')}）")
    fans = []
    for i in range(16):
        val = info.get(f"Fan{i}_Reading")
        if val:
            name = info.get(f"Fan{i}_Name") or f"Fan{i}"
            fans.append(f"{name}={val}rpm")
    print("转速：" + " ".join(fans))
    print(f"GPU：{gpu.describe()}")
    print(f"  读数：{gpu.read() or '拿不到（看上面的 WARNING）'}")
    compute, memory = gpu.usage()
    print(f"  GPU 利用率：算力 {_fmt_pct(compute)}  显存 {_fmt_pct(memory)}")
    return 0


def _dir_writable(path: Path) -> bool:
    """真的写一个探针文件。

    注意不能用 os.access(W_OK)：它只看权限位，**不会**发现只读挂载
    （例如把 /var/lib 挂成只读时仍然返回 True）。
    """
    probe = path / ".amdgpu-fan-ctl-write-test"
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

    顺序：配置值 → $XDG_STATE_HOME|~/.local/state/amdgpu-fan-ctl → $TMPDIR/amdgpu-fan-ctl-<uid>。
    落到临时目录只影响 --restore 的兜底快照，正常退出仍用内存里的快照还原。
    """
    path = Path(configured)
    if _dir_writable(path):
        return path
    candidates = [
        Path(os.environ.get("XDG_STATE_HOME") or (Path.home() / ".local" / "state")) / "amdgpu-fan-ctl",
        Path(tempfile.gettempdir()) / f"amdgpu-fan-ctl-{os.getuid()}",
    ]
    for fallback in candidates:
        if _dir_writable(fallback):
            LOG.warning(
                "state_dir %s 不可写，临时改用 %s"
                "（systemd 下检查 StateDirectory 是否已创建且属于服务用户，别让它落到临时目录）",
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
    cfg: Config, gpu: RocmSmiGpuReader, bmc: IpmiClient, live: bool, delta: float, seconds: float
) -> int:
    print("=== 1) GPU 温度源（rocm-smi）===")
    print(f"  {gpu.describe()}")
    temps = gpu.read()
    print(f"  读数：{temps if temps else '拿不到（看上面的 WARNING）'}")
    compute, memory = gpu.usage()
    print(f"  GPU 利用率：算力 {_fmt_pct(compute)}  显存 {_fmt_pct(memory)}")

    print("\n=== 2) 风扇现状 ===")
    info = bmc.fan_info()
    orig_pwm = float(info.get("PWMValue") or 0)
    before = _avg_rpm(info)
    print(f"  PWM{cfg['bmc'].get('pwm_id')}  PWM={orig_pwm:.0f}%  平均转速={before:.0f}rpm")

    print("\n=== 3) 脚本此刻会怎么决策 ===")
    ctrl = Controller(cfg, gpu, bmc, dry_run=True)
    ctrl.snapshot()  # 只读：把当前占空比记进 state_dir，供 --restore 用
    decision = ctrl.decide()
    print(f"  目标 PWM={decision.target_pwm:.0f}%  接管={decision.desired_manual}  临界={decision.critical}")
    print(f"  理由：{'; '.join(decision.reasons) if decision.reasons else '(无)'}")

    if not live:
        print("\n(dry-run) 到此为止，一个字节都没写。加 --live 才会真的试探。")
        return 0

    lo, hi = float(cfg["fan"]["min_pwm"]), float(cfg["fan"]["max_pwm"])
    target = min(max(orig_pwm + delta, lo), hi)
    print(f"\n=== 4) 试探：PWM {orig_pwm:.0f}% → {target:.0f}%，等 {seconds:.0f}s 看转速 ===")
    after = before
    bmc.set_pwm(target)
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
        print(f"\n=== 5) 还原原始 PWM={orig_pwm:.0f}% ===")
        bmc.set_pwm(orig_pwm)
        print("  已还原")
    ok = abs(after - before) >= 20
    print(
        "\n结论：" + (
            "风扇通道有效——PWM 改动确实带动了转速。"
            if ok else
            "转速没有明显变化。可能这个档位落在风扇调速死区，换个 --delta 再试。"
        )
    )
    return 0 if ok else 1


def cmd_simulate(cfg: Config) -> int:
    print("温度扫描（只算曲线，不碰硬件）：\n")
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
    except (OSError, tomllib.TOMLDecodeError, ValueError) as exc:
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
        # 显式覆盖配置里可能为 false 的 dry_run —— 只想看一眼、绝不写 PWM 时用
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
            "（mode=observe, dry_run=true，绝不写 PWM）。"
            "改过配置文件却不生效时先看这一行——用 -c <文件> 指定，"
            "或把 config.toml 放到当前工作目录。",
            Path(__file__).resolve().parent / "config.toml",
        )

    try:
        gpu = make_gpu_reader(cfg)
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

    bmc = IpmiClient(cfg["bmc"], auto_pwm=float(cfg["fan"]["max_pwm"]))

    if args.status:
        return cmd_status(cfg, gpu, bmc)
    if args.selftest:
        return cmd_selftest(cfg, gpu, bmc, args.live, args.delta, args.seconds)

    ctrl = Controller(cfg, gpu, bmc, dry_run=not args.live and bool(cfg["general"]["dry_run"]))
    if args.restore:
        ctrl.restore(snapshot_from_file=True)
        return 0

    LOG.info(
        "启动：模式=%s dry_run=%s 轮询=%.1fs",
        ctrl.mode,
        ctrl.dry_run,
        float(cfg["general"]["poll_interval"]),
    )
    if ctrl.mode == "observe":
        LOG.info("observe 模式：只读观察，不会写 PWM")
    if not ctrl.dry_run:
        try:
            ctrl.snapshot()
        except BmcError as exc:
            LOG.error("无法读取初始 PWM，拒绝在无快照的情况下接管: %s", exc)
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
