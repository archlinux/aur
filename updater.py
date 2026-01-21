#!/usr/bin/env python3

import json
import os
import re
import signal
import subprocess
import sys
import threading
from dataclasses import dataclass
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

# Constants
GITHUB_API_URL = "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest"
PKGBUILD_FILE = "PKGBUILD"
SRCINFO_FILE = ".SRCINFO"
HTTP_TIMEOUT = 15
BUILD_TIMEOUT = 600  # 10 minutes
USER_AGENT = "xmcl-package-updater/2.0"

# Colors
COLOR_RESET = "\033[0m"
COLOR_RED = "\033[91m"
COLOR_GREEN = "\033[92m"
COLOR_YELLOW = "\033[93m"
COLOR_BLUE = "\033[94m"


class Logger:
    """Provides colored console output"""

    @staticmethod
    def success(msg, *args):
        print(f"{COLOR_GREEN}✓ {msg % args}{COLOR_RESET}")

    @staticmethod
    def error(msg, *args):
        print(f"{COLOR_RED}✗ {msg % args}{COLOR_RESET}", file=sys.stderr)

    @staticmethod
    def info(msg, *args):
        print(f"{COLOR_YELLOW}ℹ {msg % args}{COLOR_RESET}")

    @staticmethod
    def action(msg, *args):
        print(f"{COLOR_BLUE}→ {msg % args}{COLOR_RESET}")


log = Logger()


@dataclass
class Config:
    """Application configuration"""

    http_timeout: int = HTTP_TIMEOUT
    build_timeout: int = BUILD_TIMEOUT


class HTTPClient:
    """Simple HTTP client using urllib"""

    def __init__(self, timeout):
        self.timeout = timeout

    def get_json(self, url):
        req = Request(url, headers={"User-Agent": USER_AGENT})
        try:
            with urlopen(req, timeout=self.timeout) as response:
                if response.status != 200:
                    raise Exception(f"HTTP {response.status}")
                data = response.read().decode("utf-8")
                return json.loads(data)
        except HTTPError as e:
            raise Exception(f"HTTP {e.code}: {e.reason}")
        except URLError as e:
            raise Exception(f"URL error: {e.reason}")


class FileManager:
    """Handles file operations"""

    @staticmethod
    def exists(path):
        return Path(path).exists()

    @staticmethod
    def read_lines(path):
        try:
            with open(path, "r") as f:
                return f.read().split("\n")
        except Exception as e:
            raise Exception(f"reading file {path}: {e}")

    @staticmethod
    def write_lines(path, lines):
        try:
            with open(path, "w") as f:
                f.write("\n".join(lines))
        except Exception as e:
            raise Exception(f"writing file {path}: {e}")


class CommandRunner:
    """Executes system commands"""

    @staticmethod
    def run(name, *args):
        proc = subprocess.Popen([name] + list(args), stdout=sys.stdout, stderr=sys.stderr)
        returncode = proc.wait()
        if returncode != 0:
            raise Exception(f"running {name}: exit code {returncode}")

    @staticmethod
    def run_with_output(name, *args):
        proc = subprocess.Popen([name] + list(args), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = proc.communicate()
        if proc.returncode != 0:
            raise Exception(f"running {name}: {stderr.decode()}")
        return stdout


class PKGBUILDUpdater:
    """Handles PKGBUILD modifications"""

    def __init__(self, fm):
        self.fm = fm

    def update_version(self, version):
        lines = self.fm.read_lines(PKGBUILD_FILE)

        version_num = version.lstrip("v")
        pkgver_regex = re.compile(r"^pkgver=.*$")
        pkgrel_regex = re.compile(r"^pkgrel=.*$")

        for i, line in enumerate(lines):
            trimmed = line.strip()
            if pkgver_regex.match(trimmed):
                lines[i] = f"pkgver={version_num}"
            elif pkgrel_regex.match(trimmed):
                lines[i] = "pkgrel=1"

        self.fm.write_lines(PKGBUILD_FILE, lines)


class ReleaseChecker:
    """Fetches latest version from GitHub"""

    def __init__(self, http_client):
        self.http_client = http_client

    def get_latest_version(self):
        try:
            release = self.http_client.get_json(GITHUB_API_URL)
            tag_name = release.get("tag_name")
            if not tag_name:
                raise Exception("no tag_name in API response")
            return tag_name
        except Exception as e:
            raise Exception(f"fetching latest release: {e}")


class UserInteraction:
    """Handles user prompts"""

    def __init__(self):
        self.cancelled = False

    def confirm_build(self):
        print("Build package now? [y/N]: ", end="", flush=True)

        if self.cancelled:
            return False

        try:
            response = input().strip().lower()
            return response in ("y", "yes")
        except (EOFError, KeyboardInterrupt):
            print()
            return False


class PackageBuilder:
    """Handles package building operations"""

    def __init__(self, cmd_runner, fm):
        self.cmd_runner = cmd_runner
        self.fm = fm
        self.build_process = None
        self.build_lock = threading.Lock()

    def update_checksums(self):
        self.cmd_runner.run("updpkgsums")

    def update_srcinfo(self):
        output = self.cmd_runner.run_with_output("makepkg", "--printsrcinfo")

        try:
            with open(SRCINFO_FILE, "wb") as f:
                f.write(output)
        except Exception as e:
            raise Exception(f"writing {SRCINFO_FILE}: {e}")

    def build_package(self, timeout):
        with self.build_lock:
            self.build_process = subprocess.Popen(
                ["makepkg", "-s"],
                stdout=sys.stdout,
                stderr=sys.stderr,
                preexec_fn=os.setpgrp,  # Create new process group
            )

        try:
            returncode = self.build_process.wait(timeout=timeout)
            if returncode != 0:
                raise Exception(f"makepkg failed with exit code {returncode}")
        except subprocess.TimeoutExpired:
            self.kill_build()
            raise Exception("build timeout")

    def kill_build(self):
        with self.build_lock:
            if self.build_process and self.build_process.poll() is None:
                try:
                    # Kill the process group
                    os.killpg(os.getpgid(self.build_process.pid), signal.SIGTERM)
                except (ProcessLookupError, PermissionError):
                    pass


class Application:
    """Main application"""

    def __init__(self, config):
        self.config = config
        http_client = HTTPClient(config.http_timeout)
        self.fm = FileManager()
        cmd_runner = CommandRunner()

        self.release_checker = ReleaseChecker(http_client)
        self.pkgbuild_updater = PKGBUILDUpdater(self.fm)
        self.package_builder = PackageBuilder(cmd_runner, self.fm)
        self.user_interaction = UserInteraction()
        self.cancelled = False

    def validate_environment(self):
        if not self.fm.exists(PKGBUILD_FILE):
            raise Exception(f"{PKGBUILD_FILE} not found in current directory")

        required_commands = ["updpkgsums", "makepkg"]
        for cmd in required_commands:
            if not self._command_exists(cmd):
                raise Exception(f"required command '{cmd}' not found in PATH")

    @staticmethod
    def _command_exists(cmd):
        from shutil import which

        return which(cmd) is not None

    def update_package_files(self, version):
        log.action("Updating PKGBUILD...")
        self.pkgbuild_updater.update_version(version)

        log.action("Updating checksums...")
        self.package_builder.update_checksums()

        log.action("Updating .SRCINFO...")
        self.package_builder.update_srcinfo()

    def run(self):
        # Validate environment
        self.validate_environment()

        # Get latest version
        log.action("Fetching latest version from GitHub...")
        try:
            version = self.release_checker.get_latest_version()
        except Exception as e:
            if self.cancelled:
                raise Exception("operation cancelled")
            raise Exception(f"getting latest version: {e}")

        if self.cancelled:
            raise Exception("operation cancelled")

        log.info("Latest version: %s", version)

        # Update package files
        try:
            self.update_package_files(version)
        except Exception as e:
            if self.cancelled:
                raise Exception("operation cancelled")
            raise e

        if self.cancelled:
            raise Exception("operation cancelled")

        log.success("Package files updated to version %s", version)

        # Ask user about building
        try:
            should_build = self.user_interaction.confirm_build()
        except Exception as e:
            raise Exception(f"getting user input: {e}")

        if self.cancelled:
            raise Exception("operation cancelled")

        if not should_build:
            log.info("Skipping package build")
            return

        # Build package
        log.action("Building package...")
        try:
            self.package_builder.build_package(self.config.build_timeout)
        except Exception as e:
            if self.cancelled:
                raise Exception("build cancelled")
            raise e

        if self.cancelled:
            raise Exception("build cancelled")

        log.success("Package built successfully!")

    def handle_interrupt(self, signum, frame):
        log.info("Interrupt received, cancelling...")
        self.cancelled = True
        self.user_interaction.cancelled = True
        self.package_builder.kill_build()
        sys.exit(1)


def main():
    config = Config()
    app = Application(config)

    # Handle interrupts
    signal.signal(signal.SIGINT, app.handle_interrupt)
    signal.signal(signal.SIGTERM, app.handle_interrupt)

    try:
        app.run()
    except Exception as e:
        log.error("%s", str(e))
        sys.exit(1)


if __name__ == "__main__":
    main()
