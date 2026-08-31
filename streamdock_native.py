#!/usr/bin/env python3
"""Native KDE-friendly editor and runtime for the VSDinside Stream Dock N4E."""

from __future__ import annotations

import argparse
import copy
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any

sys.path.insert(0, "/usr/share/streamdock")

from PySide6.QtCore import QTimer, Qt
from PySide6.QtGui import QAction, QIcon
from PySide6.QtWidgets import (
    QApplication, QComboBox, QFileDialog, QFormLayout, QGroupBox, QHBoxLayout,
    QLabel, QLineEdit, QListWidget, QMainWindow, QMenu, QPushButton, QScrollArea,
    QSpinBox, QSystemTrayIcon, QVBoxLayout, QWidget,
)

from streamdock_wrapper import Controller, PRESETS


def command_text(command: list[str]) -> str:
    return " ".join(command or [])


def command_value(text: str) -> list[str]:
    return text.strip().split() if text.strip() else []


class StreamDockWindow(QMainWindow):
    def __init__(self, controller: Controller, state_path: Path):
        super().__init__()
        self.controller = controller
        self.shutdown_started = False
        self.state_path = state_path
        self.image_dir = state_path.parent / "images"
        self.image_dir.mkdir(parents=True, exist_ok=True)
        self.state = self.load_state()
        self.active_profile = self.state["active"]
        self.selected_key = 1
        self.selected_dial = 1
        self.profile_list = QListWidget()
        self.preview_keys: list[QPushButton] = []
        self.key_label = QLineEdit()
        self.key_command = QLineEdit()
        self.key_folder = QComboBox()
        self.rule_app = QLineEdit()
        self.rule_profile = QComboBox()
        self.dial_fields: dict[str, QLineEdit] = {}
        self.status = QLabel("Starting device...")
        self.setWindowTitle("StreamDock N4E")
        self.setMinimumSize(1050, 700)
        self.build_ui()
        self.profile_list.currentTextChanged.connect(self.load_profile)
        self.refresh_profiles()
        self.load_profile(self.active_profile)
        self.controller.folder_handler = self.open_folder
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.check_active_app)
        self.timer.start(1500)

    def closeEvent(self, event: Any) -> None:
        if self.shutdown_started:
            event.accept()
            return
        self.shutdown_started = True
        self.tray.hide()
        self.controller.stop()
        event.accept()
        QApplication.instance().quit()

    def load_state(self) -> dict[str, Any]:
        if self.state_path.exists():
            try:
                state = json.loads(self.state_path.read_text(encoding="utf-8"))
                if isinstance(state, dict) and isinstance(state.get("profiles"), dict):
                    state.setdefault("active", "Default")
                    state.setdefault("rules", {})
                    if state["active"] in state["profiles"]:
                        return state
            except (OSError, json.JSONDecodeError):
                pass
        return {"active": "Default", "profiles": {"Default": copy.deepcopy(self.controller.config)}, "rules": {}}

    def save_state(self) -> None:
        self.state["active"] = self.active_profile
        self.state_path.parent.mkdir(parents=True, exist_ok=True)
        self.state_path.write_text(json.dumps(self.state, indent=2) + "\n", encoding="utf-8")

    def build_ui(self) -> None:
        central = QWidget()
        root = QHBoxLayout(central)
        self.setCentralWidget(central)
        sidebar = QVBoxLayout()
        sidebar.addWidget(QLabel("LAYOUTS / FOLDERS"))
        sidebar.addWidget(self.profile_list, 1)
        new_profile = QPushButton("New folder")
        new_profile.clicked.connect(self.new_profile)
        sidebar.addWidget(new_profile)
        preset = QComboBox()
        preset.addItem("Apply preset...")
        preset.addItems(PRESETS)
        preset.currentTextChanged.connect(self.apply_preset)
        sidebar.addWidget(preset)
        root.addLayout(sidebar, 1)

        content = QVBoxLayout()
        header = QHBoxLayout()
        header.addWidget(QLabel("VSDinside Stream Dock N4E"))
        self.brightness = QSpinBox()
        self.brightness.setRange(0, 100)
        header.addWidget(QLabel("Brightness"))
        header.addWidget(self.brightness)
        save = QPushButton("Save to device")
        save.clicked.connect(self.save_current)
        header.addWidget(save)
        self.status.setAlignment(Qt.AlignmentFlag.AlignRight)
        header.addWidget(self.status, 1)
        content.addLayout(header)

        device = QGroupBox("Hardware layout")
        device_layout = QVBoxLayout(device)
        touch_row = QHBoxLayout()
        self.touch_bar = QLineEdit()
        self.touch_bar.setPlaceholderText("Touch-bar image path")
        choose_touch = QPushButton("Choose touch image")
        choose_touch.clicked.connect(lambda: self.choose_image(self.touch_bar))
        touch_row.addWidget(self.touch_bar, 1)
        touch_row.addWidget(choose_touch)
        device_layout.addLayout(touch_row)
        keys = QHBoxLayout()
        for row in range(2):
            column = QVBoxLayout()
            for index in range(row * 5 + 1, row * 5 + 6):
                button = QPushButton(f"{index:02d}")
                button.setMinimumSize(130, 75)
                button.clicked.connect(lambda _checked=False, key=index: self.select_key(key))
                self.preview_keys.append(button)
                column.addWidget(button)
            keys.addLayout(column)
        device_layout.addLayout(keys)
        dials = QHBoxLayout()
        for index in range(1, 5):
            button = QPushButton(f"DIAL {index}")
            button.clicked.connect(lambda _checked=False, dial=index: self.select_dial(dial))
            dials.addWidget(button)
        device_layout.addLayout(dials)
        content.addWidget(device)

        rules = QGroupBox("Automatic app layouts")
        rules_form = QFormLayout(rules)
        rules_form.addRow("Application id", self.rule_app)
        rules_form.addRow("Use layout", self.rule_profile)
        add_rule = QPushButton("Add / replace rule")
        add_rule.clicked.connect(self.add_rule)
        rules_form.addRow(add_rule)
        content.addWidget(rules)

        editor = QGroupBox("Selected control")
        form = QFormLayout(editor)
        form.addRow("Key label", self.key_label)
        form.addRow("Command", self.key_command)
        self.key_folder.addItem("No folder", "")
        form.addRow("Open folder", self.key_folder)
        self.key_label.editingFinished.connect(self.update_selected_key)
        self.key_command.editingFinished.connect(self.update_selected_key)
        self.key_folder.currentIndexChanged.connect(self.update_selected_key)
        for direction in ("left", "right", "press"):
            field = QLineEdit()
            field.editingFinished.connect(self.update_selected_dial)
            self.dial_fields[direction] = field
            form.addRow(f"Dial {direction}", field)
        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setWidget(editor)
        content.addWidget(scroll)
        root.addLayout(content, 4)

        self.tray = QSystemTrayIcon(QIcon.fromTheme("input-dial"), self)
        menu = QMenu(self)
        show_action = QAction("Show StreamDock", self)
        show_action.triggered.connect(self.showNormal)
        menu.addAction(show_action)
        self.tray.setContextMenu(menu)
        self.tray.show()

    def current(self) -> dict[str, Any]:
        return self.state["profiles"][self.active_profile]

    def refresh_profiles(self) -> None:
        self.profile_list.clear()
        self.profile_list.addItems(self.state["profiles"])
        self.profile_list.setCurrentRow(list(self.state["profiles"]).index(self.active_profile))
        self.rule_profile.clear()
        self.rule_profile.addItems(self.state["profiles"])

    def load_profile(self, name: str) -> None:
        if not name or name not in self.state["profiles"]:
            return
        self.active_profile = name
        profile = self.current()
        self.brightness.setValue(int(profile.get("brightness", 40)))
        self.touch_bar.setText(profile.get("screen_image", ""))
        for index, button in enumerate(self.preview_keys, 1):
            item = profile.get("buttons", {}).get(str(index), {})
            button.setText(f"{index:02d}\n{item.get('label', f'Key {index}')}")
        self.select_key(self.selected_key)
        self.select_dial(self.selected_dial)
        self.apply_current()

    def apply_current(self) -> None:
        try:
            self.controller.configure(copy.deepcopy(self.current()))
            self.status.setText(f"{len(self.controller.devices)} device(s) connected")
        except Exception as exc:
            self.status.setText(f"Device error: {exc}")

    def select_key(self, key: int) -> None:
        self.selected_key = key
        item = self.current().setdefault("buttons", {}).setdefault(str(key), {"label": f"Key {key}", "command": [], "image": ""})
        self.key_label.setText(item.get("label", ""))
        self.key_command.setText(command_text(item.get("command", [])))
        self.key_folder.blockSignals(True)
        self.key_folder.clear()
        self.key_folder.addItem("No folder", "")
        for name in self.state["profiles"]:
            if name != self.active_profile:
                self.key_folder.addItem(name, name)
        self.key_folder.setCurrentIndex(max(0, self.key_folder.findData(item.get("folder", ""))))
        self.key_folder.blockSignals(False)

    def update_selected_key(self) -> None:
        item = self.current().setdefault("buttons", {}).setdefault(str(self.selected_key), {})
        item["label"] = self.key_label.text()
        item["command"] = command_value(self.key_command.text())
        folder = self.key_folder.currentData()
        if folder:
            item["folder"] = folder
        else:
            item.pop("folder", None)
        self.preview_keys[self.selected_key - 1].setText(f"{self.selected_key:02d}\n{item['label']}")

    def select_dial(self, dial: int) -> None:
        self.selected_dial = dial
        item = self.current().setdefault("dials", {}).setdefault(f"knob_{dial}", {})
        for direction, field in self.dial_fields.items():
            field.setText(command_text(item.get(direction, [])))

    def update_selected_dial(self) -> None:
        item = self.current().setdefault("dials", {}).setdefault(f"knob_{self.selected_dial}", {})
        for direction, field in self.dial_fields.items():
            item[direction] = command_value(field.text())

    def choose_image(self, target: QLineEdit) -> None:
        source, _ = QFileDialog.getOpenFileName(self, "Choose image", "", "Images (*.png *.jpg *.jpeg *.gif)")
        if source:
            target_path = self.image_dir / Path(source).name
            shutil.copy2(source, target_path)
            target.setText(str(target_path))

    def save_current(self) -> None:
        self.update_selected_key()
        self.update_selected_dial()
        self.current()["brightness"] = self.brightness.value()
        self.current()["screen_image"] = self.touch_bar.text()
        self.save_state()
        self.apply_current()

    def new_profile(self) -> None:
        name = f"Folder {len(self.state['profiles'])}"
        self.state["profiles"][name] = copy.deepcopy(self.current())
        self.active_profile = name
        self.refresh_profiles()
        self.load_profile(name)

    def add_rule(self) -> None:
        app_id = self.rule_app.text().strip()
        profile = self.rule_profile.currentText()
        if app_id and profile:
            self.state.setdefault("rules", {})[app_id] = profile
            self.save_state()
            self.status.setText(f"Rule added for {app_id}")

    def open_folder(self, name: str) -> None:
        if name in self.state["profiles"]:
            self.load_profile(name)

    def apply_preset(self, name: str) -> None:
        if name in PRESETS:
            self.state["profiles"][self.active_profile] = copy.deepcopy(PRESETS[name])
            self.load_profile(self.active_profile)

    def check_active_app(self) -> None:
        rules = self.state.get("rules", {})
        if not rules:
            return
        try:
            output = subprocess.check_output(
                ["busctl", "--user", "call", "org.kde.KWin", "/KWin", "org.kde.KWin", "queryWindowInfo"],
                text=True, stderr=subprocess.DEVNULL, timeout=0.5,
            )
            match = re.search(r'"(?:desktopFile|resourceClass)" s "([^"]+)"', output)
            app_id = match.group(1) if match else ""
            target = rules.get(app_id) or rules.get(app_id.lower())
            if target and target != self.active_profile:
                self.load_profile(target)
        except (OSError, subprocess.SubprocessError):
            pass


def main() -> None:
    parser = argparse.ArgumentParser(description="Native StreamDock N4E controller")
    parser.add_argument("--sdk-path", default="/usr/share/streamdock/sdk/Python-SDK")
    parser.add_argument("--config", default=str(Path.home() / ".config/streamdock/config.json"))
    args = parser.parse_args()
    config_path = Path(args.config).expanduser().resolve()
    controller = Controller(config_path, args.sdk_path)
    try:
        controller.start()
    except Exception as exc:
        controller.last_error = str(exc)
    app = QApplication(sys.argv)
    app.setApplicationName("StreamDock N4E")
    window = StreamDockWindow(controller, config_path.with_name("profiles.json"))
    window.show()
    result = app.exec()
    if not window.shutdown_started:
        controller.stop()
    raise SystemExit(result)


if __name__ == "__main__":
    main()
