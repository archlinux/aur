#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
CLI converter: AAC → ALAC inside .mov
Keeps all tracks, rewrites audio only. Supports --progress.
"""

import argparse, subprocess, sys, os, tempfile, shutil

EXIT_OK = 0
EXIT_NOT_AAC = 3
EXIT_FFMPEG_FAIL = 4

def probe_duration_seconds(path):
    try:
        out = subprocess.check_output(
            ["ffprobe", "-v", "error", "-show_entries", "format=duration",
             "-of", "default=nk=1:nw=1", path],
            text=True
        ).strip()
        return float(out)
    except Exception:
        return 0.0

def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("input", help="input video with AAC audio")
    p.add_argument("output", help="output .mov")
    p.add_argument("--progress", action="store_true",
                   help="emit PROGRESS <pct> lines")
    return p.parse_args()

def main():
    args = parse_args()

    info = subprocess.run(
        ["ffprobe", "-v", "error", "-select_streams", "a",
         "-show_entries", "stream=codec_name",
         "-of", "default=nokey=1:nw=1", args.input],
        capture_output=True, text=True
    )
    codecs = info.stdout.strip().splitlines()
    if not codecs or any(c.strip() != "aac" for c in codecs):
        print("NOT_AAC", file=sys.stderr)
        return EXIT_NOT_AAC

    real_out = args.output
    tmp_fd, tmp_path = tempfile.mkstemp(suffix=".mov")
    os.close(tmp_fd)

    cmd = ["ffmpeg", "-y", "-i", args.input,
           "-map", "0:v?", "-map", "0:a?", "-map", "0:s?", "-map", "0:d?", "-map", "0:t?",
           "-c:v", "copy", "-c:a", "alac", "-movflags", "+faststart"]

    if args.progress:
        cmd += ["-progress", "pipe:1", "-nostats"]

    cmd += [tmp_path]

    if args.progress:
        dur = probe_duration_seconds(args.input)
        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                text=True, bufsize=1)
        for line in proc.stdout:
            line = line.strip()
            if line.startswith("out_time_ms=") and dur > 0:
                ms = float(line.split("=",1)[1])
                pct = min(100.0, (ms/1_000_000.0)/dur*100.0)
                print(f"PROGRESS {pct:.1f}", flush=True)
        rc = proc.wait()
    else:
        proc = subprocess.run(cmd)
        rc = proc.returncode

    if rc != 0:
        return EXIT_FFMPEG_FAIL

    shutil.move(tmp_path, real_out)
    print(f"OK: {real_out}")
    if args.progress:
        print(f"DONE {real_out}", flush=True)
    return EXIT_OK

if __name__ == "__main__":
    sys.exit(main())
