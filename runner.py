"""CLI execution helper for gemini-api."""

import os
import shutil
import subprocess
from typing import List, Optional, Tuple


def find_gemini_binary() -> Optional[str]:
    """Find the gemini-api executable in the system or standard locations."""
    # 1. Custom explicit path from environment
    custom_bin = os.environ.get("GEMINI_API_BIN")
    if custom_bin and os.path.isfile(custom_bin) and os.access(custom_bin, os.X_OK):
        return custom_bin

    # 2. PATH resolution for gemini-api and gemini-api-cli
    for name in ("gemini-api", "gemini-api-cli"):
        path = shutil.which(name)
        if path:
            return path

    # 3. Known standard install locations
    common_paths = [
        os.path.expanduser("~/.local/bin/gemini-api"),
        os.path.expanduser("~/go/bin/gemini-api"),
        "/usr/local/bin/gemini-api",
        "/usr/bin/gemini-api",
        "/opt/homebrew/bin/gemini-api",
    ]
    for p in common_paths:
        if os.path.isfile(p) and os.access(p, os.X_OK):
            return p

    return None


def run_gemini_cli(
    args: List[str],
    timeout: int = 120,
    env_overrides: Optional[dict] = None,
) -> Tuple[int, str, str]:
    """Execute a gemini-api command with arguments and return (code, stdout, stderr)."""
    binary = find_gemini_binary()
    if not binary:
        err = (
            "Error: 'gemini-api' executable not found.\n"
            "Please ensure 'gemini-api' is installed. You can install it via:\n"
            "  - AUR: yay -S gemini-api-cli-bin\n"
            "  - Shell: curl -fsSL https://raw.githubusercontent.com/google-gemini/gemini-api-cli/main/scripts/install.sh | bash\n"
            "  - Go: go install github.com/google-gemini/gemini-api-cli/cmd/gemini-api@latest\n"
            "Or configure GEMINI_API_BIN=/path/to/gemini-api."
        )
        return 127, "", err

    cmd = [binary] + args
    env = os.environ.copy()
    if env_overrides:
        env.update(env_overrides)

    try:
        proc = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            check=False,
            timeout=timeout,
            env=env,
        )
        return proc.returncode, proc.stdout, proc.stderr
    except subprocess.TimeoutExpired:
        return 124, "", f"Command timed out after {timeout} seconds: {' '.join(cmd)}"
    except Exception as e:
        return 1, "", f"Failed to run command {' '.join(cmd)}: {e}"
