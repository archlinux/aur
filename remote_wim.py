#!/usr/bin/env python3

from __future__ import annotations

import argparse
import sys
from pathlib import Path
from time import perf_counter

from remote_udf import ProbeError
from remote_wim_core import DEFAULT_ISO_URL, RemoteWim


def is_font_path(path: str) -> bool:
    return path.casefold().startswith("windows/fonts/")


def pluralize(count: int, singular: str, plural: str | None = None) -> str:
    if count == 1:
        return singular
    return plural or f"{singular}s"


def command_find(args: argparse.Namespace) -> int:
    wim = RemoteWim(url=args.url, path=args.path, timing=args.timing)
    started_at = perf_counter() if args.timing else None
    matches = wim.find_paths(args.pattern)
    if args.first:
        if not matches:
            raise ProbeError(f"no file matched pattern {args.pattern!r}")
        print(matches[0])
        if args.timing:
            print(wim.timing.render(perf_counter() - started_at), file=sys.stderr)
        return 0

    for match in matches:
        print(match)
    if args.timing:
        print(wim.timing.render(perf_counter() - started_at), file=sys.stderr)
    return 0


def command_extract(args: argparse.Namespace) -> int:
    wim = RemoteWim(url=args.url, path=args.path, timing=args.timing)
    started_at = perf_counter() if args.timing else None
    output_dir = Path(args.output_dir)

    print("- Resolving remote install.wim metadata...", flush=True)
    resolved_paths = wim.resolve_paths(args.wim_paths, args.glob)

    font_total = sum(1 for path in resolved_paths if is_font_path(path))
    extra_total = len(resolved_paths) - font_total
    print(
        f"- Starting extraction with {args.jobs} workers: {font_total} fonts, {extra_total} {pluralize(extra_total, 'extra file')}",
        flush=True,
    )

    font_done = 0
    extra_done = 0

    def on_complete(task, _destination: Path) -> None:
        nonlocal font_done, extra_done
        name = Path(task.path).name
        if is_font_path(task.path):
            font_done += 1
            print(f"[{font_done:03d}/{font_total:03d}] {name}", flush=True)
        else:
            extra_done += 1
            print(f"[extra {extra_done}/{extra_total}] {name}", flush=True)

    wim.extract_paths(
        resolved_paths,
        output_dir,
        jobs=args.jobs,
        on_complete=on_complete,
    )
    print(f"extracted {len(resolved_paths)} files")
    if args.timing:
        print(wim.timing.render(perf_counter() - started_at), file=sys.stderr)
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Extract selected files from a remote install.wim without mounting the ISO."
    )
    parser.add_argument("--url", default=DEFAULT_ISO_URL)
    parser.add_argument("--path", default="sources/install.wim")
    parser.add_argument("--timing", action="store_true")

    subparsers = parser.add_subparsers(dest="command", required=True)

    find_parser = subparsers.add_parser("find", help="find WIM files by glob pattern")
    find_parser.add_argument("pattern")
    find_parser.add_argument("--first", action="store_true")
    find_parser.set_defaults(func=command_find)

    extract_parser = subparsers.add_parser("extract", help="extract WIM files")
    extract_parser.add_argument("--output-dir", required=True)
    extract_parser.add_argument("--jobs", type=int, default=8)
    extract_parser.add_argument("--glob", action="append", default=[])
    extract_parser.add_argument("wim_paths", nargs="+")
    extract_parser.set_defaults(func=command_extract)

    return parser


def main(argv: list[str]) -> int:
    args = build_parser().parse_args(argv)
    try:
        return args.func(args)
    except ProbeError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
