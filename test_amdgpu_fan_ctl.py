#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""amdgpu-fan-ctl 的离线逻辑自测：不碰硬件。

运行: python3 test_amdgpu_fan_ctl.py
"""

import io
import logging
import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from amdgpu_fan_ctl import (
    Config,
    Controller,
    Curve,
    GpuError,
    IpmiClient,
    RocmSmiGpuReader,
    cmd_selftest,
    cmd_status,
    make_gpu_reader,
    resolve_config_path,
    temp_label,
    _dir_writable,
    _pick_state_dir,
)

HERE = Path(__file__).resolve().parent

# 用例里故意造失败路径（远程 rc=255、rocm-smi 不存在、state_dir 只读），
# 这些 ERROR/WARNING 日志会盖住 unittest 结果，测试期间静音。
logging.disable(logging.CRITICAL)


def load_config(**overrides):
    """加载仓库里的 config.toml，但把 state_dir 指到临时目录（测试不写 /var/lib）。"""
    cfg = Config.load(str(HERE / "config.toml"))
    general = cfg.raw.setdefault("general", {})
    general["state_dir"] = tempfile.mkdtemp(prefix="amdgpu-fan-ctl-test-")
    general.update(overrides)
    return cfg


class FakeGpu:
    def __init__(self, temps, use=0.0, mem_use=0.0):
        self.temps = temps
        self.use = use
        self.mem_use = mem_use
        self.last_raw = {}

    def read(self):
        return dict(self.temps)

    def usage(self):
        return self.use, self.mem_use

    def raw_labels(self):
        return list(self.temps)

    def describe(self):
        return "fake-gpu"


class FakeBmc:
    def __init__(self):
        self.calls = []
        self.fail = False

    def fan_info(self):
        return {"PWMValue": 25, "Fan5_Reading": 4560, "Fan5_Name": "SYS_FAN_4"}

    def set_pwm(self, pwm):
        if self.fail:
            from amdgpu_fan_ctl import BmcError

            raise BmcError("模拟失败")
        self.calls.append(pwm)

    def hand_back(self):
        self.calls.append("hand_back")


def make(mode="control", temps=None, use=0.0, mem_use=0.0, dry_run=True):
    cfg = Config({"general": {
        "mode": mode,
        "dry_run": dry_run,
        "state_dir": tempfile.mkdtemp(prefix="amdgpu-fan-ctl-test-"),
    }})
    gpu = FakeGpu(temps or {}, use, mem_use)
    bmc = FakeBmc()
    return cfg, Controller(cfg, gpu, bmc, dry_run=dry_run), gpu, bmc


class TestCurve(unittest.TestCase):
    def test_interpolation_and_clamp(self):
        c = Curve("t", [[40, 20], [60, 40], [80, 80]])
        self.assertEqual(c.eval(30), 20)      # 低于起点 -> 钳到起点
        self.assertEqual(c.eval(50), 30)      # 线性插值
        self.assertEqual(c.eval(70), 60)
        self.assertEqual(c.eval(95), 80)      # 高于终点 -> 钳到终点
        self.assertEqual(c.eval(60), 40)      # 恰好落在节点

    def test_unsorted_input_is_sorted(self):
        c = Curve("t", [[80, 80], [40, 20]])
        self.assertEqual(c.eval(60), 50)


class TestAdaptiveGpuCurves(unittest.TestCase):
    """GPU 曲线必须跟着 critical_temp 伸缩，且 100% 正好落在临界点上。"""

    def _cfg(self, critical, min_pwm=20, max_pwm=100):
        return Config({
            "gpu": {"critical_temp": critical},
            "fan": {"min_pwm": min_pwm, "max_pwm": max_pwm},
        })

    def test_100_percent_lands_exactly_on_critical_temp(self):
        for critical in (45, 60, 75, 88, 95, 110):
            curve = self._cfg(critical).curves["gpu_junction"]
            self.assertEqual(curve.eval(critical), 100, f"critical_temp={critical}")
            self.assertLess(curve.eval(critical * 0.99), 100, "临界点之前不能提前满速")

    def test_starts_at_min_pwm(self):
        for critical in (60, 95):
            curve = self._cfg(critical).curves["gpu_junction"]
            self.assertEqual(curve.eval(critical * 0.45), 20)
            self.assertEqual(curve.eval(10), 20)

    def test_is_monotonic_without_cliffs(self):
        for critical in (60, 95):
            curve = self._cfg(critical).curves["gpu_junction"]
            values = [curve.eval(critical * i / 100) for i in range(30, 101)]
            self.assertEqual(values, sorted(values), "曲线必须单调")
            self.assertLessEqual(
                max(b - a for a, b in zip(values, values[1:])), 5,
                "critical_temp 之前不允许出现大台阶（否则观感就是跳变）",
            )

    def test_min_and_max_pwm_are_respected(self):
        curve = self._cfg(90, min_pwm=30, max_pwm=90).curves["gpu_junction"]
        self.assertEqual(curve.eval(0), 30)
        self.assertEqual(curve.eval(90), 90)

    def test_all_gpu_sensors_share_the_adaptive_shape(self):
        curves = self._cfg(95).curves
        for name in ("gpu_junction", "gpu_edge", "gpu_mem", "gpu_default"):
            self.assertEqual(curves[name].eval(95), 100, name)

    def test_explicit_curve_override_wins(self):
        cfg = Config({
            "gpu": {"critical_temp": 95},
            "curves": {"gpu_junction": {"points": [[50, 30], [70, 60]]}},
        })
        self.assertEqual(cfg.curves["gpu_junction"].eval(70), 60)


class TestDecision(unittest.TestCase):
    def test_idle_gpu_stays_low(self):
        _, ctrl, _, _ = make(temps={"junction": 45.0, "edge": 43.0, "mem": 44.0}, use=0)
        d = ctrl.decide()
        self.assertLessEqual(d.target_pwm, 28, "空闲时应当维持在低转速")

    def test_hot_gpu_raises_pwm(self):
        _, ctrl, _, _ = make(temps={"junction": 80.0, "edge": 70.0, "mem": 60.0}, use=50)
        d = ctrl.decide()
        self.assertGreaterEqual(d.target_pwm, 65)

    def test_gpu_critical_forces_max(self):
        _, ctrl, _, _ = make(temps={"junction": 60.0}, use=50)
        d = ctrl.decide()
        self.assertTrue(d.critical)
        self.assertEqual(d.target_pwm, 100)

    def test_below_60_does_not_force_max(self):
        _, ctrl, _, _ = make(temps={"junction": 59.5}, use=50)
        d = ctrl.decide()
        self.assertFalse(d.critical)
        self.assertLess(d.target_pwm, 100)

    def test_instantaneous_temperature_wins_over_smoothed(self):
        """平滑值还在 55°C，但瞬时值已 61°C 时必须立刻拉满。"""
        _, ctrl, gpu, _ = make(temps={"junction": 55.0}, use=0)
        gpu.last_raw = {"junction": 61.0}
        d = ctrl.decide()
        self.assertTrue(d.critical)
        self.assertEqual(d.target_pwm, 100)

    def test_gpu_unreadable_failsafe(self):
        _, ctrl, gpu, _ = make(temps={"junction": 50.0}, use=50)
        ctrl.decide()
        gpu.temps = {}
        for _ in range(3):
            d = ctrl.decide()
        self.assertGreaterEqual(d.target_pwm, 45)
        self.assertIn("fail-safe", " ".join(d.reasons))

    def test_observe_mode_never_engages(self):
        _, ctrl, _, _ = make(mode="observe", temps={"junction": 95.0}, use=50)
        self.assertFalse(ctrl.decide().desired_manual)


class TestConfigDiscovery(unittest.TestCase):
    """`-c` 没给的时候必须能找到 ./config.toml。

    回归的是真实踩过的坑：`-c` 原本没有默认值，`python3 amdgpu_fan_ctl.py`（不带 -c）
    会静默使用内置默认值 mode=observe/dry_run=true，于是同目录下改好的
    config.toml 根本没被读 —— 表现就是"我把 mode 改成 control、dry_run 改成 false，
    怎么不生效"。
    """

    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp(prefix="amdgpu-fan-ctl-cfg-"))
        self._old = os.getcwd()

    def tearDown(self):
        os.chdir(self._old)

    def test_explicit_path_always_wins(self):
        os.chdir(self.tmp)
        (self.tmp / "config.toml").write_text('[general]\nmode = "control"\n')
        self.assertEqual(resolve_config_path("/elsewhere/other.toml"), "/elsewhere/other.toml")

    def test_default_picks_cwd_config_toml(self):
        os.chdir(self.tmp)
        (self.tmp / "config.toml").write_text('[general]\nmode = "control"\ndry_run = false\n')
        path = resolve_config_path(None)
        self.assertEqual(path, "config.toml")
        cfg = Config.load(path)
        self.assertEqual(cfg["general"]["mode"], "control")
        self.assertFalse(cfg["general"]["dry_run"], "改过的 dry_run 必须真的被读到")
        self.assertTrue(cfg.path.endswith("config.toml"), "Config 要记住自己是从哪个文件来的")

    def test_falls_back_to_script_dir_config(self):
        os.chdir(self.tmp)  # 这里故意没有 config.toml
        with mock.patch("amdgpu_fan_ctl.__file__", str(HERE / "amdgpu_fan_ctl.py")):
            self.assertEqual(resolve_config_path(None), str(HERE / "config.toml"))

    def test_empty_when_no_config_anywhere(self):
        os.chdir(self.tmp)
        with mock.patch("amdgpu_fan_ctl.__file__", str(self.tmp / "nowhere" / "amdgpu_fan_ctl.py")):
            self.assertEqual(resolve_config_path(None), "")

    def test_no_config_means_builtin_defaults_observe_and_dry_run(self):
        cfg = Config.load("")
        self.assertEqual(cfg.path, "")
        self.assertEqual(cfg["general"]["mode"], "observe")
        self.assertIs(cfg["general"]["dry_run"], True)

    def test_cpu_fan_channels_are_rejected(self):
        """PWM0/PWM1 是 CPU 风扇通道，绝不允许写。"""
        for pwm_id in (0, 1):
            with self.assertRaises(ValueError):
                Config({"bmc": {"pwm_id": pwm_id}})

    def test_sys_fan_channels_are_accepted(self):
        for pwm_id in (2, 3, 4, 5):
            self.assertEqual(Config({"bmc": {"pwm_id": pwm_id}})["bmc"]["pwm_id"], pwm_id)


class TestStatusOutput(unittest.TestCase):
    """--status 的显示：风扇和 GPU 读数。"""

    def _run(self) -> str:
        cfg = load_config()
        buf = io.StringIO()
        with mock.patch("sys.stdout", buf):
            cmd_status(cfg, FakeGpu({"junction": 41.0}, 0.0), FakeBmc())
        return buf.getvalue()

    def test_shows_fan_and_gpu_readings(self):
        out = self._run()
        self.assertIn("PWM=25%", out)
        self.assertIn("SYS_FAN_4=4560rpm", out)
        self.assertIn("junction", out)

    def test_first_line_says_which_config_and_mode_is_in_use(self):
        """「改了配置不生效」时，第一眼就该能确认到底读了哪个文件、什么模式。"""
        first = self._run().splitlines()[0]
        self.assertIn("配置：", first)
        self.assertIn("config.toml", first)
        self.assertIn("模式=", first)
        self.assertIn("dry_run=", first)


class TestApply(unittest.TestCase):
    def test_ramp_down_is_limited(self):
        _, ctrl, _, _ = make(mode="control", temps={"junction": 45.0}, use=0)
        ctrl.last_written_pwm = 70.0
        ctrl.last_write_ts = 0.0
        ctrl.apply(type(ctrl.decide())(target_pwm=20.0, desired_manual=True))
        self.assertEqual(ctrl.last_written_pwm, 65.0, "每次最多降 ramp_down_step=5")

    def test_ramp_up_is_immediate(self):
        _, ctrl, _, _ = make(mode="control", temps={"junction": 45.0}, use=0)
        ctrl.last_written_pwm = 20.0
        ctrl.last_write_ts = 0.0
        ctrl.apply(type(ctrl.decide())(target_pwm=90.0, desired_manual=True))
        self.assertEqual(ctrl.last_written_pwm, 90.0, "升温必须立刻生效")

    def test_deadband_skips_write(self):
        _, ctrl, _, bmc = make(mode="control", temps={"junction": 45.0}, use=0, dry_run=False)
        ctrl.last_written_pwm = 50.0
        ctrl.last_write_ts = 0.0
        before = list(bmc.calls)
        ctrl.apply(type(ctrl.decide())(target_pwm=52.0, desired_manual=True))  # 差 2 < 3
        self.assertEqual(bmc.calls, before, "死区内不应写 PWM")

    def test_dry_run_never_touches_bmc(self):
        _, ctrl, _, bmc = make(mode="control", temps={"junction": 45.0}, use=0, dry_run=True)
        ctrl.step()
        self.assertEqual(bmc.calls, [], "dry-run 必须一个字节都不写 PWM")

    def test_observe_mode_never_touches_bmc(self):
        _, ctrl, _, bmc = make(mode="observe", temps={"junction": 95.0}, use=50, dry_run=False)
        for _ in range(3):
            ctrl.step()
        self.assertEqual(bmc.calls, [], "observe 模式必须只读")


class TestLogging(unittest.TestCase):
    def _step_log(self, ctrl) -> str:
        logging.disable(logging.NOTSET)
        try:
            with self.assertLogs("amdgpu-fan-ctl", level="INFO") as captured:
                ctrl.step()
        finally:
            logging.disable(logging.CRITICAL)
        return "\n".join(captured.output)

    def test_step_always_logs_hottest_and_utilisation(self):
        """低于 critical_temp 且 GPU 不空闲时，也必须打印温度和两种利用率。"""
        _, ctrl, _, _ = make(mode="observe", temps={"junction": 50.0}, use=42, mem_use=7)
        line = self._step_log(ctrl)
        self.assertIn("GPU 最高 50°C", line)
        self.assertIn("算力 42%", line)
        self.assertIn("显存 7%", line)

    def test_step_logs_unreadable_temperature(self):
        _, ctrl, _, _ = make(mode="observe", temps={}, use=-1, mem_use=-1)
        line = self._step_log(ctrl)
        self.assertIn("GPU 温度读不到", line)
        self.assertIn("算力 读不到", line)
        self.assertIn("显存 读不到", line)


class FakeCompleted:
    def __init__(self, stdout="", returncode=0, stderr=""):
        self.stdout = stdout
        self.stderr = stderr
        self.returncode = returncode


class TestGpuSource(unittest.TestCase):
    """温度源只有一个：rocm-smi -t。这些是本项目最容易出静默错数据的地方。"""

    ROCM_JSON = (
        '{"card0": {"Temperature (Sensor edge) (C)": "39.0",'
        ' "Temperature (Sensor junction) (C)": "42.0",'
        ' "Temperature (Sensor memory) (C)": "38.0",'
        ' "Temperature (Sensor HBM 0) (C)": "37.0",'
        ' "Temperature (Sensor HBM 3) (C)": "36.0"}}'
    )
    PROD_JSON = '{"card0": {"Card Series": "AMD Instinct MI210", "GFX Version": "gfx90a"}}'

    @classmethod
    def _fake_run(
        cls,
        temp_json,
        prod_json=None,
        use_json=(
            '{"card0": {"GPU use (%)": "7",'
            ' "GPU Memory Allocated (VRAM%)": "91",'
            ' "GPU Memory Read/Write Activity (%)": "13"}}'
        ),
    ):
        """按 argv 尾部把三种 rocm-smi 子命令分派开。"""
        prod_json = prod_json or cls.PROD_JSON

        def fake_run(argv, **kw):
            tail = " ".join(str(a) for a in argv)
            if "--showproductname" in tail:
                return FakeCompleted(prod_json)
            if "--showuse" in tail:
                return FakeCompleted(use_json)
            return FakeCompleted(temp_json)

        return fake_run

    # --- 传感器名的泛化解析（不再写死映射表） ---------------------------

    def test_temp_label_is_derived_not_hardcoded(self):
        self.assertEqual(temp_label("Temperature (Sensor junction) (C)"), "junction")
        self.assertEqual(temp_label("Temperature (Sensor edge) (C)"), "edge")
        self.assertEqual(temp_label("Temperature (Sensor memory) (C)"), "mem")
        self.assertEqual(temp_label("Temperature (Sensor HBM 0) (C)"), "hbm_0")
        self.assertEqual(temp_label("Temperature (Sensor HBM 10) (C)"), "hbm_10")
        self.assertEqual(temp_label("Temperature (Sensor GFX) (C)"), "gfx")
        self.assertIsNone(temp_label("GPU use (%)"))
        self.assertIsNone(temp_label("Temperature (Sensor edge)"))

    def test_reads_json_and_expands_every_sensor(self):
        reader = RocmSmiGpuReader("rocm-smi", 1.0)
        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=self._fake_run(self.ROCM_JSON)):
            self.assertEqual(
                reader.read(),
                {"edge": 39.0, "junction": 42.0, "mem": 38.0, "hbm_0": 37.0, "hbm_3": 36.0},
            )

    def test_read_keeps_raw_values_for_safety_threshold(self):
        """曲线用平滑值，但 60°C 硬阈值必须看瞬时值。"""
        reader = RocmSmiGpuReader("rocm-smi", 0.5)
        hot_json = '{"card0": {"Temperature (Sensor junction) (C)": "52.0"}}'
        with mock.patch("amdgpu_fan_ctl.subprocess.run", return_value=FakeCompleted(self.ROCM_JSON)):
            reader.read()
        self.assertEqual(reader.last_raw["junction"], 42.0)
        with mock.patch("amdgpu_fan_ctl.subprocess.run", return_value=FakeCompleted(hot_json)):
            smoothed = reader.read()
        self.assertEqual(reader.last_raw["junction"], 52.0, "last_raw 必须是瞬时值")
        self.assertEqual(smoothed["junction"], 47.0, "返回的仍是平滑值")

    # --- 决策层怎么用这些读数 -------------------------------------------

    def test_unknown_sensor_falls_back_to_gpu_default_curve(self):
        """新传感器（这里是 gfx）没有同名曲线时走 gpu_default，不能被静默丢掉。"""
        cfg, ctrl, _, _ = make(mode="observe", temps={"gfx": 59.0}, use=50)
        d = ctrl.decide()
        self.assertIn("gpu_gfx", " ".join(d.reasons))
        self.assertAlmostEqual(d.target_pwm, cfg.curves["gpu_default"].eval(59.0), places=1)

    def test_gpu_mem_curve_sees_the_hottest_hbm_stack(self):
        """gpu_mem 喂进去的是 max(memory, 所有 HBM 堆)——rocm-smi 的细节全用上。"""
        _, ctrl, _, _ = make(mode="observe", temps={"mem": 45.0, "hbm_0": 40.0, "hbm_3": 92.0}, use=50)
        d = ctrl.decide()
        self.assertEqual(ctrl.last_readings["gpu_mem"], 92.0)
        self.assertTrue(d.critical, "任何一路超临界都该算临界")
        self.assertEqual(d.target_pwm, 100.0)

    def test_idle_cap_also_requires_low_utilisation(self):
        """凉 + 算力和显存都没活儿才算空闲；只看温度会把正在跑的活儿热死。"""
        _, compute_busy, _, _ = make(mode="observe", temps={"junction": 50.0}, use=20)
        self.assertNotIn("GPU 空闲", " ".join(compute_busy.decide().reasons))
        _, mem_busy, _, _ = make(mode="observe", temps={"junction": 50.0}, use=0, mem_use=20)
        self.assertNotIn("GPU 空闲", " ".join(mem_busy.decide().reasons))
        _, idle, _, _ = make(mode="observe", temps={"junction": 50.0}, use=0, mem_use=0)
        self.assertIn("GPU 空闲", " ".join(idle.decide().reasons))

    def test_unreadable_utilisation_is_not_treated_as_idle(self):
        for use, mem_use in ((-1.0, 0.0), (0.0, -1.0), (-1.0, -1.0)):
            _, ctrl, _, _ = make(mode="observe", temps={"junction": 50.0}, use=use, mem_use=mem_use)
            self.assertNotIn(
                "GPU 空闲", " ".join(ctrl.decide().reasons), "任一利用率读不到时不能当空闲"
            )

    # --- rocm-smi 本身：利用率、报错、二进制缺失 -------------------------

    def test_usage_reads_compute_and_memory_activity(self):
        """算力和显存利用率要分开取；显存取 Read/Write Activity，不是 VRAM 占用率。"""
        reader = RocmSmiGpuReader("rocm-smi", 1.0)
        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=self._fake_run(self.ROCM_JSON)):
            self.assertEqual(reader.usage(), (7.0, 13.0))

    def test_usage_is_unknown_when_rocm_smi_fails(self):
        reader = RocmSmiGpuReader("rocm-smi", 1.0)
        with mock.patch(
            "amdgpu_fan_ctl.subprocess.run",
            return_value=FakeCompleted("", returncode=1, stderr="boom"),
        ):
            self.assertEqual(reader.usage(), (-1.0, -1.0))

    def test_error_output_is_not_mistaken_for_data(self):
        """rocm-smi 报错时不能把 stderr 里的 '{' 当 JSON 解析。"""
        reader = RocmSmiGpuReader("rocm-smi", 0.3)
        with mock.patch(
            "amdgpu_fan_ctl.subprocess.run",
            return_value=FakeCompleted("", returncode=1, stderr='{"error": "no such file"}'),
        ):
            self.assertEqual(reader.read(), {})
            self.assertIn("没返回 JSON", reader.last_error)

    def test_missing_binary_raises_gpu_error(self):
        """read() 会把 GpuError 吞成 {}（这是设计：读不到就该走 fail-safe），
        所以直接测底层 _run。"""
        reader = RocmSmiGpuReader("/nonexistent/rocm-smi", 1.0)
        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=FileNotFoundError):
            with self.assertRaises(GpuError):
                reader._run("-t")

    def test_timeout_raises_gpu_error(self):
        import subprocess

        reader = RocmSmiGpuReader("/opt/rocm/bin/rocm-smi", 1.0)
        with mock.patch(
            "amdgpu_fan_ctl.subprocess.run",
            side_effect=subprocess.TimeoutExpired(cmd="rocm-smi", timeout=1),
        ):
            with self.assertRaises(GpuError):
                reader._run("-t")

    def test_make_gpu_reader_uses_config(self):
        cfg = Config({"gpu": {"rocm_smi": "/tmp/rocm-smi", "timeout": 5, "smoothing": 0.5}})
        reader = make_gpu_reader(cfg)
        self.assertEqual(reader.binary, "/tmp/rocm-smi")
        self.assertEqual(reader.timeout, 5.0)
        self.assertEqual(reader.alpha, 0.5)

    # --- 守卫：通用温度源必须真的从代码里消失 -----------------------------

    def test_no_sysfs_or_kfd_left_in_source(self):
        src = (Path(__file__).resolve().parent / "amdgpu_fan_ctl.py").read_text(encoding="utf-8")
        for marker in ("/sys/class/drm", "/sys/class/kfd", "PCI_ID=", "nvidia-smi", "REMOTE_PROBE"):
            self.assertNotIn(marker, src, f"通用温度源残留：{marker}")


class TestSelfTest(unittest.TestCase):
    def test_selftest_dry_run_writes_nothing(self):
        cfg = load_config()
        bmc = FakeBmc()
        gpu = FakeGpu({"junction": 80.0}, use=50)
        with mock.patch("sys.stdout", new=io.StringIO()) as out:
            rc = cmd_selftest(cfg, gpu, bmc, live=False, delta=5.0, seconds=0.0)
        self.assertEqual(rc, 0)
        self.assertEqual(bmc.calls, [], "--selftest 不带 --live 时绝不能写 PWM")
        self.assertIn("dry-run", out.getvalue())

    def test_selftest_live_bumps_and_restores(self):
        cfg = load_config()
        bmc = FakeBmc()  # 原始 PWM=25%
        gpu = FakeGpu({"junction": 80.0}, use=50)
        with mock.patch("sys.stdout", new=io.StringIO()):
            cmd_selftest(cfg, gpu, bmc, live=True, delta=5.0, seconds=0.0)
        self.assertEqual(bmc.calls[0], 30.0, "应当试探 +5%")
        self.assertEqual(bmc.calls[-1], 25.0, "必须还原成原始的 25%")


class TestIpmiBackend(unittest.TestCase):
    """本地 ipmitool 后端：命令拼装和解析（泰安 S8030 的 OEM raw 命令）。"""

    def _client(self, auto_pwm=100):
        cfg = {"ipmitool": "ipmitool", "pwm_id": 5, "timeout": 1}
        return IpmiClient(cfg, auto_pwm=auto_pwm)

    def test_set_pwm_uses_tyan_oem_raw_command(self):
        bmc = self._client()
        calls = []

        def fake_run(argv, **kw):
            calls.append(argv)
            return FakeCompleted(" fd 19 00\n")

        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=fake_run):
            bmc.set_pwm(60)
        self.assertEqual(
            calls[0],
            ["ipmitool", "raw", "0x2e", "0x44", "0xfd", "0x19", "0x00", "0x05", "0x01", "0x3c"],
        )

    def test_hand_back_writes_max_pwm(self):
        bmc = self._client(auto_pwm=80)
        calls = []

        def fake_run(argv, **kw):
            calls.append(argv)
            return FakeCompleted("")

        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=fake_run):
            bmc.hand_back()
        self.assertEqual(calls[0][-2:], ["0x01", "0x50"], "无快照恢复时写回 80%")

    def test_fan_info_reads_duty_and_rpm(self):
        bmc = self._client()

        def fake_run(argv, **kw):
            if argv[1] == "raw":
                return FakeCompleted(" fd 19 00 01 64\n")
            return FakeCompleted(
                "CPU_FAN          | 1242 RPM          | ok\n"
                "SYS_FAN_1        | no reading        | ns\n"
                "SYS_FAN_4        | 8142 RPM          | ok\n"
            )

        with mock.patch("amdgpu_fan_ctl.subprocess.run", side_effect=fake_run):
            info = bmc.fan_info()
        self.assertEqual(info["PWMValue"], 100)
        self.assertNotIn("Fan0_Reading", info, "CPU_FAN 不属于本程序的管理范围")
        self.assertEqual(info["Fan5_Reading"], 8142, "SYS_FAN_4 -> Fan5，与 PWM id 对齐")
        self.assertEqual(info["Fan5_Name"], "SYS_FAN_4")


class TestStateDir(unittest.TestCase):
    def test_writable_dir_used_as_is(self):
        d = tempfile.mkdtemp(prefix="amdgpu-fan-ctl-state-")
        self.assertEqual(_pick_state_dir(d), Path(d))

    def test_readonly_dir_falls_back_to_tmp(self):
        """只读挂载下 os.access 会误报可写，必须靠真写探针发现——这条锁住该行为。"""
        with mock.patch("amdgpu_fan_ctl._dir_writable", side_effect=[False, False, True]):
            picked = _pick_state_dir("/var/lib/amdgpu-fan-ctl")
        self.assertEqual(picked, Path(tempfile.gettempdir()) / f"amdgpu-fan-ctl-{os.getuid()}")

    def test_dir_writable_rejects_missing_path(self):
        self.assertFalse(_dir_writable(Path("/proc/definitely/not/here")))


if __name__ == "__main__":
    unittest.main(verbosity=2)
