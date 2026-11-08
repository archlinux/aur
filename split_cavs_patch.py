#!/usr/bin/env python3
"""Split ffmpeg-7.1.2_cavs_dra.patch into GNU-patch-applicable parts.

The upstream patch (maliwen2015/ffmpeg_cavs_dra) is malformed: mixed CRLF
line endings and a wrong hunk line count in the new-file section for
libavcodec/libcavs.c make GNU patch reject it. This script normalizes line
endings, writes the sections before and after libcavs.c as
cavs_dra-p1.patch / cavs_dra-p2.patch (apply with patch -p2), and extracts
libavcodec/libcavs.c itself - a pure new-file addition - directly into the
source tree.

Usage: split_cavs_patch.py <patch> <outdir> <ffmpeg-srcdir>
"""
import sys
from pathlib import Path


def main() -> int:
    patch_path, out_dir, src = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3])
    text = patch_path.read_bytes().replace(b'\r\n', b'\n').decode('utf-8')
    lines = text.splitlines(keepends=True)
    starts = [i for i, line in enumerate(lines) if line.startswith('diff -Naur ')]
    if not starts:
        print('no diff sections found', file=sys.stderr)
        return 1
    starts.append(len(lines))
    sections = [lines[a:b] for a, b in zip(starts, starts[1:])]
    idx = next((i for i, sec in enumerate(sections)
                if '/libavcodec/libcavs.c ' in sec[0]), None)
    if idx is None:
        print('libcavs.c section not found', file=sys.stderr)
        return 1

    (out_dir / 'cavs_dra-p1.patch').write_text(
        ''.join(line for sec in sections[:idx] for line in sec))
    (out_dir / 'cavs_dra-p2.patch').write_text(
        ''.join(line for sec in sections[idx + 1:] for line in sec))

    body = []
    in_body = False
    for line in sections[idx]:
        if line.startswith('+++ '):
            in_body = True
            continue
        if not in_body or line.startswith('@@') or line.startswith('\\'):
            continue  # hunk headers, "\ No newline at end of file"
        if not line.startswith('+'):
            print(f'unexpected line in libcavs.c section: {line[:60]!r}',
                  file=sys.stderr)
            return 1
        body.append(line[1:])
    target = src / 'libavcodec/libcavs.c'
    target.write_text(''.join(body))
    print(f'libcavs.c: {len(body)} lines extracted')
    return 0


if __name__ == '__main__':
    sys.exit(main())
