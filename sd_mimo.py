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
import hashlib
import redis
import functools
import logging
import threading

if os.environ.get("MIMO_DEBUG"):
    logging.basicConfig(level=logging.DEBUG, format="%(message)s")
else:
    logging.basicConfig(level=logging.WARNING)

MODULE_NAME = "mimo"

API_KEY = ""
VOICE = "mimo_default"
STYLE = ""

_cache = None
_player_proc = None
_stop_flag = False


def _compress_audio(wav: bytes) -> bytes:
    result = subprocess.run(
        ["sox", "-t", "wav", "-", "-t", "ogg", "-"], input=wav, capture_output=True
    )
    return result.stdout


def _get_cache():
    global _cache
    if _cache is None:
        try:
            _cache = redis.Redis(host="localhost", port=6379)
            _cache.ping()
            logging.debug("[_get_cache] Redis connected")
        except Exception as e:
            logging.debug(f"[_get_cache] Redis connection failed: {e}")
            _cache = False
    return _cache if _cache else None


def tts_cache(func):
    @functools.wraps(func)
    def wrapper(text: str) -> bytes:
        cache = _get_cache()
        key = f"mimo:tts:{hashlib.sha256(text.encode()).hexdigest()}.ogg"
        logging.debug(f"[tts_cache] ENTER with key={key[:30]}...")

        if cache is not None:
            cached = cache.get(key)
            if cached is not None:
                logging.debug(f"[tts_cache] CACHE HIT, returning {len(cached)} bytes")
                return cached

        logging.debug(f"[tts_cache] CACHE MISS, calling call_tts...")
        wav = func(text)
        logging.debug(f"[tts_cache] call_tts returned {len(wav)} bytes")

        if cache is not None:

            def _cache_audio():
                try:
                    cache.setex(key, 7 * 86400, _compress_audio(wav))
                except Exception:
                    pass

            threading.Thread(target=_cache_audio, daemon=True).start()

        logging.debug(f"[tts_cache] EXIT")
        return wav

    return wrapper


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


@tts_cache
def call_tts(text: str) -> bytes:
    logging.debug(f"[call_tts] ENTER with text={text[:50]!r}...")
    url = "https://api.xiaomimimo.com/v1/chat/completions"
    messages = []
    if STYLE:
        messages.append({"role": "user", "content": STYLE})
    messages.append({"role": "assistant", "content": text})
    payload = {
        "model": "mimo-v2.5-tts",
        "messages": messages,
        "audio": {"format": "wav", "voice": VOICE},
    }

    data = json.dumps(payload).encode("utf-8")

    req = urllib.request.Request(
        url,
        data=data,
        headers={"api-key": API_KEY, "Content-Type": "application/json"},
        method="POST",
    )
    logging.debug(f"[call_tts] Request to {url}")

    try:
        response = urllib.request.urlopen(req, timeout=30)
        result = json.loads(response.read().decode("utf-8"))
        logging.debug(
            f"[call_tts] Got status {response.status}, keys={list(result.keys())}"
        )
    except urllib.error.URLError as e:
        logging.debug(f"[call_tts] URLError: {e}")
        raise RuntimeError(f"HTTP request failed: {e}") from e
    except json.JSONDecodeError as e:
        logging.debug(f"[call_tts] JSONDecodeError: {e}")
        raise RuntimeError(f"Failed to parse API response: {e}") from e
    except Exception as e:
        logging.debug(f"[call_tts] Unexpected error: {type(e).__name__}: {e}")
        raise

    logging.debug(f"[call_tts] EXIT - returning audio bytes")
    message = result["choices"][0]["message"]
    audio_data = message["audio"]["data"]
    return base64.b64decode(audio_data)


def play_audio(audio_bytes: bytes):
    """Play audio bytes using SoX (auto-detects format)."""
    global _player_proc

    if not audio_bytes:
        raise ValueError("Cannot play empty audio data")

    _player_proc = subprocess.Popen(
        ["sox", "-", "-d"],
        stdin=subprocess.PIPE,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.PIPE,
    )
    _, stderr = _player_proc.communicate(input=audio_bytes)

    if _player_proc.returncode != 0:
        error_msg = stderr.decode() if stderr else "Unknown error"
        raise RuntimeError(f"SoX playback failed: {error_msg}")

    _player_proc = None


def handle_speak():
    global _stop_flag
    logging.debug("[handle_speak] ENTER")
    lines = []
    while True:
        line = sys.stdin.readline()
        if not line:
            logging.debug("[handle_speak] EOF, returning")
            return
        line = line.rstrip("\n")
        if line == ".":
            break
        lines.append(line)

    plain_text = strip_ssml("\n".join(lines))
    logging.debug(f"[handle_speak] plain_text={plain_text[:50]!r}...")
    if not plain_text:
        send("201 Speaking finished")
        logging.debug("[handle_speak] empty text, returning")
        return

    _stop_flag = False
    try:
        audio_bytes = call_tts(plain_text)
    except Exception as e:
        logging.debug(f"[handle_speak] call_tts EXCEPTION: {e}")
        send(f"301 ERROR: {e}")
        return

    if _stop_flag:
        send("202 Speaking stopped")
        return

    send("200 Speaking started")
    try:
        play_audio(audio_bytes)
    except Exception as e:
        logging.warning(f"play_audio failed: {e}")

    send("202 Speaking stopped" if _stop_flag else "201 Speaking finished")


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
    logging.debug(f"[handle_command] ENTER with line={line!r}")
    if not line:
        return

    cmd = line.split(None, 1)[0].upper()
    logging.debug(f"[handle_command] cmd={cmd}")

    match cmd:
        case "INIT":
            send_ok(f"Speech Dispatcher {MODULE_NAME} module")
        case "SPEAK":
            handle_speak()
        case "STOP":
            handle_stop()
        case "PAUSE" | "RESUME":
            if _player_proc:
                try:
                    _player_proc.send_signal(
                        signal.SIGSTOP if cmd == "PAUSE" else signal.SIGCONT
                    )
                except OSError:
                    pass
            send_ok()
        case "QUIT":
            handle_stop()
            send_ok()
            sys.exit(0)
        case _:
            send_ok()


def load_env():
    global API_KEY, VOICE, STYLE
    # Check environment variable first
    API_KEY = os.environ.get("MIMO_API_KEY", "")
    VOICE = os.environ.get("MIMO_VOICE", "mimo_default")
    STYLE = os.environ.get("MIMO_STYLE", "")

    # If not in env, try config files
    env_loaded = False
    if not API_KEY or not VOICE:
        for env_path in [
            os.path.expanduser("~/.config/speech-dispatcher/mimo-tts.env"),
            "/etc/speech-dispatcher/mimo-tts.env",
        ]:
            if not os.path.isfile(env_path):
                continue
            result = subprocess.run(
                ["awk", "-F=", "/^MIMO_API_KEY=/ {print $2}", env_path],
                capture_output=True,
                text=True,
            )
            if not API_KEY:
                API_KEY = result.stdout.strip()
            result = subprocess.run(
                ["awk", "-F=", "/^MIMO_VOICE=/ {print $2}", env_path],
                capture_output=True,
                text=True,
            )
            if not VOICE or VOICE == "mimo_default":
                voice_val = result.stdout.strip()
                if voice_val:
                    VOICE = voice_val
            result = subprocess.run(
                ["awk", "-F=", "/^MIMO_STYLE=/ {print $2}", env_path],
                capture_output=True,
                text=True,
            )
            if not STYLE:
                style_val = result.stdout.strip()
                if style_val:
                    STYLE = style_val
            if API_KEY:
                env_loaded = True
                break

    if not API_KEY:
        raise RuntimeError("MIMO_API_KEY is not set")


def main():
    signal.signal(signal.SIGINT, signal.SIG_IGN)
    signal.signal(signal.SIGTERM, lambda s, f: sys.exit(0))
    load_env()
    logging.debug("[main] Starting main loop")

    for line in sys.stdin:
        logging.debug(f"[main] Got line: {line.strip()!r}")
        handle_command(line.strip())


if __name__ == "__main__":
    main()
