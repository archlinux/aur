#!/usr/bin/env python
"""Add, update, or remove the Minecraft Bedrock non-Steam shortcut."""

from __future__ import annotations

import argparse
import binascii
import os
from collections import OrderedDict
from datetime import datetime
from pathlib import Path
import shutil
import struct
import sys
from typing import Any


TYPE_OBJECT = 0
TYPE_STRING = 1
TYPE_INT32 = 2
TYPE_FLOAT32 = 3
TYPE_UINT64 = 7
TYPE_END = 8


class VdfError(RuntimeError):
    pass


class Int32(int):
    pass


class UInt64(int):
    pass


class Float32(float):
    pass


def read_cstring(data: bytes, offset: int) -> tuple[str, int]:
    end = data.find(b"\x00", offset)
    if end < 0:
        raise VdfError("unterminated string in shortcuts.vdf")
    return data[offset:end].decode("utf-8", errors="replace"), end + 1


def parse_object(data: bytes, offset: int = 0) -> tuple[OrderedDict[str, Any], int]:
    obj: OrderedDict[str, Any] = OrderedDict()

    while offset < len(data):
        value_type = data[offset]
        offset += 1

        if value_type == TYPE_END:
            return obj, offset

        key, offset = read_cstring(data, offset)

        if value_type == TYPE_OBJECT:
            value, offset = parse_object(data, offset)
        elif value_type == TYPE_STRING:
            value, offset = read_cstring(data, offset)
        elif value_type == TYPE_INT32:
            if offset + 4 > len(data):
                raise VdfError("truncated int32 in shortcuts.vdf")
            value = Int32(struct.unpack_from("<I", data, offset)[0])
            offset += 4
        elif value_type == TYPE_FLOAT32:
            if offset + 4 > len(data):
                raise VdfError("truncated float32 in shortcuts.vdf")
            value = Float32(struct.unpack_from("<f", data, offset)[0])
            offset += 4
        elif value_type == TYPE_UINT64:
            if offset + 8 > len(data):
                raise VdfError("truncated uint64 in shortcuts.vdf")
            value = UInt64(struct.unpack_from("<Q", data, offset)[0])
            offset += 8
        else:
            raise VdfError(f"unsupported binary VDF type {value_type} for key {key!r}")

        obj[key] = value

    raise VdfError("shortcuts.vdf ended before object terminator")


def write_cstring(output: bytearray, value: str) -> None:
    output.extend(value.encode("utf-8"))
    output.append(0)


def write_object(output: bytearray, obj: OrderedDict[str, Any] | dict[str, Any]) -> None:
    for key, value in obj.items():
        if isinstance(value, (OrderedDict, dict)):
            output.append(TYPE_OBJECT)
            write_cstring(output, key)
            write_object(output, value)
        elif isinstance(value, str):
            output.append(TYPE_STRING)
            write_cstring(output, key)
            write_cstring(output, value)
        elif isinstance(value, UInt64):
            output.append(TYPE_UINT64)
            write_cstring(output, key)
            output.extend(struct.pack("<Q", int(value) & 0xFFFFFFFFFFFFFFFF))
        elif isinstance(value, Float32):
            output.append(TYPE_FLOAT32)
            write_cstring(output, key)
            output.extend(struct.pack("<f", float(value)))
        elif isinstance(value, int):
            output.append(TYPE_INT32)
            write_cstring(output, key)
            output.extend(struct.pack("<I", int(value) & 0xFFFFFFFF))
        else:
            raise TypeError(f"cannot write {type(value).__name__} value for {key!r}")

    output.append(TYPE_END)


def load_vdf(path: Path) -> OrderedDict[str, Any]:
    if not path.exists() or path.stat().st_size == 0:
        return OrderedDict([("shortcuts", OrderedDict())])

    root, offset = parse_object(path.read_bytes())
    if offset != path.stat().st_size:
        trailing = path.stat().st_size - offset
        if trailing > 0:
            raise VdfError(f"shortcuts.vdf has {trailing} trailing bytes")

    shortcuts = root.get("shortcuts")
    if not isinstance(shortcuts, OrderedDict):
        root["shortcuts"] = OrderedDict()
    return root


def dump_vdf(root: OrderedDict[str, Any]) -> bytes:
    output = bytearray()
    write_object(output, root)
    return bytes(output)


def steam_quote(value: str | Path) -> str:
    text = str(value)
    if text.startswith('"') and text.endswith('"'):
        return text
    return f'"{text}"'


def steam_unquote(value: Any) -> str:
    if not isinstance(value, str):
        return ""
    return value.strip('"')


def shortcut_appid(exe: str, app_name: str) -> Int32:
    checksum = binascii.crc32((exe + app_name).encode("utf-8"))
    return Int32((checksum | 0x80000000) & 0xFFFFFFFF)


def normalize_path(value: str) -> str:
    return os.path.normcase(os.path.normpath(value))


def shortcut_tags(tags: list[str]) -> OrderedDict[str, str]:
    deduped = list(dict.fromkeys(tag for tag in tags if tag))
    return OrderedDict((str(index), tag) for index, tag in enumerate(deduped))


def build_shortcut(args: argparse.Namespace) -> OrderedDict[str, Any]:
    exe = steam_quote(Path(args.exe).expanduser().resolve())
    start_dir = steam_quote(Path(args.start_dir).expanduser().resolve())
    icon = str(Path(args.icon).expanduser().resolve()) if args.icon else ""

    return OrderedDict(
        [
            ("appid", shortcut_appid(exe, args.name)),
            ("AppName", args.name),
            ("Exe", exe),
            ("StartDir", start_dir),
            ("icon", icon),
            ("ShortcutPath", ""),
            ("LaunchOptions", args.launch_options),
            ("IsHidden", Int32(0)),
            ("AllowDesktopConfig", Int32(1)),
            ("AllowOverlay", Int32(1)),
            ("OpenVR", Int32(0)),
            ("Devkit", Int32(0)),
            ("DevkitGameID", ""),
            ("DevkitOverrideAppID", Int32(0)),
            ("LastPlayTime", Int32(0)),
            ("FlatpakAppID", ""),
            ("tags", shortcut_tags(args.tag)),
        ]
    )


def find_steam_root(explicit: str | None) -> Path:
    candidates: list[Path] = []
    if explicit:
        candidates.append(Path(explicit))
    for env_name in ("STEAM_COMPAT_CLIENT_INSTALL_PATH", "STEAM_ROOT"):
        env_value = os.environ.get(env_name)
        if env_value:
            candidates.append(Path(env_value))
    candidates.extend(
        [
            Path.home() / ".steam/root",
            Path.home() / ".local/share/Steam",
            Path.home() / ".var/app/com.valvesoftware.Steam/.local/share/Steam",
        ]
    )

    for candidate in candidates:
        root = candidate.expanduser().resolve()
        if (root / "userdata").is_dir() or (root / "steamapps").is_dir():
            return root

    raise SystemExit("Steam root not found")


def select_userdata(steam_root: Path, user_id: str | None) -> Path:
    userdata_root = steam_root / "userdata"
    if user_id:
        selected = userdata_root / user_id
        if not selected.is_dir():
            raise SystemExit(f"Steam userdata id not found: {user_id}")
        return selected

    users = sorted(path for path in userdata_root.iterdir() if path.is_dir() and path.name.isdigit())
    if not users:
        raise SystemExit(f"No Steam userdata directories found in {userdata_root}")
    if len(users) == 1:
        return users[0]

    def recency(path: Path) -> float:
        config = path / "config/localconfig.vdf"
        try:
            return config.stat().st_mtime
        except FileNotFoundError:
            return path.stat().st_mtime

    selected = max(users, key=recency)
    print(
        f"warning: multiple Steam users found; selected {selected.name}. "
        "Set MINECRAFT_BEDROCK_STEAM_USER_ID or pass --user-id to override.",
        file=sys.stderr,
    )
    return selected


def steam_running() -> bool:
    proc = Path("/proc")
    if not proc.is_dir():
        return False

    for path in proc.iterdir():
        if not path.name.isdigit():
            continue
        try:
            comm = (path / "comm").read_text(encoding="utf-8").strip()
        except OSError:
            continue
        if comm in {"steam", "steamwebhelper"}:
            return True
    return False


def ordered_shortcuts(shortcuts_obj: OrderedDict[str, Any]) -> list[OrderedDict[str, Any]]:
    def key_index(item: tuple[str, Any]) -> int:
        key, _value = item
        return int(key) if key.isdigit() else 999999

    shortcuts: list[OrderedDict[str, Any]] = []
    for _key, value in sorted(shortcuts_obj.items(), key=key_index):
        if isinstance(value, OrderedDict):
            shortcuts.append(value)
    return shortcuts


def add_shortcut(args: argparse.Namespace) -> None:
    steam_root = find_steam_root(args.steam_root)
    userdata = select_userdata(steam_root, args.user_id)
    shortcuts_path = userdata / "config/shortcuts.vdf"
    root = load_vdf(shortcuts_path)
    existing_shortcuts = ordered_shortcuts(root["shortcuts"])
    new_shortcut = build_shortcut(args)
    target_exe = normalize_path(str(Path(args.exe).expanduser().resolve()))

    replaced = False
    for index, shortcut in enumerate(existing_shortcuts):
        current_name = shortcut.get("AppName")
        current_exe = normalize_path(steam_unquote(shortcut.get("Exe")))
        if current_name == args.name or current_exe == target_exe:
            existing_shortcuts[index] = new_shortcut
            replaced = True
            break

    if not replaced:
        existing_shortcuts.append(new_shortcut)

    root["shortcuts"] = OrderedDict(
        (str(index), shortcut) for index, shortcut in enumerate(existing_shortcuts)
    )

    new_data = dump_vdf(root)
    old_data = shortcuts_path.read_bytes() if shortcuts_path.exists() else b""
    if new_data == old_data:
        print(f"Steam shortcut already up to date: {args.name}")
        return

    shortcuts_path.parent.mkdir(parents=True, exist_ok=True)
    if shortcuts_path.exists():
        stamp = datetime.now().strftime("%Y%m%d-%H%M%S")
        backup = shortcuts_path.with_name(f"{shortcuts_path.name}.bak.{stamp}")
        shutil.copy2(shortcuts_path, backup)
        print(f"Backed up {shortcuts_path} to {backup}")

    if steam_running():
        print(
            "warning: Steam appears to be running; restart Steam after this command "
            "and avoid exiting Steam before it reloads shortcuts.",
            file=sys.stderr,
        )

    tmp_path = shortcuts_path.with_name(f".{shortcuts_path.name}.tmp")
    tmp_path.write_bytes(new_data)
    os.replace(tmp_path, shortcuts_path)

    action = "Updated" if replaced else "Added"
    print(f"{action} Steam shortcut for {args.name} in userdata {userdata.name}")


def remove_shortcut(args: argparse.Namespace) -> None:
    steam_root = find_steam_root(args.steam_root)
    userdata = select_userdata(steam_root, args.user_id)
    shortcuts_path = userdata / "config/shortcuts.vdf"
    if not shortcuts_path.exists():
        print(f"No Steam shortcuts file found in userdata {userdata.name}")
        return

    root = load_vdf(shortcuts_path)
    existing_shortcuts = ordered_shortcuts(root["shortcuts"])
    target_exe = normalize_path(str(Path(args.exe).expanduser().resolve())) if args.exe else ""
    remaining_shortcuts: list[OrderedDict[str, Any]] = []
    removed = 0

    for shortcut in existing_shortcuts:
        current_name = shortcut.get("AppName")
        current_exe = normalize_path(steam_unquote(shortcut.get("Exe")))
        if current_name == args.name or (target_exe and current_exe == target_exe):
            removed += 1
            continue
        remaining_shortcuts.append(shortcut)

    if removed == 0:
        print(f"No Steam shortcut found for {args.name}")
        return

    root["shortcuts"] = OrderedDict(
        (str(index), shortcut) for index, shortcut in enumerate(remaining_shortcuts)
    )

    stamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    backup = shortcuts_path.with_name(f"{shortcuts_path.name}.bak.{stamp}")
    shutil.copy2(shortcuts_path, backup)
    print(f"Backed up {shortcuts_path} to {backup}")

    if steam_running():
        print(
            "warning: Steam appears to be running; restart Steam after this command "
            "and avoid exiting Steam before it reloads shortcuts.",
            file=sys.stderr,
        )

    tmp_path = shortcuts_path.with_name(f".{shortcuts_path.name}.tmp")
    tmp_path.write_bytes(dump_vdf(root))
    os.replace(tmp_path, shortcuts_path)
    print(f"Removed {removed} Steam shortcut(s) for {args.name} from userdata {userdata.name}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)

    add = subparsers.add_parser("add", help="add or update a shortcut")
    add.add_argument("--steam-root")
    add.add_argument("--user-id")
    add.add_argument("--name", required=True)
    add.add_argument("--exe", required=True)
    add.add_argument("--start-dir", required=True)
    add.add_argument("--launch-options", default="")
    add.add_argument("--icon", default="")
    add.add_argument("--tag", action="append", default=[])
    add.set_defaults(func=add_shortcut)

    remove = subparsers.add_parser("remove", help="remove a shortcut")
    remove.add_argument("--steam-root")
    remove.add_argument("--user-id")
    remove.add_argument("--name", required=True)
    remove.add_argument("--exe")
    remove.set_defaults(func=remove_shortcut)

    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        args.func(args)
    except VdfError as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
