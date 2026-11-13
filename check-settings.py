#!/usr/bin/python
"""Refuse to start SOGo 6 with upstream's insecure defaults.

Run by the services before they start (ExecStartPre=), with /etc/sogo6/process.conf as their
environment. Upstream's admin API logs in with admin/admin unless SOGO_P_ADMIN_PWD is set, and
accepts an empty password if it is set to an empty one; Flask's SECRET_KEY has a fixed default.
"""

import os
import sys

# Upstream's default of SECRET_KEY in app/config/settings/ProcessSetting.py
DEFAULT_SECRET_KEY = "90777fd15f122afad7f16f65895feaec5394b053847cb8beab51a7969b2ac75c"
REQUIRED = (
    "SOGO_P_VOUCHER_SECRET",
    "SOGO_AES_ENC_KEY",
    "SECRET_KEY",
    "SOGO_P_ADMIN_PWD",
    "SOGO_P_REDIS_URL",
)


def main() -> int:
    """Print what's missing or insecure in the settings, return 1 if anything is."""
    problems = [f"{name} is not set" for name in REQUIRED if not os.environ.get(name)]
    if os.environ.get("SECRET_KEY") == DEFAULT_SECRET_KEY:
        problems.append("SECRET_KEY is upstream's default")
    if os.environ.get("SOGO_P_ADMIN_PWD") == "admin":
        problems.append("SOGO_P_ADMIN_PWD is upstream's default")
    voucher_secret = os.environ.get("SOGO_P_VOUCHER_SECRET", "")
    if voucher_secret and len(voucher_secret) != 32:
        problems.append("SOGO_P_VOUCHER_SECRET is not 32 characters long")
    for problem in problems:
        print(f"/etc/sogo6/process.conf: {problem}", file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
