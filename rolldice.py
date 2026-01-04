#!/usr/bin/env python3
import sys
import os
import random
import termios
import tty
import select
import subprocess
import time
import socket
import json
import tempfile

# ---------- key input ----------
def getch():
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setcbreak(fd)
        if select.select([sys.stdin], [], [], 0.05)[0]:
            return sys.stdin.read(1)
        return None
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

# ---------- music scan ----------
def collect_music(path):
    exts = (".mp3", ".flac", ".wav", ".ogg", ".m4a")
    tracks = []
    for root, _, files in os.walk(path):
        for f in files:
            if f.lower().endswith(exts):
                tracks.append(os.path.join(root, f))
    return tracks

# ---------- mpv ipc ----------
def mpv_cmd(sock, cmd):
    try:
        s = socket.socket(socket.AF_UNIX)
        s.connect(sock)
        s.sendall((json.dumps(cmd) + "\n").encode())
        s.close()
    except:
        pass

# ---------- main ----------
def main():
    if len(sys.argv) < 2:
        print("usage: rolldice <music_dir>")
        sys.exit(1)

    tracks = collect_music(sys.argv[1])
    if not tracks:
        print("no music found")
        sys.exit(1)

    print("🎲 roll the dice")
    print("space: pause | n: next | q: quit")

    try:
        while True:
            track = random.choice(tracks)
            sock = tempfile.mktemp(prefix="rolldice-mpv-")

            print(f"\n▶ {os.path.basename(track)}")

            player = subprocess.Popen([
                "mpv",
                "--no-video",
                "--quiet",
                "--input-terminal=no",
                "--no-input-default-bindings",
                f"--input-ipc-server={sock}",
                track
            ])

            while player.poll() is None:
                key = getch()

                if key == "q":
                    player.terminate()
                    print("\nbye 🎲")
                    return

                if key == "n":
                    player.terminate()
                    break

                if key == " ":
                    mpv_cmd(sock, {"command": ["cycle", "pause"]})

                time.sleep(0.05)

    except KeyboardInterrupt:
        print("\nbye 🎲")

if __name__ == "__main__":
    main()

