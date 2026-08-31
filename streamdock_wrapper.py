#!/usr/bin/env python3
"""Small local controller for StreamDock devices using the official Python SDK."""

from __future__ import annotations

import argparse
import copy
import json
import os
import subprocess
import sys
import threading
from pathlib import Path
from typing import Any

from flask import Flask, jsonify, request, send_from_directory
from PIL import Image, UnidentifiedImageError
from werkzeug.utils import secure_filename


def _dial(left: list[str], right: list[str], press: list[str]) -> dict[str, list[str]]:
    return {"left": left, "right": right, "press": press}


PRESETS: dict[str, dict[str, Any]] = {
    "n4-default": {
        "brightness": 40,
        "screen_image": "",
        "swipes": {"left": [], "right": []},
        "buttons": {
            "1": {"label": "Previous", "command": ["playerctl", "previous"]},
            "2": {"label": "Play / pause", "command": ["playerctl", "play-pause"]},
            "3": {"label": "Next", "command": ["playerctl", "next"]},
            "4": {"label": "Volume down", "command": ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"]},
            "5": {"label": "Mute audio", "command": ["wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"]},
            "6": {"label": "Volume up", "command": ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+"]},
            "7": {"label": "Brave browser", "command": ["brave-browser"]},
            "8": {"label": "OBS Studio", "command": ["obs"]},
            "9": {"label": "Terminal", "command": ["gnome-terminal"]},
            "10": {"label": "Files", "command": ["xdg-open", "."]},
        },
        "dials": {
            "knob_1": _dial(["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"], ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+"], ["wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"]),
            "knob_2": _dial(["playerctl", "previous"], ["playerctl", "next"], ["playerctl", "play-pause"]),
            "knob_3": _dial([], [], ["obs"]),
            "knob_4": _dial([], [], ["brave-browser"]),
        },
    },
    "n4-media": {
        "brightness": 45,
        "screen_image": "",
        "swipes": {"left": [], "right": []},
        "buttons": {
            "1": {"label": "Previous", "command": ["playerctl", "previous"]},
            "2": {"label": "Play / pause", "command": ["playerctl", "play-pause"]},
            "3": {"label": "Next", "command": ["playerctl", "next"]},
            "4": {"label": "Volume down", "command": ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"]},
            "5": {"label": "Mute", "command": ["wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"]},
            "6": {"label": "Volume up", "command": ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+"]},
        },
        "dials": {
            "knob_1": _dial(["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"], ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+"], ["wpctl", "set-mute", "@DEFAULT_AUDIO_SINK@", "toggle"]),
            "knob_2": _dial(["playerctl", "previous"], ["playerctl", "next"], ["playerctl", "play-pause"]),
            "knob_3": _dial([], [], []),
            "knob_4": _dial([], [], []),
        },
    },
}


def load_sdk(sdk_path: str | None) -> Any:
    """Load the SDK from a checkout without copying or modifying it."""
    raw_path = sdk_path or os.environ.get("STREAMDOCK_SDK_PATH")
    if not raw_path:
        raise RuntimeError("Set STREAMDOCK_SDK_PATH or pass --sdk-path to Python-SDK/src")
    root = Path(raw_path).expanduser().resolve()
    if not (root / "StreamDock").is_dir():
        raise RuntimeError(f"SDK path does not contain StreamDock/: {root}")
    sys.path.insert(0, str(root))
    from StreamDock.DeviceManager import DeviceManager
    from StreamDock.InputTypes import EventType
    from StreamDock.Devices.StreamDockN4Pro import StreamDockN4Pro
    from StreamDock.ProductIDs import g_products

    # The VSD N4E reports 0x5548:0x1004, which the SDK does not list yet.
    if not any(vid == 0x5548 and pid == 0x1004 for vid, pid, _ in g_products):
        g_products.append((0x5548, 0x1004, StreamDockN4Pro))

    return DeviceManager, EventType


def read_config(path: Path) -> dict[str, Any]:
    if not path.exists():
        return {"brightness": 40, "screen_image": "", "swipes": {"left": [], "right": []}, "buttons": {}, "dials": {}}
    with path.open(encoding="utf-8") as handle:
        data = json.load(handle)
    if not isinstance(data, dict) or not isinstance(data.get("buttons", {}), dict):
        raise ValueError("config must contain a buttons object")
    data.setdefault("brightness", 40)
    return data


def write_config(path: Path, data: dict[str, Any]) -> None:
    buttons = data.get("buttons", {})
    if not isinstance(buttons, dict):
        raise ValueError("buttons must be an object")
    brightness = int(data.get("brightness", 40))
    if not 0 <= brightness <= 100:
        raise ValueError("brightness must be between 0 and 100")
    clean: dict[str, Any] = {"brightness": brightness, "screen_image": str(data.get("screen_image", "")), "swipes": {"left": [], "right": []}, "buttons": {}, "dials": {}}
    swipes = data.get("swipes", {})
    if not isinstance(swipes, dict):
        raise ValueError("swipes must be an object")
    for direction in ("left", "right"):
        command = swipes.get(direction, [])
        if not isinstance(command, list) or any(not isinstance(item, str) for item in command):
            raise ValueError(f"swipe {direction} command must be a list of strings")
        clean["swipes"][direction] = command
    for raw_key, button in buttons.items():
        key = int(raw_key)
        if not 1 <= key <= 32 or not isinstance(button, dict):
            raise ValueError("buttons must use numeric keys from 1 to 32")
        command = button.get("command", [])
        if not isinstance(command, list) or any(not isinstance(item, str) for item in command):
            raise ValueError(f"button {key} command must be a list of strings")
        clean_button = {
            "label": str(button.get("label", f"Key {key}")),
            "image": str(button.get("image", "")),
            "command": command,
        }
        if button.get("folder"):
            clean_button["folder"] = str(button["folder"])
        clean["buttons"][str(key)] = clean_button
    dials = data.get("dials", {})
    if not isinstance(dials, dict):
        raise ValueError("dials must be an object")
    for knob in ("knob_1", "knob_2", "knob_3", "knob_4"):
        settings = dials.get(knob, {})
        if not isinstance(settings, dict):
            raise ValueError(f"{knob} must be an object")
        for direction in ("left", "right", "press"):
            command = settings.get(direction, [])
            if not isinstance(command, list) or any(not isinstance(item, str) for item in command):
                raise ValueError(f"{knob} {direction} command must be a list of strings")
            clean["dials"].setdefault(knob, {})[direction] = command
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as handle:
        json.dump(clean, handle, indent=2)
        handle.write("\n")


class Controller:
    def __init__(self, config_path: Path, sdk_path: str | None = None):
        self.config_path = config_path
        self.config = read_config(config_path)
        self.sdk_path = sdk_path
        self.devices: list[Any] = []
        self.manager: Any = None
        self.event_type: Any = None
        self.lock = threading.RLock()
        self.last_error = ""
        self.folder_handler: Any = None

    def configure(self, data: dict[str, Any]) -> None:
        write_config(self.config_path, data)
        with self.lock:
            self.config = read_config(self.config_path)
            for device in list(self.devices):
                self.apply(device, open_device=False)

    def apply(self, device: Any, open_device: bool = True) -> None:
        if open_device:
            if not device.open():
                raise RuntimeError(f"failed to open {device.path}")
            device.init()
        device.set_brightness(int(self.config.get("brightness", 40)))
        screen_image = self.config.get("screen_image", "")
        if screen_image and Path(screen_image).expanduser().is_file():
            device.set_touchscreen_image(str(Path(screen_image).expanduser().resolve()))
        for raw_key, button in self.config.get("buttons", {}).items():
            image = button.get("image", "")
            if image and Path(image).expanduser().is_file():
                device.set_key_image(int(raw_key), str(Path(image).expanduser().resolve()))
        device.refresh()
        device.set_key_callback(self.handle_event)
        if hasattr(device, "set_touch_bar_callback"):
            device.set_touch_bar_callback(self.handle_event)

    def added(self, device: Any) -> None:
        try:
            with self.lock:
                if device not in self.devices:
                    self.devices.append(device)
                self.apply(device)
        except Exception as exc:  # device callbacks must never kill SDK listener
            self.last_error = str(exc)
            print(f"device setup failed: {exc}", flush=True)

    def removed(self, device: Any) -> None:
        with self.lock:
            self.devices = [item for item in self.devices if item is not device]

    def handle_event(self, device: Any, event: Any) -> None:
        try:
            if event.event_type == self.event_type.BUTTON:
                if event.state != 1:
                    return
                button = self.config.get("buttons", {}).get(str(event.key.value), {})
                if button.get("folder") and self.folder_handler:
                    self.folder_handler(str(button["folder"]))
                    return
                command = button.get("command", [])
            elif event.event_type == self.event_type.KNOB_ROTATE:
                knob = self.config.get("dials", {}).get(event.knob_id.value, {})
                command = knob.get(event.direction.value, [])
            elif event.event_type == self.event_type.KNOB_PRESS:
                if event.state != 1:
                    return
                knob = self.config.get("dials", {}).get(event.knob_id.value, {})
                command = knob.get("press", [])
            elif event.event_type == self.event_type.SWIPE:
                command = self.config.get("swipes", {}).get(event.direction.value, [])
            else:
                return
            if command:
                subprocess.Popen(command, start_new_session=True)
        except Exception as exc:
            self.last_error = str(exc)
            print(f"button action failed: {exc}", flush=True)

    def start(self) -> None:
        device_manager, self.event_type = load_sdk(self.sdk_path)
        self.manager = device_manager()
        self.devices = self.manager.enumerate()
        for device in list(self.devices):
            self.added(device)
        threading.Thread(
            target=self.manager.listen,
            kwargs={"on_device_added": self.added, "on_device_removed": self.removed, "auto_open": False},
            daemon=True,
        ).start()

    def stop(self) -> None:
        with self.lock:
            for device in reversed(self.devices):
                try:
                    device.set_key_callback(None)
                    device.clearAllIcon()
                    device.refresh()
                    device.close()
                except Exception as exc:
                    print(f"device close failed: {exc}", flush=True)
            self.devices.clear()


def create_app(controller: Controller) -> Flask:
    app = Flask(__name__, static_folder="static", static_url_path="")
    app.config["MAX_CONTENT_LENGTH"] = 8 * 1024 * 1024

    @app.get("/")
    def index():
        return send_from_directory(app.static_folder, "index.html")

    @app.get("/api/config")
    def get_config():
        return jsonify(controller.config)

    @app.get("/api/presets")
    def get_presets():
        return jsonify({name: preset for name, preset in PRESETS.items()})

    @app.post("/api/presets/<name>")
    def use_preset(name: str):
        if name not in PRESETS:
            return jsonify(error="unknown preset"), 404
        try:
            controller.configure(copy.deepcopy(PRESETS[name]))
            return jsonify(controller.config)
        except (ValueError, TypeError, RuntimeError) as exc:
            return jsonify(error=str(exc)), 400

    @app.post("/api/upload")
    def upload_image():
        upload = request.files.get("file")
        if upload is None or not upload.filename:
            return jsonify(error="choose an image first"), 400
        filename = secure_filename(upload.filename)
        if Path(filename).suffix.lower() not in {".jpg", ".jpeg", ".png", ".gif"}:
            return jsonify(error="only JPG, PNG, and GIF images are supported"), 400
        target_dir = controller.config_path.parent / "images"
        target_dir.mkdir(parents=True, exist_ok=True)
        target = target_dir / filename
        upload.save(target)
        try:
            with Image.open(target) as image:
                image.verify()
        except (UnidentifiedImageError, OSError):
            target.unlink(missing_ok=True)
            return jsonify(error="file is not a readable image"), 400
        return jsonify(path=str(target.resolve()))

    @app.put("/api/config")
    def put_config():
        try:
            controller.configure(request.get_json(force=True))
            return jsonify(controller.config)
        except (ValueError, TypeError, json.JSONDecodeError, RuntimeError) as exc:
            return jsonify(error=str(exc)), 400

    @app.get("/api/status")
    def status():
        return jsonify(devices=len(controller.devices), error=controller.last_error)

    return app


def main() -> None:
    parser = argparse.ArgumentParser(description="StreamDock local wrapper")
    parser.add_argument("--sdk-path", help="path to official SDK Python-SDK/src")
    parser.add_argument("--config", default="config.json", help="JSON configuration path")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--port", type=int, default=8333)
    args = parser.parse_args()
    controller = Controller(Path(args.config).resolve(), args.sdk_path)
    try:
        controller.start()
    except Exception as exc:
        print(f"SDK unavailable: {exc}", file=sys.stderr)
    app = create_app(controller)
    try:
        app.run(host=args.host, port=args.port, debug=False)
    finally:
        controller.stop()


if __name__ == "__main__":
    main()
