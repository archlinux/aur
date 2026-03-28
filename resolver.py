#!/usr/bin/env python3

from __future__ import annotations

import argparse
import base64
import sys
from pathlib import Path

from fonts import download_entry, resolve_groups
from wu import ResolverError, validate_build


DEFAULT_BUILD = "10.0.26100.1"


def parse_group_specs(raw_groups: list[str] | None) -> list[tuple[str, str]]:
    if not raw_groups:
        raise ResolverError("at least one --group GROUP=CAB_STEM is required")

    group_specs: list[tuple[str, str]] = []
    seen: set[str] = set()
    for raw_group in raw_groups:
        group, sep, cab_stem = raw_group.partition("=")
        if sep != "=" or not group or not cab_stem:
            raise ResolverError(
                f"invalid group spec {raw_group!r}; expected GROUP=CAB_STEM"
            )
        if group in seen:
            raise ResolverError(f"duplicate group spec for {group!r}")
        seen.add(group)
        group_specs.append((group, cab_stem))
    return group_specs


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Resolve Windows 11 FoD font CABs")
    parser.add_argument("command", choices=("resolve", "download"))
    parser.add_argument(
        "--build",
        default=DEFAULT_BUILD,
        help="Windows build used for Windows Update queries",
    )
    parser.add_argument(
        "--branch",
        help="override the detected Windows Update branch",
    )
    parser.add_argument(
        "--group",
        action="append",
        dest="groups",
        metavar="GROUP=CAB_STEM",
        required=True,
        help="pass one or more font group specifications",
    )
    parser.add_argument(
        "--output-dir",
        default=".",
        help="directory used by the download command",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    validate_build(args.build)
    group_specs = parse_group_specs(args.groups)
    entries = resolve_groups(args.build, group_specs, branch=args.branch)

    if args.command == "resolve":
        for entry in entries:
            print(
                "\t".join(
                    (
                        entry.group,
                        entry.name,
                        entry.sha1_b64,
                        base64.b64decode(entry.sha256_b64).hex(),
                        entry.update_id,
                        str(entry.revision),
                        entry.url or "",
                    )
                )
            )
        return 0

    output_dir = Path(args.output_dir)
    try:
        output_dir.mkdir(parents=True, exist_ok=True)
    except OSError as exc:
        raise ResolverError(
            f"failed to create output directory {output_dir}: {exc}"
        ) from exc
    for entry in entries:
        download_entry(entry, output_dir)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except ResolverError as exc:
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
