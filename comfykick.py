#!/usr/bin/env python3

import json
import logging
import os
import shlex
import shutil
import subprocess
import sys
import tarfile
import tempfile
import tomllib
import urllib.error
import urllib.request
from pathlib import Path

import yaml

PROJECT_NAME = "comfykick"

PROJECT_VERSION = "v1.4.2"

PROJECT_DIR = Path(__file__).resolve().parent

COMFYUI_REPO = "Comfy-Org/ComfyUI"

XDG_CACHE_HOME = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache"))
XDG_CONFIG_HOME = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
XDG_DATA_HOME = Path(os.environ.get("XDG_DATA_HOME", Path.home() / ".local" / "share"))

DEFAULTS = {
    "base_dir": XDG_DATA_HOME / PROJECT_NAME / "base",
    "comfyui_extra_options": [
        "--disable-xformers",
        "--fast",
        "--preview-method auto",
        "--use-pytorch-cross-attention",
        "--verbose WARNING",
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

# Lower entries have higher priority.
CONFIG_FILES = [
    Path(f"/etc/{PROJECT_NAME}.toml"),
    XDG_CONFIG_HOME / PROJECT_NAME / f"{PROJECT_NAME}.toml",
    PROJECT_DIR / "dev" / f"{PROJECT_NAME}.toml",
]


log = logging.getLogger(PROJECT_NAME)


def die(msg, *args):
    log.error(msg, *args)
    sys.exit(1)


def check_user_config(config_path):
    try:
        st = config_path.stat()
        if st.st_mode & 0o077:
            log.warning(
                "Permission of [%s] is too open! (current: %o, want: 600)",
                config_path, st.st_mode & 0o777,
            )
    except FileNotFoundError:
        log.warning(
            "User-level config [%s] does not exist.",
            config_path,
        )


# Path-style options: an explicit "" is a sentinel meaning
# "use the built-in default" rather than "inherit from a lower-priority
# layer". Other keys drop "" so that omitting them still inherits.
_PATH_KEYS = (
    "base_dir",
    "output_dir",
    "runtime_dir",
    "venv_cache_dir",
    "version_cache_dir",
)


def _read_toml(path):
    try:
        with open(path, "rb") as f:
            data = tomllib.load(f)
    except PermissionError:
        log.warning("Permission denied when reading [%s]; skipping.", path)
        return {}
    except tomllib.TOMLDecodeError as e:
        die("Failed to parse TOML in [%s]: %s", path, e)

    if not isinstance(data, dict):
        die("Top-level of [%s] is not a TOML table.", path)

    cleaned = {}
    for key, value in data.items():
        if key in _PATH_KEYS:
            # Keep "" as a sentinel meaning "use the built-in default"
            # instead of dropping it.
            cleaned[key] = value
        elif isinstance(value, str) and value.strip() == "":
            continue
        else:
            cleaned[key] = value
    return cleaned


def _load_config(config_files):
    config = dict(DEFAULTS)
    for path in config_files:
        if path.is_file():
            config = {**config, **_read_toml(path)}

    # Path-style keys explicitly set to "" should fall back to the
    # built-in default rather than inherit from a lower-priority file.
    for key in _PATH_KEYS:
        if config.get(key) == "":
            config[key] = DEFAULTS[key]

    # `github_token` falls back to the GITHUB_TOKEN environment variable
    # only when it is not explicitly set in the config files.
    if not config.get("github_token"):
        config["github_token"] = os.environ.get("GITHUB_TOKEN", "")

    return config


def _resolve_extra_model_paths(config):
    """Parse ``config['extra_model_paths_yaml']`` and return the list of
    model sub-directories declared under sections with
    ``is_default: true``.

    Returns an empty list when:
      - the value is empty
      - the file does not exist
      - the yaml has no section with ``is_default: true``

    Exits with an error when:
      - the yaml cannot be parsed
      - the top-level is not a mapping
      - a ``is_default: true`` section has a missing or relative ``base_path``
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
    except yaml.YAMLError as e:
        die("failed to parse %s: %s", raw, e)

    # An empty file or a file that contains only comments yields ``None``
    # from ``yaml.safe_load``; treat that as "no sections defined".
    if data is None:
        return []
    if not isinstance(data, dict):
        die("%s must be a mapping at the top level.", raw)

    extra_dirs = []
    for section_name, section in data.items():
        if not isinstance(section, dict):
            continue
        if section.get("is_default") is not True:
            continue
        base_path = section.get("base_path")
        if not (isinstance(base_path, str) and base_path):
            die(
                "section '%s' in %s is marked is_default but has no base_path.",
                section_name, raw,
            )
        if not Path(base_path).is_absolute():
            die(
                "section '%s' in %s has a relative base_path '%s'. "
                "Please use an absolute path.",
                section_name, raw, base_path,
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
                extra_dirs.append(Path(base_path) / item)
    return extra_dirs


def create_directories(config, extra_dirs):
    dirs = [
        config["base_dir"],
        config["base_dir"] / "custom_nodes",
        config["output_dir"],
        config["runtime_dir"],
        config["venv_cache_dir"],
        config["version_cache_dir"],
        *extra_dirs,
    ]
    for d in dirs:
        Path(d).mkdir(parents=True, exist_ok=True)


def _api_request(url, github_token=None):
    timeout = 30
    req = urllib.request.Request(url)
    req.add_header("Accept", "application/vnd.github+json")
    if github_token:
        req.add_header("Authorization", f"Bearer {github_token}")
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return json.load(resp)
    except TimeoutError:
        die("Timed out after %s seconds while requesting %s", timeout, url)
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8", errors="replace")
        die(
            "HTTP error while requesting %s: %s %s (response: %s)",
            url, e.code, e.reason, body
        )
    except urllib.error.URLError as e:
        die("Connection error while requesting %s: %s", url, e)
    except json.JSONDecodeError as e:
        die("Failed to parse JSON response from %s: %s", url, e)
    except OSError as e:
        die("Error while requesting %s: %s", url, e)
    return None


def _resolve_version(config, version_cache_dir):
    # Determine which ComfyUI ``version_head`` (a tag name, branch name, or
    # 40-char commit hash) will be run, and which tarball URL to use.
    version = config["version"]
    update = config["update"]
    github_token = config["github_token"]

    # TODO: Fetch the latest release version from both the comfy.org API
    # (https://api.comfy.org/releases?project=comfyui&locale=zh) and the
    # GitHub API, then race the two to decide the final version to use.
    GITHUB_API_LATEST = f"https://api.github.com/repos/{COMFYUI_REPO}/releases/latest"
    CODELOAD_URL_TEMPLATE = f"https://codeload.github.com/{COMFYUI_REPO}/tar.gz/{{}}"

    # "latest" -- always consult the GitHub releases API when updating,
    # otherwise rely on the cached ``latest`` symlink.
    if version == "latest":
        if update:
            data = _api_request(GITHUB_API_LATEST, github_token=github_token)
            if data is None:
                die(
                    "Failed to fetch latest version from GitHub API. "
                    "This is unexpected, Please report a bug to %s repo.",
                    PROJECT_NAME,
                )
            latest_tag = data["tag_name"]
            return latest_tag, CODELOAD_URL_TEMPLATE.format(latest_tag)
        latest_link = version_cache_dir / "latest"
        if not latest_link.is_symlink():
            die("No cached 'latest' version and update is disabled.")
        cached_version = latest_link.readlink().name[: -len(".tar.gz")]
        return cached_version, None

    if update:
        return version, CODELOAD_URL_TEMPLATE.format(version)

    return version, None


def _ensure_tarball(config, version_head, version_cache_dir, tarball_url=None, refresh=False):
    # Make sure the tarball for ``version_head`` is present in the cache directory.

    tarball_name = f"{version_head}.tar.gz"
    tarball_path = version_cache_dir / tarball_name
    github_token = config["github_token"]
    is_latest = (config["version"] == "latest")

    if refresh:
        log.info("Refreshing cached tarball for %s ...", version_head)
        tarball_path.unlink(missing_ok=True)
        if is_latest:
            (version_cache_dir / "latest").unlink(missing_ok=True)

    if not tarball_path.exists():
        if tarball_url is None:
            die(
                "Cached tarball for %s is missing or corrupted, "
                "and update is disabled.",
                version_head,
            )
        log.info("Downloading ComfyUI %s ...", version_head)
        try:
            with tempfile.NamedTemporaryFile(
                prefix=f"comfykick_{version_head}.tar.gz_",
                dir=tempfile.gettempdir(),
                delete=False,
            ) as tmp:
                tmp_path = Path(tmp.name)
                req = urllib.request.Request(tarball_url)
                if github_token:
                    req.add_header("Authorization", f"Bearer {github_token}")
                with urllib.request.urlopen(req, timeout=60) as resp:
                    shutil.copyfileobj(resp, tmp, length=1024 * 64)
            shutil.move(tmp_path, tarball_path)
        except (urllib.error.URLError, OSError):
            tmp_path.unlink(missing_ok=True)
            raise

    if is_latest:
        latest_link = version_cache_dir / "latest"
        if latest_link.is_symlink() or latest_link.is_file():
            latest_link.unlink()
        latest_link.symlink_to(tarball_name)

    return tarball_path


def _extract_tarball(tarball_path, dest_dir):
    try:
        with tarfile.open(tarball_path, "r:gz") as tar:
            tar.extractall(dest_dir, filter="data")
    except (tarfile.TarError, OSError, EOFError) as e:
        log.warning(
            "Failed to extract %s: %s; treating as corrupted.",
            tarball_path, e,
        )
        shutil.rmtree(dest_dir, ignore_errors=True)
        return None

    entries = list(dest_dir.iterdir())
    if len(entries) == 1 and entries[0].is_dir():
        return entries[0]

    return dest_dir


def install_dependencies(extracted_dir, config, version_head):
    # No multi-instance race: comfykick runs exclusively as a systemd
    # *user* unit, which serializes ``ExecStart=`` activations -- a
    # second ``systemctl --user start`` of the same unit is enqueued,
    # never parallelized. Each user also has their own ``XDG_DATA_HOME``
    # namespace, so there is no inter-user contention on
    # ``venv_cache_dir`` either.
    env = os.environ.copy()

    if config["pypi_list"]:
        env["UV_INDEX"] = " ".join(config["pypi_list"])

    venv_cache_dir = Path(config["venv_cache_dir"])
    venv_link = extracted_dir / ".venv"
    if venv_link.is_symlink():
        venv_link.unlink()
    elif venv_link.exists():
        shutil.rmtree(venv_link)
    venv_link.symlink_to(venv_cache_dir)

    def run(cmd):
        subprocess.run(cmd, cwd=str(extracted_dir), env=env, check=True)

    run(["uv", "--quiet", "venv", "--allow-existing"])
    run(["uv", "--quiet", "sync", "--inexact"])

    log.info("Installing basic dependencies ...")
    run(["uv", "add", "--requirements", "requirements.txt"])

    if config["enable_manager"]:
        manager_req = extracted_dir / "manager_requirements.txt"
        if not manager_req.exists():
            die(
                "manager_requirements.txt is missing from ComfyUI <%s>. "
                "This is unexpected; Please report a bug to %s repo",
                version_head, PROJECT_NAME,
            )
        log.info("Installing manager dependencies ...")
        run(["uv", "add", "--requirements", "manager_requirements.txt"])

    extra_pkgs = config.get("extra_python_package", [])
    if extra_pkgs:
        log.info("Installing extra packages ...")
        for pkg in extra_pkgs:
            run(["uv", "add", "--no-build-isolation", pkg])

    log.info("Syncing venv packages ...")
    run(["uv", "sync"])


def run_prekick_commands(config, extracted_dir):
    # SECURITY NOTE: ``shell=True`` is intentional and safe in this context.
    #
    # Rationale (threat model):
    # 1. comfykick is a single-user, user-privileged launcher. The only writer
    #    of ``prekick_exec`` is the same principal that invokes this script,
    #    so there is no privilege boundary to cross and no untrusted input
    #    flowing into the shell string. The source of ``cmd`` is
    #    ``comfykick.toml`` under the user's XDG config dir, which the user
    #    fully controls; writing a command there is operationally equivalent
    #    to typing it in the user's own shell.
    # 2. ``prekick_exec`` is, by design, a "trusted shell command" field --
    #    semantically on par with systemd's ``ExecStartPre=``, Kubernetes'
    #    ``lifecycle.exec``, or a Makefile rule. Escaping or shlex-quoting
    #    ``cmd`` would actively break the feature (e.g. ``$(date)``,
    #    pipes, redirections, environment expansion are all expected).
    #
    # This is therefore *not* a command-injection vulnerability: the field's
    # type IS "executable shell command", and the writer IS the executor.
    prekick_cmds = config.get("prekick_exec", [])
    if not prekick_cmds:
        return
    env = os.environ.copy()
    for cmd in prekick_cmds:
        if not isinstance(cmd, str) or not cmd.strip():
            continue
        log.info("Running command: [%s]", cmd)
        subprocess.run(cmd, shell=True, cwd=str(extracted_dir), env=env, check=True)


def launch_comfyui(config, extracted_dir):
    env = os.environ.copy()

    args = ["uv", "--directory", str(extracted_dir), "run", "main.py"]
    args.extend([
        "--base-directory", config["base_dir"],
        "--listen", config["listen"],
        "--output-directory", config["output_dir"],
        "--port", str(config["port"]),
        "--temp-directory", config["runtime_dir"],
    ])
    if config["extra_model_paths_yaml"]:
        args.extend(["--extra-model-paths-config", config["extra_model_paths_yaml"]])
    if config["enable_manager"]:
        args.append("--enable-manager")
    for opt in config["comfyui_extra_options"]:
        args.extend(shlex.split(opt))

    os.execvpe("uv", args, env)


def main():
    logging.basicConfig(
        level=logging.INFO,
        format="%(levelname)s: %(message)s",
    )

    if sys.version_info < (3, 12):
        die(
            "Python 3.12+ is required (detected %d.%d).",
            sys.version_info.major, sys.version_info.minor,
        )
    if shutil.which("uv") is None:
        die("'uv' is not installed or not in PATH.")

    log.info("Starting %s %s", PROJECT_NAME, PROJECT_VERSION)

    check_user_config(CONFIG_FILES[-2])

    config = _load_config(CONFIG_FILES)

    log.info("Loaded configuration:")
    for key in sorted(config):
        value = config[key]
        if key in SENSITIVE_KEYS and value:
            log.info("  > %s = **REDACTED**", key)
        else:
            log.info("  > %s = %r", key, value)

    if not config["github_token"]:
        log.info("Running without GitHub token.")

    extra_dirs = _resolve_extra_model_paths(config)

    create_directories(config, extra_dirs)

    version_cache_dir = Path(config["version_cache_dir"])
    version_head, tarball_url = _resolve_version(config, version_cache_dir)
    tarball_path = _ensure_tarball(
        config,
        version_head,
        version_cache_dir,
        tarball_url=tarball_url,
    )

    log.info("Extracting ComfyUI %s ...", version_head)
    prefix = f"_run-{version_head}-"
    runtime_dir = Path(config["runtime_dir"])
    for old in runtime_dir.iterdir():
        if old.is_dir() and old.name.startswith("_run-"):
            shutil.rmtree(old, ignore_errors=True)
    work_temp = tempfile.mkdtemp(prefix=prefix, dir=config["runtime_dir"])

    extracted_dir = _extract_tarball(tarball_path, Path(work_temp))
    if extracted_dir is None:
        log.info("Re-preparing tarball for %s ...", version_head)
        tarball_path = _ensure_tarball(
            config,
            version_head,
            version_cache_dir,
            tarball_url=tarball_url,
            refresh=True,
        )
        extracted_dir = _extract_tarball(tarball_path, Path(work_temp))
        if extracted_dir is None:
            die(
                "Re-preparing tarball for %s is still corrupted; giving up.",
                version_head,
            )

    # hack. See <https://github.com/Comfy-Org/ComfyUI/issues/8764>
    (extracted_dir / "user").mkdir(exist_ok=True)

    install_dependencies(extracted_dir, config, version_head)

    run_prekick_commands(config, extracted_dir)

    log.info(
        "Kicking ComfyUI %s on http://%s:%s ...", version_head, config["listen"], config["port"],
    )
    launch_comfyui(config, extracted_dir)


if __name__ == "__main__":
    main()
