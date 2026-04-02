#!/usr/bin/env python3
"""
speech-dispatcher output module for Xiaomi MiMo TTS.

Implements the speech-dispatcher module protocol.
Starts by reading env config, then processes commands from stdin.
"""

import sys
import os
import re
import html
import signal
import subprocess
import base64
import json
import urllib.request
import urllib.error

MODULE_NAME = "mimo"

API_KEY = ""
BASE_URL = "https://api.xiaomimimo.com/v1"
VOICE = "mimo_default"
FORMAT = "wav"
PLAY_CMD = "paplay"

_stop_flag = False
_player_proc = None


def send(msg: str):
    print(msg, flush=True)


def send_ok(extra: str = ""):
    if extra:
        send(f"299-{extra}")
    send("299 OK")


def strip_ssml(text: str) -> str:
    text = re.sub(r"</?speak[^>]*>", "", text)
    text = re.sub(r"<[^>]+>", "", text)
    return html.unescape(text).strip()


def call_tts(text: str) -> bytes:
    url = f"{BASE_URL}/chat/completions"

    payload = {
        "model": "mimo-v2-tts",
        "messages": [{"role": "assistant", "content": text}],
        "audio": {"format": FORMAT, "voice": VOICE},
    }

    data = json.dumps(payload).encode("utf-8")

    req = urllib.request.Request(
        url,
        data=data,
        headers={"api-key": API_KEY, "Content-Type": "application/json"},
        method="POST",
    )

    try:
        with urllib.request.urlopen(req) as response:
            result = json.loads(response.read().decode("utf-8"))
    except urllib.error.URLError as e:
        raise RuntimeError(f"HTTP request failed: {e}") from e
    except json.JSONDecodeError as e:
        raise RuntimeError(f"Failed to parse API response: {e}") from e

    # Extract base64 audio data from response
    message = result["choices"][0]["message"]
    audio_data = message["audio"]["data"]
    return base64.b64decode(audio_data)


def play_audio(audio_bytes: bytes):
    global _player_proc
    _player_proc = subprocess.Popen(PLAY_CMD.split() + ["-"], stdin=subprocess.PIPE)
    _player_proc.communicate(input=audio_bytes)
    _player_proc = None


def handle_speak():
    global _stop_flag
    lines = []
    while True:
        line = sys.stdin.readline()
        if not line:
            return
        line = line.rstrip("\n")
        if line == ".":
            break
        lines.append(line)

    plain_text = strip_ssml("\n".join(lines))
    if not plain_text:
        send("201 Speaking finished")
        return

    _stop_flag = False
    try:
        audio_bytes = call_tts(plain_text)
    except Exception as e:
        send(f"301-ERROR: {e}")
        send("301 ERROR")
        return

    if _stop_flag:
        send("202 Speaking stopped")
        return

    send("200 Speaking started")
    try:
        play_audio(audio_bytes)
    except Exception:
        pass

    if _stop_flag:
        send("202 Speaking stopped")
    else:
        send("201 Speaking finished")


def handle_stop():
    global _stop_flag, _player_proc
    _stop_flag = True
    if _player_proc:
        try:
            _player_proc.kill()
            _player_proc.wait()
        except OSError:
            pass
    send_ok()


def handle_command(line: str):
    global _player_proc
    if not line:
        return

    cmd = line.split(None, 1)[0].upper()

    if cmd == "INIT":
        send_ok(f"Speech Dispatcher {MODULE_NAME} module")
    elif cmd == "SPEAK":
        handle_speak()
    elif cmd == "STOP":
        handle_stop()
    elif cmd == "PAUSE":
        if _player_proc:
            try:
                _player_proc.send_signal(signal.SIGSTOP)
            except OSError:
                pass
        send_ok()
    elif cmd == "RESUME":
        if _player_proc:
            try:
                _player_proc.send_signal(signal.SIGCONT)
            except OSError:
                pass
        send_ok()
    elif cmd == "QUIT":
        handle_stop()
        send_ok()
        sys.exit(0)
    else:
        send_ok()


def load_env():
    global API_KEY, BASE_URL, VOICE, FORMAT
    for env_path in [
        os.path.expanduser("~/.config/speech-dispatcher/mimo-tts.env"),
        "/etc/speech-dispatcher/mimo-tts.env",
    ]:
        if os.path.isfile(env_path):
            with open(env_path) as f:
                for line in f:
                    line = line.strip()
                    if not line or line.startswith("#"):
                        continue
                    if "=" in line:
                        key, _, val = line.partition("=")
                        key = key.strip()
                        val = val.strip().strip('"').strip("'")
                        os.environ.setdefault(key, val)
            break

    API_KEY = os.environ.get("MIMO_API_KEY", "")
    BASE_URL = os.environ.get("MIMO_API_URL", BASE_URL)
    VOICE = os.environ.get("MIMO_VOICE", VOICE)
    FORMAT = os.environ.get("MIMO_FORMAT", FORMAT)


def main():
    signal.signal(signal.SIGINT, signal.SIG_IGN)
    signal.signal(signal.SIGTERM, lambda s, f: sys.exit(0))
    load_env()

    for line in sys.stdin:
        handle_command(line.strip())


if __name__ == "__main__":
    main()
