#!/usr/bin/env python3
"""Launch and manage a versioned ComfyUI instance."""

import json
import logging
import os
import shlex
import shutil
import subprocess
import sys
import tarfile
import tempfile
import time
import tomllib
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any, NoReturn

import yaml

PROJECT_NAME = "comfykick"
PROJECT_VERSION = "v1.7.5"
PROJECT_DIR = Path(__file__).resolve().parent

COMFYUI_REPO = "Comfy-Org/ComfyUI"

XDG_CACHE_HOME = Path(
    os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache")
)
XDG_CONFIG_HOME = Path(
    os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config")
)
XDG_DATA_HOME = Path(
    os.environ.get("XDG_DATA_HOME", Path.home() / ".local" / "share")
)

DEFAULTS = {
    "base_dir": XDG_DATA_HOME / PROJECT_NAME / "base",
    "cleanup_stale_comfyui": True,
    "comfyui_extra_options": [
        "--disable-xformers",
        "--fast",
        "--preview-method auto",
        "--use-pytorch-cross-attention",
    ],
    "enable_manager": True,
    "extra_model_paths_yaml": "",
    "extra_python_package": [],
    "github_token": "",
    "listen": "localhost",
    "output_dir": XDG_DATA_HOME / PROJECT_NAME / "output",
    "port": 8188,
    "prekick_exec": [],
    "pypi_list": [],
    "runtime_dir": XDG_CACHE_HOME / PROJECT_NAME,
    "update": True,
    "venv_cache_dir": XDG_DATA_HOME / PROJECT_NAME / "venv_cache",
    "version": "latest",
    "version_cache_dir": XDG_DATA_HOME / PROJECT_NAME / "version_cache",
}

SENSITIVE_KEYS = {"github_token"}

GITHUB_API_CODELOAD = (
    f"https://codeload.github.com/{COMFYUI_REPO}/tar.gz/{{}}"
)
GITHUB_API_COMMIT = (
    f"https://api.github.com/repos/{COMFYUI_REPO}/commits/{{}}"
)
GITHUB_API_LATEST = (
    f"https://api.github.com/repos/{COMFYUI_REPO}/releases/latest"
)

_SYSTEM_CONFIG_FILE = Path(f"/etc/{PROJECT_NAME}.toml")
_USER_CONFIG_FILE = (
    XDG_CONFIG_HOME / PROJECT_NAME / f"{PROJECT_NAME}.toml"
)
_DEV_CONFIG_FILE = PROJECT_DIR / "dev" / f"{PROJECT_NAME}.toml"

# Lower entries have higher priority.
_CONFIG_FILES = [
    _SYSTEM_CONFIG_FILE,
    _USER_CONFIG_FILE,
    _DEV_CONFIG_FILE,
]

_PATH_KEYS = (
    "base_dir",
    "output_dir",
    "runtime_dir",
    "venv_cache_dir",
    "version_cache_dir",
)

_API_TIMEOUT = 30
_DOWNLOAD_TIMEOUT = 60

_NETWORK_MAX_RETRIES = 3
_RETRY_DELAY = 60.0

_CLEANUP_STALE_DAYS = 30
_CLEANUP_MIN_THRESHOLD = 10

log = logging.getLogger(PROJECT_NAME)


def die(msg: str, *args: Any) -> NoReturn:
    log.error(msg, *args)
    sys.exit(1)


def check_user_config(config_path: Path) -> None:
    try:
        st = config_path.stat()
    except FileNotFoundError:
        log.warning(
            "User-level config [%s] does not exist.",
            config_path,
        )
        return

    if st.st_mode & 0o077:
        log.warning(
            "Permission of [%s] is too open! "
            "(current: %o, want: 600)",
            config_path,
            st.st_mode & 0o777,
        )


def _read_toml(path: Path) -> dict[str, Any]:
    try:
        with open(path, "rb") as f:
            data = tomllib.load(f)
    except PermissionError:
        log.warning(
            "Permission denied when reading [%s]; skipping.",
            path,
        )
        return {}
    except tomllib.TOMLDecodeError as exc:
        die("Failed to parse TOML in [%s]: %s", path, exc)

    if not isinstance(data, dict):
        die("Top-level of [%s] is not a TOML table.", path)

    cleaned = {}
    for key, value in data.items():
        if key in _PATH_KEYS:
            # Keep falsy values as a sentinel meaning
            # "use the built-in default".
            cleaned[key] = value
        elif isinstance(value, str) and not value.strip():
            continue
        else:
            cleaned[key] = value

    return cleaned


def _load_config(config_files: list[Path]) -> dict[str, Any]:
    config = dict(DEFAULTS)

    for path in config_files:
        if path.is_file():
            config.update(_read_toml(path))

    # Path-style keys that are falsy should fall back to the built-in
    # default rather than inherit from a lower-priority file.
    for key in _PATH_KEYS:
        if not config[key]:
            config[key] = DEFAULTS[key]
        config[key] = Path(config[key])

    # `github_token` falls back to the GITHUB_TOKEN environment variable
    # only when it is not explicitly set in the config files.
    if not config["github_token"]:
        config["github_token"] = os.environ.get("GITHUB_TOKEN", "")

    return config


def log_config(config: dict[str, Any]) -> None:
    lines = []

    for key in sorted(config):
        value = config[key]
        if key in SENSITIVE_KEYS and value:
            lines.append(f"       {key} = **REDACTED**")
        else:
            lines.append(f"       {key} = {value}")

    log.info("Loaded configuration:\n%s", "\n".join(lines))


def _resolve_extra_model_paths(config: dict[str, Any]) -> list[Path]:
    """Parse ``config['extra_model_paths_yaml']``.

    Returns the list of model sub-directories declared under sections
    with ``is_default: true``.

    Returns an empty list when:
    - the value is empty
    - the file does not exist
    - the yaml has no section with ``is_default: true``

    Exits with an error when:
    - the yaml cannot be parsed
    - the top-level is not a mapping
    - an ``is_default: true`` section has a missing or relative
      ``base_path``
    """
    raw = config["extra_model_paths_yaml"]
    if not raw:
        return []

    path = Path(raw)
    if not path.is_file():
        log.warning("extra_model_paths_yaml not found: %s", raw)
        return []

    try:
        with open(path, "r", encoding="utf-8") as f:
            data = yaml.safe_load(f)
    except yaml.YAMLError as exc:
        die("failed to parse %s: %s", raw, exc)

    # An empty file or a file that contains only comments yields ``None``
    # from ``yaml.safe_load``; treat that as "no sections defined".
    if data is None:
        return []

    if not isinstance(data, dict):
        die("%s must be a mapping at the top level.", raw)

    extra_dirs = set()

    for section_name, section in data.items():
        if not isinstance(section, dict):
            continue

        if section.get("is_default") is not True:
            continue

        base_path = section.get("base_path")
        if not (isinstance(base_path, str) and base_path):
            die(
                "section '%s' in %s is marked is_default "
                "but has no base_path.",
                section_name,
                raw,
            )

        if not Path(base_path).is_absolute():
            die(
                "section '%s' in %s has a relative base_path '%s'. "
                "Please use an absolute path.",
                section_name,
                raw,
                base_path,
            )

        for key, value in section.items():
            if key == "base_path":
                continue

            if isinstance(value, str):
                items = value.splitlines()
            elif isinstance(value, list):
                items = value
            else:
                continue

            for item in items:
                if not isinstance(item, str):
                    continue

                item = item.strip()
                if not item:
                    continue

                extra_dirs.add((Path(base_path) / item).resolve())

    return list(extra_dirs)


def create_directories(
    config: dict[str, Any], extra_dirs: list[Path]
) -> None:
    dirs = [
        config["base_dir"],
        config["base_dir"] / "custom_nodes",
        config["output_dir"],
        config["runtime_dir"],
        config["venv_cache_dir"],
        config["version_cache_dir"],
        *extra_dirs,
    ]

    for directory in dirs:
        directory.mkdir(parents=True, exist_ok=True)


def _api_request(
    url: str, github_token: str | None = None
) -> Any:
    req = urllib.request.Request(url)
    req.add_header("Accept", "application/vnd.github+json")

    if github_token:
        req.add_header("Authorization", f"Bearer {github_token}")

    last_exc = None
    for attempt in range(_NETWORK_MAX_RETRIES + 1):
        try:
            with urllib.request.urlopen(
                req,
                timeout=_API_TIMEOUT,
            ) as resp:
                return json.load(resp)
        except urllib.error.HTTPError as exc:
            body = exc.read().decode("utf-8", errors="replace")
            exc.close()
            if exc.code in (403, 429) or exc.code >= 500:
                last_exc = exc
            else:
                die(
                    "HTTP error while requesting <%s>: %s %s [%s]",
                    url,
                    exc.code,
                    exc.reason,
                    body,
                )
        except TimeoutError as exc:
            last_exc = exc
        except urllib.error.URLError as exc:
            last_exc = exc
        except json.JSONDecodeError as exc:
            die("Failed to parse JSON response from %s: %s", url, exc)
        except OSError as exc:
            last_exc = exc

        if attempt < _NETWORK_MAX_RETRIES:
            log.warning(
                "Request to <%s> failed: %s; "
                "retrying in %.1fs (attempt %d/%d)",
                url,
                last_exc,
                _RETRY_DELAY,
                attempt + 1,
                _NETWORK_MAX_RETRIES,
            )
            time.sleep(_RETRY_DELAY)

    die(
        "Request to <%s> failed after %d attempt(s): %s",
        url,
        _NETWORK_MAX_RETRIES + 1,
        last_exc,
    )


def _resolve_version(
    config: dict[str, Any], version_cache_dir: Path
) -> tuple[str, str | None, str | None]:
    """Resolve the ComfyUI version head and tarball URL."""
    version_head = [config["version"]]

    update = config["update"]
    github_token = config["github_token"]

    # TODO: Fetch the latest release version from both the comfy.org API
    # (https://api.comfy.org/releases?project=comfyui&locale=zh)
    # and the GitHub API, then race the two to decide the final version.
    if update:
        tag_name = None
        if version_head[0] == "latest":
            data = _api_request(
                GITHUB_API_LATEST,
                github_token=github_token,
            )
            tag_name = data["tag_name"]
            version_head.append(tag_name)

        data = _api_request(
            GITHUB_API_COMMIT.format(version_head[-1]),
            github_token=github_token,
        )
        version_head.append(data["sha"])

        return (
            version_head[-1],
            GITHUB_API_CODELOAD.format(version_head[-1]),
            tag_name,
        )

    version_tarball = version_cache_dir / f"{version_head[0]}.tar.gz"

    if not version_tarball.exists():
        die(
            "No cached '%s' version and update is disabled.",
            version_head[0],
        )

    if version_tarball.is_symlink():
        cached_version = version_tarball.readlink().name[: -len(".tar.gz")]
        version_head.append(cached_version)
    else:
        return version_head[0], None, None

    return version_head[-1], None, None


def download_tarball(
    tarball_url: str, tarball_path: Path, github_token: str
) -> None:
    tmp_dir = tempfile.gettempdir()
    prefix = "comfykick_downloading_"

    for stale in Path(tmp_dir).glob(f"{prefix}*"):
        if stale.is_file():
            stale.unlink(missing_ok=True)

    last_exc = None
    for attempt in range(_NETWORK_MAX_RETRIES + 1):
        tmp_path = None
        try:
            with tempfile.NamedTemporaryFile(
                prefix=prefix,
                dir=tmp_dir,
                delete=False,
            ) as tmp:
                tmp_path = Path(tmp.name)

                req = urllib.request.Request(tarball_url)
                if github_token:
                    req.add_header(
                        "Authorization",
                        f"Bearer {github_token}",
                    )

                with urllib.request.urlopen(
                    req,
                    timeout=_DOWNLOAD_TIMEOUT,
                ) as resp:
                    shutil.copyfileobj(resp, tmp, length=1024 * 64)

            shutil.move(tmp_path, tarball_path)
            return
        except urllib.error.HTTPError as exc:
            body = exc.read().decode("utf-8", errors="replace")
            exc.close()
            if exc.code in (403, 429) or exc.code >= 500:
                last_exc = exc
            else:
                die(
                    "HTTP error while downloading <%s>: %s %s [%s]",
                    tarball_url,
                    exc.code,
                    exc.reason,
                    body,
                )
        except (urllib.error.URLError, TimeoutError, OSError) as exc:
            last_exc = exc
        finally:
            if tmp_path is not None:
                tmp_path.unlink(missing_ok=True)

        if attempt < _NETWORK_MAX_RETRIES:
            log.warning(
                "Failed to download <%s>: %s; "
                "retrying in %.1fs (attempt %d/%d)",
                tarball_url,
                last_exc,
                _RETRY_DELAY,
                attempt + 1,
                _NETWORK_MAX_RETRIES,
            )
            time.sleep(_RETRY_DELAY)

    die(
        "Failed to download <%s> after %d attempt(s): %s",
        tarball_url,
        _NETWORK_MAX_RETRIES + 1,
        last_exc,
    )


def _ensure_tarball(
    config: dict[str, Any],
    version_head: str,
    version_cache_dir: Path,
    tarball_url: str | None = None,
    refresh: bool = False,
) -> Path:
    """Ensure the tarball for ``version_head`` exists in cache."""
    tarball_name = f"{version_head}.tar.gz"
    tarball_path = version_cache_dir / tarball_name
    version = config["version"]
    version_link = version_cache_dir / f"{version}.tar.gz"
    github_token = config["github_token"]

    # Maintain a "<version>.tar.gz" symlink when version and version_head
    # differ, except when version is a prefix of version_head (e.g. a short
    # commit SHA that resolves to the same full SHA).
    need_symlink = not version_head.startswith(version)

    if refresh:
        log.info("Refreshing cached tarball for %s ...", version_head)
        tarball_path.unlink(missing_ok=True)

    if not tarball_path.exists():
        if tarball_url is None:
            die(
                "Cached tarball for %s is missing or corrupted, "
                "and update is disabled.",
                version_head,
            )

        log.info("Downloading ComfyUI %s ...", version_head)
        download_tarball(tarball_url, tarball_path, github_token)

    if need_symlink:
        version_link.unlink(missing_ok=True)
        version_link.symlink_to(tarball_name)

    return tarball_path


def cleanup_stale_tarballs(
    version_cache_dir: Path,
    exempt_names: set[str] | None = None,
) -> None:
    """Remove tarballs older than ``_CLEANUP_STALE_DAYS`` days from
    ``version_cache_dir``.

    Tarballs that are the target of a symlink in ``version_cache_dir``
    are exempt, as well as any names in ``exempt_names``.
    """
    exempt = set(exempt_names) if exempt_names else set()
    entries = list(version_cache_dir.glob("*.tar.gz"))

    # First pass: collect symlink targets into the exempt set.
    for entry in entries:
        if entry.is_symlink():
            try:
                target = os.readlink(entry)
            except OSError:
                continue
            exempt.add(Path(target).name)

    # Second pass: collect stale candidates.
    cutoff = time.time() - _CLEANUP_STALE_DAYS * 24 * 3600
    candidates = []

    for entry in entries:
        if entry.is_symlink() or entry.name in exempt:
            continue
        try:
            mtime = entry.stat().st_mtime
        except OSError:
            continue
        if mtime < cutoff:
            candidates.append((mtime, entry))

    if len(candidates) < _CLEANUP_MIN_THRESHOLD:
        log.info(
            "Skipping cleanup: only %d stale tarball(s) found "
            "(threshold: %d).",
            len(candidates),
            _CLEANUP_MIN_THRESHOLD,
        )
        return

    for mtime, entry in sorted(candidates):
        log.info("Removing stale tarball: %s", entry.name)
        try:
            entry.unlink()
        except OSError:
            log.warning("Failed to remove %s", entry.name)


def _extract_tarball(
    tarball_path: Path,
    parent_dir: Path,
    prefix: str,
) -> Path | None:
    """Extract ``tarball_path`` into a fresh temporary directory.

    Returns the directory containing the extracted tree, or ``None``
    when extraction fails.

    The temporary directory is created under ``parent_dir`` and removed
    on failure.
    """
    try:
        dest_dir = Path(tempfile.mkdtemp(prefix=prefix, dir=parent_dir))
    except OSError as exc:
        die(
            "Failed to create temporary extraction directory under %s: %s",
            parent_dir,
            exc,
        )

    try:
        with tarfile.open(tarball_path, "r:gz") as tar:
            tar.extractall(dest_dir, filter="data")
    except (tarfile.TarError, OSError, EOFError) as exc:
        log.warning(
            "Failed to extract %s: %s; treating as corrupted.",
            tarball_path,
            exc,
        )
        shutil.rmtree(dest_dir, ignore_errors=True)
        return None

    entries = list(dest_dir.iterdir())
    if len(entries) == 1 and entries[0].is_dir():
        return entries[0]

    return dest_dir


def _run(
    cmd: list[str] | str,
    *,
    cwd: str,
    env: dict[str, str],
    shell: bool = False,
) -> None:
    """Run a command, streaming its output through the logger."""
    display = cmd if shell else shlex.join(cmd)
    log.info("Running command: [%s]", display)

    with subprocess.Popen(
        cmd,
        shell=shell,
        cwd=cwd,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    ) as process:
        assert process.stdout is not None
        for line in iter(process.stdout.readline, ""):
            line = line.rstrip()
            if line:
                log.info("%s", line)
        return_code = process.wait()

    if return_code != 0:
        raise subprocess.CalledProcessError(return_code, cmd)


def install_dependencies(
    extracted_dir: Path,
    config: dict[str, Any],
    version_head: str,
) -> None:
    """Install dependencies with uv.

    No multi-instance race: comfykick runs exclusively as a systemd
    user unit, which serializes ``ExecStart=`` activations. A second
    ``systemctl --user start`` of the same unit is enqueued, never
    parallelized.

    Each user also has their own ``XDG_DATA_HOME`` namespace, so there
    is no inter-user contention on ``venv_cache_dir`` either.
    """
    env = os.environ.copy()
    if config["pypi_list"]:
        env["UV_INDEX"] = " ".join(config["pypi_list"])

    venv_cache_dir = config["venv_cache_dir"]
    venv_link = extracted_dir / ".venv"

    if venv_link.is_symlink():
        venv_link.unlink()
    elif venv_link.exists():
        shutil.rmtree(venv_link)

    venv_link.symlink_to(venv_cache_dir)

    def run(cmd: list[str]) -> None:
        _run(cmd, cwd=str(extracted_dir), env=env)

    run(["uv", "--quiet", "venv", "--allow-existing"])
    run(["uv", "--quiet", "sync", "--inexact"])

    log.info("Installing basic dependencies ...")
    run(["uv", "add", "--requirements", "requirements.txt"])

    if config["enable_manager"]:
        manager_req = extracted_dir / "manager_requirements.txt"
        if not manager_req.exists():
            die(
                "manager_requirements.txt is missing from "
                "ComfyUI <%s>. This is unexpected; Please report "
                "a bug to %s repo",
                version_head,
                PROJECT_NAME,
            )

        log.info("Installing manager dependencies ...")
        run(
            [
                "uv",
                "add",
                "--requirements",
                "manager_requirements.txt",
            ]
        )

    extra_pkgs = config["extra_python_package"]
    if extra_pkgs:
        log.info("Installing extra packages ...")
        for pkg in extra_pkgs:
            run(["uv", "add", "--no-build-isolation", pkg])

    log.info("Syncing venv packages ...")
    run(["uv", "sync"])


def run_prekick_commands(
    config: dict[str, Any], extracted_dir: Path
) -> None:
    """Run trusted shell commands from ``prekick_exec``.

    Security note: ``shell=True`` is intentional and safe in this
    context.

    Rationale:
    1. comfykick is a single-user, user-privileged launcher. The only
       writer of ``prekick_exec`` is the same principal that invokes
       this script, so there is no privilege boundary to cross and no
       untrusted input flowing into the shell string.
    2. ``prekick_exec`` is, by design, a trusted shell command field,
       semantically on par with systemd's ``ExecStartPre=``, Kubernetes
       lifecycle exec, or a Makefile rule.

    Escaping or shlex-quoting ``cmd`` would actively break the feature,
    for example ``$(date)``, pipes, redirections, and environment
    expansion are all expected.
    """
    prekick_cmds = config["prekick_exec"]
    if not prekick_cmds:
        return

    env = os.environ.copy()

    for cmd in prekick_cmds:
        if not isinstance(cmd, str) or not cmd.strip():
            continue

        _run(cmd, cwd=str(extracted_dir), env=env, shell=True)


def launch_comfyui(
    config: dict[str, Any], extracted_dir: Path
) -> NoReturn:
    env = os.environ.copy()

    args = [
        "uv",
        "--directory",
        str(extracted_dir),
        "run",
        "main.py",
        "--base-directory",
        str(config["base_dir"]),
        "--listen",
        str(config["listen"]),
        "--output-directory",
        str(config["output_dir"]),
        "--port",
        str(config["port"]),
        "--temp-directory",
        str(config["runtime_dir"]),
    ]

    if config["extra_model_paths_yaml"]:
        args.extend(
            [
                "--extra-model-paths-config",
                str(config["extra_model_paths_yaml"]),
            ]
        )

    if config["enable_manager"]:
        args.append("--enable-manager")

    for opt in config["comfyui_extra_options"]:
        args.extend(shlex.split(opt))

    os.execvpe("uv", args, env)


def main() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="[%(levelname)s] %(message)s",
    )

    if sys.version_info < (3, 12):
        die(
            "Python 3.12+ is required (detected %d.%d).",
            sys.version_info.major,
            sys.version_info.minor,
        )

    if shutil.which("uv") is None:
        die("'uv' is not installed or not in PATH.")

    if Path(__file__).resolve() != (
        Path("/usr/share") / PROJECT_NAME / f"{PROJECT_NAME}.py"
    ):
        log.warning("ComfyKick is running from [%s].", Path(__file__))

    log.info("Starting %s %s", PROJECT_NAME, PROJECT_VERSION)

    check_user_config(_USER_CONFIG_FILE)
    config = _load_config(_CONFIG_FILES)
    log_config(config)

    if not config["github_token"]:
        log.info("Running without GitHub token.")

    extra_dirs = _resolve_extra_model_paths(config)
    create_directories(config, extra_dirs)

    version_cache_dir = config["version_cache_dir"]
    version_head, tarball_url, tag_name = _resolve_version(
        config,
        version_cache_dir,
    )

    tarball_path = _ensure_tarball(
        config,
        version_head,
        version_cache_dir,
        tarball_url=tarball_url,
    )

    if config["cleanup_stale_comfyui"]:
        cleanup_stale_tarballs(
            version_cache_dir,
            exempt_names={tarball_path.name},
        )

    log.info("Extracting ComfyUI %s ...", version_head)

    prefix = f"_run-{version_head}-"
    runtime_dir = config["runtime_dir"]

    for old in runtime_dir.iterdir():
        if old.is_dir() and old.name.startswith("_run-"):
            shutil.rmtree(old, ignore_errors=True)

    extracted_dir = _extract_tarball(tarball_path, runtime_dir, prefix)
    if extracted_dir is None:
        log.info("Re-preparing tarball for %s ...", version_head)

        tarball_path = _ensure_tarball(
            config,
            version_head,
            version_cache_dir,
            tarball_url=tarball_url,
            refresh=True,
        )

        extracted_dir = _extract_tarball(tarball_path, runtime_dir, prefix)
        if extracted_dir is None:
            die(
                "Re-preparing tarball for %s is still corrupted; "
                "giving up.",
                version_head,
            )

    # hack. See <https://github.com/Comfy-Org/ComfyUI/issues/8764>
    (extracted_dir / "user").mkdir(exist_ok=True)

    install_dependencies(extracted_dir, config, version_head)
    run_prekick_commands(config, extracted_dir)

    log.info(
        "Kicking ComfyUI %s (%s) on http://%s:%s ...",
        config["version"],
        tag_name or version_head,
        config["listen"],
        config["port"],
    )

    launch_comfyui(config, extracted_dir)


if __name__ == "__main__":
    main()
