#!/usr/bin/env python3
import os
import sys
import argparse
import datetime
from collections import Counter
from pathlib import Path

CONNECT_MID = "├── "
CONNECT_LAST = "└── "
PIPE = "│   "
SPACE = "    "

# ANSI renk kodları
RESET = "\033[0m"


def load_color_config():
    """~/.config/treex/treex.conf dosyasından renk yapılandırmasını yükler"""
    config_path = Path.home() / ".config" / "treex" / "treex.conf"
    colors = {}

    if not config_path.exists():
        return colors

    try:
        with open(config_path, 'r') as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith('#'):
                    continue
                if '=' in line:
                    key, value = line.split('=', 1)
                    key = key.strip().lower()
                    value = value.strip()
                    # ANSI renk kodunu formatla
                    if value:
                        colors[key] = f"\033[{value}m"
    except Exception as e:
        print(f"Warning: Could not read config file: {e}", file=sys.stderr)

    return colors


def get_color_for_item(item_name, is_dir, colors):
    """Bir dosya veya klasör için uygun rengi döndürür"""
    if is_dir:
        # Klasör için renk
        if 'klasör' in colors or 'folder' in colors:
            return colors.get('klasör', colors.get('folder', ''))
        elif 'primary' in colors:
            return colors['primary']
        return ''

    # Dosya için uzantıya göre renk
    ext = os.path.splitext(item_name)[1].lower()
    if ext in colors:
        return colors[ext]
    elif 'primary' in colors:
        return colors['primary']

    return ''


def colorize(text, color):
    """Metni verilen renkte döndürür"""
    if color:
        return f"{color}{text}{RESET}"
    return text


def format_size_bytes(size_bytes):
    size = size_bytes
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if size < 1024:
            return f"{size} {unit}"
        size //= 1024
    return f"{size} TB"


def format_size(path):
    try:
        if os.path.isfile(path):
            return os.path.getsize(path)
        else:
            size = 0
            for root, dirs, files in os.walk(path):
                for f in files:
                    try:
                        size += os.path.getsize(os.path.join(root, f))
                    except Exception:
                        continue
            return size
    except Exception:
        return 0


def format_lines(path):
    try:
        with open(path, 'r', errors='ignore') as f:
            return sum(1 for _ in f)
    except Exception:
        return 0


def format_mtime(path):
    try:
        ts = os.path.getmtime(path)
        return datetime.datetime.fromtimestamp(
            ts).strftime("%Y-%m-%d %H:%M:%S")
    except Exception:
        return "N/A"


def should_include_file(
        filename,
        ignore_types=None,
        ignore_files=None,
        show_types=None):
    if show_types and not any(filename.endswith(ext) for ext in show_types):
        return False
    if ignore_files and filename in ignore_files:
        return False
    if ignore_types and any(filename.endswith(ext) for ext in ignore_types):
        return False
    return True


def print_tree(
        root_path,
        show_hidden=False,
        max_depth=None,
        show_size=False,
        show_lines=False,
        ignore_types=None,
        ignore_files=None,
        show_types=None,
        last_change=False,
        output_file=None,
        colors=None):
    if colors is None:
        colors = {}

    root_path = os.path.abspath(root_path)
    if not os.path.exists(root_path):
        print(f"Error: path does not exist: {root_path}", file=sys.stderr)
        return 1

    root_name = os.path.basename(root_path) + "/"
    root_color = get_color_for_item(root_name, True, colors)
    lines = [colorize(root_name, root_color)]

    _walk(root_path, "", show_hidden, 0, max_depth, show_size, show_lines,
          ignore_types, ignore_files, show_types, last_change, lines, colors)

    for line in lines:
        print(line)

    if output_file:
        try:
            # Export için renk kodlarını temizle
            clean_lines = [line.replace(RESET, '').replace('\033[', '').split(
                'm')[-1] if '\033[' in line else line for line in lines]
            # Daha iyi temizleme
            import re
            clean_lines = [re.sub(r'\033\[[0-9;]+m', '', line)
                           for line in lines]
            with open(output_file, 'w') as f:
                f.write("\n".join(clean_lines))
        except Exception as e:
            print(f"Error writing to {output_file}: {e}", file=sys.stderr)


def _walk(
        path,
        prefix,
        show_hidden,
        current_depth,
        max_depth,
        show_size,
        show_lines,
        ignore_types,
        ignore_files,
        show_types,
        last_change,
        lines,
        colors):
    try:
        with os.scandir(path) as it:
            entries = [
                e for e in it if show_hidden or not e.name.startswith(".")]
    except PermissionError:
        lines.append(prefix + CONNECT_LAST + "[permission denied]")
        return

    entries.sort(key=lambda e: (not e.is_dir(), e.name.lower()))

    for idx, entry in enumerate(entries):
        is_last = (idx == len(entries) - 1)
        connector = CONNECT_LAST if is_last else CONNECT_MID
        name = entry.name + ("/" if entry.is_dir() else "")

        if entry.is_file():
            if not should_include_file(
                    entry.name,
                    ignore_types,
                    ignore_files,
                    show_types):
                continue

            # Renk al
            color = get_color_for_item(entry.name, False, colors)

            # Ek bilgileri ekle
            extra_info = ""
            if show_size:
                extra_info += f" ({format_size_bytes(format_size(entry.path))})"
            if show_lines:
                extra_info += f" [{format_lines(entry.path)} lines]"
            if last_change:
                extra_info += f" (modified: {format_mtime(entry.path)})"

            # Renklendir
            colored_name = colorize(name + extra_info, color)
            lines.append(prefix + connector + colored_name)

        elif entry.is_dir(follow_symlinks=False):
            # Klasör için renk
            color = get_color_for_item(entry.name, True, colors)
            colored_name = colorize(name, color)
            lines.append(prefix + connector + colored_name)

            if max_depth is None or current_depth + 1 < max_depth:
                extension = SPACE if is_last else PIPE
                _walk(
                    os.path.join(
                        path,
                        entry.name),
                    prefix + extension,
                    show_hidden,
                    current_depth + 1,
                    max_depth,
                    show_size,
                    show_lines,
                    ignore_types,
                    ignore_files,
                    show_types,
                    last_change,
                    lines,
                    colors)


def summary_stats(
        path,
        show_hidden=False,
        ignore_types=None,
        ignore_files=None,
        show_types=None,
        max_depth=None):
    total_files = 0
    total_dirs = 0
    total_size = 0
    total_lines = 0
    hidden_count = 0
    max_file_size = 0
    min_file_size = None
    max_dir_size = 0
    min_dir_size = None
    max_lines = 0

    root_depth = path.rstrip(os.sep).count(os.sep)

    for root, dirs, files in os.walk(path):
        current_depth = root.rstrip(os.sep).count(os.sep) - root_depth
        if max_depth is not None and current_depth >= max_depth:
            dirs[:] = []

        if show_hidden:
            hidden_count += sum(1 for d in dirs if d.startswith("."))
            hidden_count += sum(1 for f in files if f.startswith("."))

        total_dirs += len(dirs)

        for f in files:
            if not should_include_file(
                    f, ignore_types, ignore_files, show_types):
                continue
            total_files += 1
            fp = os.path.join(root, f)
            try:
                size = os.path.getsize(fp)
                total_size += size
                if size > max_file_size:
                    max_file_size = size
                if min_file_size is None or size < min_file_size:
                    min_file_size = size
                lines_count = format_lines(fp)
                total_lines += lines_count
                if lines_count > max_lines:
                    max_lines = lines_count
            except Exception:
                continue

        for d in dirs:
            dp = os.path.join(root, d)
            try:
                size = format_size(dp)
                if size > max_dir_size:
                    max_dir_size = size
                if min_dir_size is None or size < min_dir_size:
                    min_dir_size = size
            except Exception:
                continue

    avg_file_size = total_size // total_files if total_files else 0

    return {
        "total_files": total_files,
        "total_dirs": total_dirs,
        "total_size": total_size,
        "total_lines": total_lines,
        "hidden_count": hidden_count,
        "max_file_size": max_file_size,
        "min_file_size": min_file_size or 0,
        "max_dir_size": max_dir_size,
        "min_dir_size": min_dir_size or 0,
        "avg_file_size": avg_file_size,
        "max_lines": max_lines
    }


def print_summary(stat_dict, output_file=None):
    lines = [
        "--- Summary ---",
        f"Total files: {stat_dict['total_files']}",
        f"Total directories: {stat_dict['total_dirs']}",
        f"Total size: {format_size_bytes(stat_dict['total_size'])}",
        f"Total lines: {stat_dict['total_lines']}",
        f"Largest file size: {format_size_bytes(stat_dict['max_file_size'])}",
        f"Smallest file size: {format_size_bytes(stat_dict['min_file_size'])}",
        f"Largest directory size: {format_size_bytes(stat_dict['max_dir_size'])}",
        f"Smallest directory size: {format_size_bytes(stat_dict['min_dir_size'])}",
        f"Average file size: {format_size_bytes(stat_dict['avg_file_size'])}",
        f"Longest file lines: {stat_dict['max_lines']}"
    ]
    for line in lines:
        print(line)
    if output_file:
        try:
            with open(output_file, 'a') as f:
                f.write("\n".join(lines) + "\n")
        except Exception as e:
            print(
                f"Error writing summary to {output_file}: {e}",
                file=sys.stderr)


def extension_distribution(
        path,
        show_hidden=False,
        ignore_types=None,
        ignore_files=None,
        show_types=None,
        max_depth=None):
    ext_counter = Counter()
    dir_count = 0
    root_depth = path.rstrip(os.sep).count(os.sep)

    for root, dirs, files in os.walk(path):
        current_depth = root.rstrip(os.sep).count(os.sep) - root_depth
        if max_depth is not None and current_depth >= max_depth:
            dirs[:] = []

        for d in dirs:
            if not show_hidden and d.startswith("."):
                continue
            dir_count += 1
        for f in files:
            if not should_include_file(
                    f, ignore_types, ignore_files, show_types):
                continue
            if not show_hidden and f.startswith("."):
                continue
            ext = os.path.splitext(f)[1] or "(no extension)"
            ext_counter[ext] += 1
    return ext_counter, dir_count


def print_extdist(ext_counter, dir_count, output_file=None):
    lines = ["--- Extension Distribution ---", f"Directories: {dir_count}"]
    for ext, count in ext_counter.most_common():
        lines.append(f"{ext}: {count}")
    for line in lines:
        print(line)
    if output_file:
        try:
            with open(output_file, 'a') as f:
                f.write("\n".join(lines) + "\n")
        except Exception as e:
            print(
                f"Error writing extension distribution to {output_file}: {e}",
                file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(
        description="TreeX - Directory lister with optional features")
    parser.add_argument(
        "path",
        nargs="?",
        default=os.getcwd(),
        help="Directory to list")
    parser.add_argument(
        "-a",
        "--all",
        action="store_true",
        help="Show hidden files")
    parser.add_argument(
        "--depth",
        type=int,
        default=None,
        help="Limit tree depth")
    parser.add_argument(
        "--size",
        action="store_true",
        help="Show file and folder sizes")
    parser.add_argument(
        "--lines",
        action="store_true",
        help="Show number of lines in files")
    parser.add_argument(
        "--ignoretype",
        "-it",
        nargs="*",
        default=None,
        help="Ignore these file types (.ext)")
    parser.add_argument(
        "--ignorefile",
        "-if",
        nargs="*",
        default=None,
        help="Ignore these specific files")
    parser.add_argument(
        "--showtype",
        "-st",
        nargs="*",
        default=None,
        help="Only show these file types (.ext)")
    parser.add_argument(
        "--summary",
        action="store_true",
        help="Show summary statistics (with tree)")
    parser.add_argument(
        "--justsum",
        action="store_true",
        help="Show only summary statistics (no tree)")
    parser.add_argument(
        "--extdist",
        "-ed",
        action="store_true",
        help="Show extension distribution")
    parser.add_argument(
        "--lastchange",
        "-lc",
        action="store_true",
        help="Show last modified time for files and folders")
    parser.add_argument(
        "--export",
        "-ex",
        type=str,
        help="Export output to specified file")
    parser.add_argument(
        "--no-color",
        action="store_true",
        help="Disable color output")
    args = parser.parse_args()

    # Renk yapılandırmasını yükle
    colors = {} if args.no_color else load_color_config()

    # Eğer sadece justsum isteniyorsa, tree'yi gösterme
    if not args.justsum:
        rc = print_tree(
            args.path,
            show_hidden=args.all,
            max_depth=args.depth,
            show_size=args.size,
            show_lines=args.lines,
            ignore_types=args.ignoretype,
            ignore_files=args.ignorefile,
            show_types=args.showtype,
            last_change=args.lastchange,
            output_file=args.export,
            colors=colors
        )
        if rc:
            sys.exit(rc)

    if args.summary or args.justsum:
        stat_dict = summary_stats(
            args.path,
            show_hidden=args.all,
            ignore_types=args.ignoretype,
            ignore_files=args.ignorefile,
            show_types=args.showtype,
            max_depth=args.depth
        )
        print_summary(stat_dict, output_file=args.export)

    if args.extdist:
        ext_counter, dir_count = extension_distribution(
            args.path,
            show_hidden=args.all,
            ignore_types=args.ignoretype,
            ignore_files=args.ignorefile,
            show_types=args.showtype,
            max_depth=args.depth
        )
        print_extdist(ext_counter, dir_count, output_file=args.export)


if __name__ == "__main__":
    main()
