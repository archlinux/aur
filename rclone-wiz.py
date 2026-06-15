#!/usr/bin/env python3
import sys
import subprocess
import os
import stat
import shutil
import re
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout,
                             QHBoxLayout, QLabel, QComboBox, QLineEdit,
                             QPushButton, QTextEdit, QGroupBox, QFileDialog,
                             QMessageBox, QDialog, QTextBrowser, QTableWidget,
                             QTableWidgetItem, QCheckBox, QGraphicsDropShadowEffect)
from PyQt6.QtGui import QFont, QAction, QDesktopServices, QIcon, QColor
from PyQt6.QtCore import Qt, QThread, pyqtSignal, QUrl
import json

# ==========================================
# Worker Threads (Non-blocking I/O)
# ==========================================

class MountThread(QThread):
    """Handles the execution of the bash mount script in an isolated thread."""
    error_signal = pyqtSignal(str)
    success_signal = pyqtSignal(str)

    def __init__(self, script_path):
        super().__init__()
        self.script_path = script_path
        self.process = None

    def run(self):
        try:
            # Initialize subprocess with pipe capture for stdout/stderr evaluation
            self.process = subprocess.Popen(["bash", self.script_path],
                                            stdout=subprocess.PIPE,
                                            stderr=subprocess.PIPE,
                                            text=True)
            try:
                # Wait briefly to catch immediate initialization errors (e.g., invalid flags)
                _, err = self.process.communicate(timeout=1.5)
                if self.process.returncode != 0:
                    self.error_signal.emit(f"Process exited with code {self.process.returncode}:\n{err}")
            except subprocess.TimeoutExpired:
                # A timeout implies the mount process successfully daemonized/stayed open
                self.success_signal.emit(f"Status: Drive mounted via {os.path.basename(self.script_path)}")
        except Exception as e:
            self.error_signal.emit(str(e))

    def stop(self):
        # Send SIGTERM to the active subprocess if it exists
        if self.process:
            self.process.terminate()

class RcloneNonInteractiveThread(QThread):
    """Executes rclone config commands in non-interactive mode and parses JSON output."""
    finished_signal = pyqtSignal(dict)
    error_signal = pyqtSignal(str)

    def __init__(self, cmd_args):
        super().__init__()
        self.cmd_args = cmd_args
        self.process = None

    def stop(self):
        if self.process:
            try:
                self.process.terminate()
                self.process.kill()
            except Exception:
                pass


    def run(self):
        try:
            # We must use Popen and read stderr/stdout because rclone prompts for browser auth
            # on stderr, while outputting the JSON question on stdout.
            self.process = subprocess.Popen(
                ["rclone"] + self.cmd_args,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            
            import threading
            stderr_lines = []
            
            def read_stderr():
                for line in self.process.stderr:
                    stderr_lines.append(line)
                    if "http://127.0.0.1:" in line or "http://localhost:" in line:
                        import re
                        match = re.search(r'(http://[^\s]+)', line)
                        if match:
                            url = match.group(1)
                            QDesktopServices.openUrl(QUrl(url))
                            
            t = threading.Thread(target=read_stderr)
            t.daemon = True
            t.start()
            
            stdout = self.process.stdout.read()
            self.process.wait()
            t.join(timeout=1)
            
            stderr = "".join(stderr_lines)

            if stdout.strip():
                try:
                    data = json.loads(stdout)
                    self.finished_signal.emit(data)
                except json.JSONDecodeError:
                    if self.process.returncode != 0:
                        self.error_signal.emit(f"Error parsing response: {stdout}\nStderr: {stderr}")
                    else:
                        self.finished_signal.emit({}) # Empty state implies done
            else:
                if self.process.returncode != 0:
                    self.error_signal.emit(f"Process failed: {stderr}")
                else:
                    self.finished_signal.emit({}) # empty response but success
        except Exception as e:
            self.error_signal.emit(str(e))

class RcloneConfigWizard(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Add / Edit Remote")
        self.setFixedWidth(550)
        self.setMinimumHeight(250)
        self.setModal(True)
        
        self.layout = QVBoxLayout(self)
        self.layout.setSpacing(10)
        
        # Container for dynamic form fields
        self.form_layout = QVBoxLayout()
        self.layout.addLayout(self.form_layout)
        
        self.layout.addStretch()
        self.thread = None
        
        # Next button
        self.btn_next = QPushButton("Next")
        self.btn_next.clicked.connect(self._on_next)
        self.btn_next.setStyleSheet("font-weight: bold; padding: 8px;")
        
        self.lbl_status = QLabel("")
        self.lbl_status.setStyleSheet("color: #888888;")
        self.layout.addWidget(self.lbl_status)
        self.layout.addWidget(self.btn_next)
        
        self.state = None
        self.remote_name = ""
        self.remote_type = ""
        
        # Step 1: Request providers
        self._set_status("Loading providers...")
        self.btn_next.setEnabled(False)
        self._load_providers()
        
    def _set_status(self, text):
        self.lbl_status.setText(text)

    def closeEvent(self, event):
        if hasattr(self, 'thread') and self.thread and self.thread.isRunning():
            self.thread.stop()
            self.thread.wait(500)
        super().closeEvent(event)

    def reject(self):
        if hasattr(self, 'thread') and self.thread and self.thread.isRunning():
            self.thread.stop()
            self.thread.wait(500)
        super().reject()

    def _clear_layout(self, layout):
        if layout is not None:
            while layout.count():
                item = layout.takeAt(0)
                widget = item.widget()
                if widget is not None:
                    widget.deleteLater()
                else:
                    self._clear_layout(item.layout())

    def _load_providers(self):
        try:
            res = subprocess.run(["rclone", "config", "providers"], capture_output=True, text=True, check=True)
            self.providers = json.loads(res.stdout)
            self._render_initial_step()
        except Exception as e:
            self._set_status(f"Error loading providers: {e}")

    def _render_initial_step(self):
        self._set_status("Step 1: Choose a Name and Provider Type")
        self._clear_layout(self.form_layout)
        
        # Render initial step
        self.lbl_name = QLabel("Remote Name (e.g. mygdrive):")
        self.entry_name = QLineEdit()
        self.form_layout.addWidget(self.lbl_name)
        self.form_layout.addWidget(self.entry_name)
        
        self.lbl_type = QLabel("Storage Type:")
        self.combo_type = QComboBox()
        for p in self.providers:
            self.combo_type.addItem(f"{p['Description']} ({p['Name']})", p['Name'])
            
        # Select Google Drive by default if it exists
        index = self.combo_type.findData("drive")
        if index >= 0:
            self.combo_type.setCurrentIndex(index)
            
        self.form_layout.addWidget(self.lbl_type)
        self.form_layout.addWidget(self.combo_type)
        
        self.btn_next.setEnabled(True)

    def _on_next(self):
        self.btn_next.setEnabled(False)
        self._set_status("Processing...")
        
        if self.state is None:
            # First submission: remote name and type
            self.remote_name = self.entry_name.text().strip()
            self.remote_type = self.combo_type.currentData()
            
            if not self.remote_name:
                self._set_status("Error: Remote Name is required.")
                self.btn_next.setEnabled(True)
                return
                
            cmd = ["config", "create", self.remote_name, self.remote_type, "--all", "--non-interactive"]
        else:
            # Subsequent submissions: fetch value from dynamic input
            value = self._get_dynamic_input_value()
            cmd = ["config", "create", self.remote_name, self.remote_type, "--all", "--continue", "--state", self.state, "--result", value, "--non-interactive"]
            
        self.thread = RcloneNonInteractiveThread(cmd)
        self.thread.finished_signal.connect(self._on_step_finished)
        self.thread.error_signal.connect(self._on_step_error)
        self.thread.start()

    def _on_step_error(self, err):
        self._set_status(f"Error: {err}")
        self.btn_next.setEnabled(True)

    def _on_step_finished(self, data):
        self.btn_next.setEnabled(True)
        if not data or not data.get("State"):
            # Configuration is complete
            self._set_status("Configuration Complete!")
            self.btn_next.setText("Finish")
            self.btn_next.clicked.disconnect()
            self.btn_next.clicked.connect(self.accept)
            self._clear_layout(self.form_layout)
            lbl = QLabel(f"Successfully configured remote: <b>{self.remote_name}</b>")
            lbl.setAlignment(Qt.AlignmentFlag.AlignCenter)
            self.form_layout.addWidget(lbl)
            return

        # Render next step
        self.state = data["State"]
        self._render_dynamic_step(data)

    def _render_dynamic_step(self, data):
        self._clear_layout(self.form_layout)
        
        opt = data.get("Option", {})
        err = data.get("Error", "")
        
        if err:
            lbl_err = QLabel(f"Error: {err}")
            lbl_err.setStyleSheet("color: red;")
            self.form_layout.addWidget(lbl_err)
            
        help_text = opt.get("Help", opt.get("Name", "Unknown Option"))
        
        lbl_help = QLabel(help_text)
        lbl_help.setWordWrap(True)
        self.form_layout.addWidget(lbl_help)
        
        self.dynamic_input = None
        
        # Decide input type based on Option properties
        if opt.get("Exclusive") and opt.get("Examples"):
            self.dynamic_input = QComboBox()
            default_val = str(opt.get("Default", ""))
            default_idx = 0
            for i, ex in enumerate(opt.get("Examples", [])):
                self.dynamic_input.addItem(f"{ex.get('Help', ex['Value'])} ({ex['Value']})", ex["Value"])
                if default_val and ex["Value"] == default_val:
                    default_idx = i
            self.dynamic_input.setCurrentIndex(default_idx)
            self.form_layout.addWidget(self.dynamic_input)
        elif opt.get("Type") == "bool":
            self.dynamic_input = QComboBox()
            self.dynamic_input.addItem("Yes (true)", "true")
            self.dynamic_input.addItem("No (false)", "false")
            
            is_team_drive = "team drive" in help_text.lower() or opt.get("Name") == "team_drive"
            if is_team_drive:
                self.dynamic_input.setCurrentIndex(1)
                lbl_hint = QLabel("💡 <b>Recommended:</b> No (Unless using a Google Workspace Shared Drive)")
                lbl_hint.setStyleSheet("color: #27ae60;")
                self.form_layout.addWidget(lbl_hint)
            elif str(opt.get("Default", "")).lower() == "false":
                self.dynamic_input.setCurrentIndex(1)
                
            self.form_layout.addWidget(self.dynamic_input)
        else:
            self.dynamic_input = QLineEdit()
            if opt.get("IsPassword"):
                self.dynamic_input.setEchoMode(QLineEdit.EchoMode.Password)
                
            default_val = str(opt.get("Default", ""))
            if default_val:
                self.dynamic_input.setPlaceholderText(f"Default: {default_val}")
                
            self.form_layout.addWidget(self.dynamic_input)
            
            # If there are examples but it's not exclusive, show them as hints or append to combo (but allow edit)
            if opt.get("Examples"):
                combo = QComboBox()
                combo.setEditable(True)
                for ex in opt.get("Examples", []):
                    combo.addItem(f"{ex['Value']} - {ex.get('Help', '')}", ex["Value"])
                combo.setCurrentText(default_val)
                self.dynamic_input.deleteLater()
                self.dynamic_input = combo
                self.form_layout.addWidget(self.dynamic_input)

        self._set_status("Waiting for input...")

    def _get_dynamic_input_value(self):
        if not self.dynamic_input:
            return ""
            
        if isinstance(self.dynamic_input, QComboBox):
            if self.dynamic_input.isEditable():
                # Extract value before the hyphen if user didn't type a custom one
                text = self.dynamic_input.currentText()
                if " - " in text and text == self.dynamic_input.itemText(self.dynamic_input.currentIndex()):
                    return self.dynamic_input.currentData()
                return text
            else:
                return self.dynamic_input.currentData()
        elif isinstance(self.dynamic_input, QLineEdit):
            return self.dynamic_input.text()
        return ""


class ListRemotesThread(QThread):
    """Executes rclone listremotes in a background thread."""
    finished_signal = pyqtSignal(list)
    error_signal = pyqtSignal(str)

    def run(self):
        try:
            result = subprocess.run(["rclone", "listremotes"], capture_output=True, text=True, check=True)
            remotes = [r.strip(':') for r in result.stdout.strip().split('\n') if r]
            self.finished_signal.emit(remotes)
        except Exception as e:
            self.error_signal.emit(str(e))


# ==========================================
# Main GUI Controller (View/ViewModel)
# ==========================================

class RcloneKdeApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Rclone-WIZ")
        self.resize(750, 650)
        
        # Establish a dedicated configuration directory to isolate application state
        self.config_dir = os.path.expanduser("~/.config/rclone-wiz")
        os.makedirs(self.config_dir, exist_ok=True)
        
        # State variables
        self.script_path = "" 
        self.legacy_script_path = os.path.expanduser("~/rclone_mount_script.sh") # Fallback for v1.0 users
        self.mount_thread = None
        self.config_thread = None
        self.list_remotes_thread = None
        
        self._build_ui()
        self._populate_remotes()

    def _build_ui(self):
        # Initialize menu bar and define core application actions
        menubar = self.menuBar()
        file_menu = menubar.addMenu("File")
        
        delete_all_action = QAction("Delete All Remotes", self)
        delete_all_action.triggered.connect(self._delete_all_remotes)
        file_menu.addAction(delete_all_action)
        file_menu.addSeparator()

        manage_folder_action = QAction("Manage Local Script Folder", self)
        manage_folder_action.triggered.connect(self._open_local_script_folder)
        file_menu.addAction(manage_folder_action)

        manage_mounts_action = QAction("Manage Current Mounted Drives", self)
        manage_mounts_action.triggered.connect(self._show_manage_mounted_drives)
        file_menu.addAction(manage_mounts_action)
        file_menu.addSeparator()

        exit_action = QAction("Exit", self)
        exit_action.triggered.connect(self.close)
        file_menu.addAction(exit_action)
        
        help_menu = menubar.addMenu("Help")
        tutorial_action = QAction("Tutorial: Add Google Drive", self)
        tutorial_action.triggered.connect(self._show_tutorial)
        help_menu.addAction(tutorial_action)
        help_menu.addSeparator()
        about_action = QAction("About", self)
        about_action.triggered.connect(self._show_about)
        help_menu.addAction(about_action)

        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QVBoxLayout(central_widget)
        main_layout.setContentsMargins(30, 30, 30, 30)
        main_layout.setSpacing(25)

        # Title / Header
        lbl_title = QLabel("Cloud Drives")
        lbl_title.setStyleSheet("font-size: 24px; font-weight: bold; font-family: 'SF Pro Display', sans-serif;")
        
        lay_header_actions = QHBoxLayout()
        lay_header_actions.addWidget(lbl_title)
        lay_header_actions.addStretch()
        
        self.btn_config = QPushButton("＋ Add New Drive")
        self.btn_config.setStyleSheet("background-color: #007aff; color: white; font-weight: bold; border: none; padding: 8px 16px;")
        self.btn_config.clicked.connect(self._launch_config)
        lay_header_actions.addWidget(self.btn_config)

        self.btn_config_terminal = QPushButton("Terminal Config")
        self.btn_config_terminal.clicked.connect(self._launch_terminal_config)
        lay_header_actions.addWidget(self.btn_config_terminal)

        main_layout.addLayout(lay_header_actions)

        # Main Container Panel
        panel = QWidget()
        panel.setObjectName("MainPanel")
        
        shadow = QGraphicsDropShadowEffect(self)
        shadow.setBlurRadius(20)
        shadow.setColor(QColor(0, 0, 0, 40))
        shadow.setOffset(0, 8)
        panel.setGraphicsEffect(shadow)
        
        lay_panel = QVBoxLayout(panel)
        lay_panel.setContentsMargins(20, 20, 20, 20)
        lay_panel.setSpacing(20)

        # Remotes
        lay_remote = QHBoxLayout()
        lbl_remote = QLabel("Selected Drive:")
        lbl_remote.setStyleSheet("font-weight: 600; color: #1d1d1f;")
        lay_remote.addWidget(lbl_remote)
        
        self.combo_remote = QComboBox()
        self.combo_remote.setMinimumWidth(250)
        self.combo_remote.currentTextChanged.connect(self._on_remote_changed)
        lay_remote.addWidget(self.combo_remote)
        
        btn_refresh = QPushButton("↻ Refresh")
        btn_refresh.clicked.connect(self._populate_remotes)
        lay_remote.addWidget(btn_refresh)
        lay_remote.addStretch()
        lay_panel.addLayout(lay_remote)

        # Mount Path
        lay_mount = QHBoxLayout()
        lbl_mount = QLabel("Mount Folder:")
        lbl_mount.setStyleSheet("font-weight: 600; color: #1d1d1f;")
        lay_mount.addWidget(lbl_mount)
        
        self.entry_path = QLineEdit()
        self.entry_path.setPlaceholderText("/path/to/mount")
        self.entry_path.textChanged.connect(self._update_script)
        lay_mount.addWidget(self.entry_path)
        
        btn_browse = QPushButton("Browse...")
        btn_browse.clicked.connect(self._browse)
        lay_mount.addWidget(btn_browse)
        lay_panel.addLayout(lay_mount)

        # Options
        lay_options = QHBoxLayout()
        lbl_options = QLabel("Options:")
        lbl_options.setStyleSheet("font-weight: 600; color: #1d1d1f;")
        lay_options.addWidget(lbl_options)
        
        self.btn_autostart = QPushButton("🚀 Start at Login")
        self.btn_autostart.setEnabled(False)
        self.btn_autostart.clicked.connect(self._add_to_autostart)
        lay_options.addWidget(self.btn_autostart)

        self.btn_advanced = QPushButton("⚙️ Advanced Script")
        self.btn_advanced.clicked.connect(self._show_advanced_script)
        lay_options.addWidget(self.btn_advanced)
        
        self.btn_load_script = QPushButton("📂 Load Script")
        self.btn_load_script.setEnabled(False)
        self.btn_load_script.clicked.connect(self._load_existing_script)
        lay_options.addWidget(self.btn_load_script)
        lay_options.addStretch()
        
        lay_panel.addLayout(lay_options)

        main_layout.addWidget(panel)
        main_layout.addStretch()

        # Hidden script block (Moved from main UI)
        self.text_script = QTextEdit()
        font = QFont("Monospace")
        font.setStyleHint(QFont.StyleHint.TypeWriter)
        self.text_script.setFont(font)
        self.text_script.setParent(self)
        self.text_script.hide()

        # Footer Actions
        lay_actions = QHBoxLayout()
        self.lbl_status = QLabel("Ready")
        self.lbl_status.setStyleSheet("color: #4a4a4a; font-weight: 500;")
        lay_actions.addWidget(self.lbl_status)
        lay_actions.addStretch()
        
        self.btn_stop = QPushButton("⏹ Stop & Unmount")
        self.btn_stop.setEnabled(False)
        self.btn_stop.setStyleSheet("color: #ed1515;")
        self.btn_stop.clicked.connect(self._stop_script)
        lay_actions.addWidget(self.btn_stop)
        
        self.btn_run = QPushButton("▶ Mount Drive")
        self.btn_run.setEnabled(False)
        self.btn_run.setStyleSheet("background-color: #007aff; color: white; font-weight: bold; padding: 10px 20px; border: none;")
        self.btn_run.clicked.connect(self._run_script)
        lay_actions.addWidget(self.btn_run)
        
        main_layout.addLayout(lay_actions)

    def _show_advanced_script(self):
        dialog = QDialog(self)
        dialog.setWindowTitle("Advanced Script Configuration")
        dialog.resize(650, 450)
        lay = QVBoxLayout(dialog)
        
        lbl_hint = QLabel("<i>Modify the bash script below if you need advanced custom mount options.</i>")
        lay.addWidget(lbl_hint)
        
        self.text_script.show()
        lay.addWidget(self.text_script)
        
        btn_close = QPushButton("Done")
        btn_close.clicked.connect(dialog.accept)
        btn_close.setStyleSheet("background-color: #007aff; color: white; font-weight: bold;")
        lay.addWidget(btn_close)
        
        dialog.exec()
        
        self.text_script.setParent(self)
        self.text_script.hide()

    def _on_remote_changed(self, remote_name):
        """Clears the mount path when switching remotes to prevent FUSE overlap errors."""
        self.entry_path.blockSignals(True)
        self.entry_path.clear()
        self.entry_path.blockSignals(False)
        self._update_script()

    def _open_local_script_folder(self):
        """Launches the user's file browser at the default app script directory."""
        os.makedirs(self.config_dir, exist_ok=True)
        QDesktopServices.openUrl(QUrl.fromLocalFile(self.config_dir))

    def _show_manage_mounted_drives(self):
        """Displays current app-managed mounts and lets the user unmount or remove autorun entries."""
        dialog = QDialog(self)
        dialog.setWindowTitle("Manage Mounted Drives")
        dialog.resize(760, 420)

        layout = QVBoxLayout(dialog)
        layout.addWidget(QLabel("Select a drive entry to unmount or delete its autorun entry."))

        table = QTableWidget()
        table.setColumnCount(4)
        table.setHorizontalHeaderLabels(["Remote", "Mount Path", "Mounted", "Autostart"])
        table.horizontalHeader().setStretchLastSection(True)
        table.setSelectionBehavior(QTableWidget.SelectionBehavior.SelectRows)
        table.setSelectionMode(QTableWidget.SelectionMode.SingleSelection)
        table.setEditTriggers(QTableWidget.EditTrigger.NoEditTriggers)
        table.verticalHeader().setVisible(False)
        layout.addWidget(table)

        controls = QHBoxLayout()
        self.btn_unmount_current = QPushButton("Unmount Selected Drive")
        self.btn_unmount_current.setEnabled(False)
        self.btn_unmount_current.clicked.connect(lambda: self._confirm_unmount_selected(table))
        controls.addWidget(self.btn_unmount_current)

        self.btn_delete_autorun_current = QPushButton("Delete Autorun Script")
        self.btn_delete_autorun_current.setEnabled(False)
        self.btn_delete_autorun_current.clicked.connect(lambda: self._confirm_delete_autorun_selected(table))
        controls.addWidget(self.btn_delete_autorun_current)
        
        self.btn_delete_both = QPushButton("Delete Both Script & Autorun Function")
        self.btn_delete_both.setEnabled(False)
        self.btn_delete_both.clicked.connect(lambda: self._confirm_delete_both_selected(table))
        controls.addWidget(self.btn_delete_both)

        btn_refresh = QPushButton("Refresh")
        btn_refresh.clicked.connect(lambda: self._refresh_manage_drives(table))
        controls.addWidget(btn_refresh)
        controls.addStretch()

        btn_close = QPushButton("Close")
        btn_close.clicked.connect(dialog.accept)
        controls.addWidget(btn_close)
        layout.addLayout(controls)

        table.itemSelectionChanged.connect(lambda: self._update_manage_buttons(table))
        self._refresh_manage_drives(table)
        dialog.exec()

    def _get_managed_script_entries(self):
        entries = []
        if not os.path.isdir(self.config_dir):
            return entries

        # Read mounted paths from /proc/mounts for faster checking (non-blocking)
        mounted_paths = set()
        try:
            with open("/proc/mounts", "r") as f:
                for line in f:
                    parts = line.split()
                    if len(parts) >= 2:
                        try:
                            decoded_path = bytes(parts[1], "ascii").decode("unicode_escape")
                            mounted_paths.add(decoded_path)
                        except Exception:
                            mounted_paths.add(parts[1])
        except Exception:
            pass  # Fallback to slower method if /proc/mounts unavailable

        for filename in sorted(os.listdir(self.config_dir)):
            if not filename.endswith("_mount.sh"):
                continue

            script_path = os.path.join(self.config_dir, filename)
            remote = filename[:-len("_mount.sh")]
            mount_path = ""
            try:
                with open(script_path, "r") as f:
                    for line in f:
                        if line.startswith('MOUNT_PATH="'):
                            mount_path = line.split('"')[1]
                            break
            except Exception:
                continue

            # Check if mount path is in the set of mounted paths (fast)
            mounted = mount_path in mounted_paths
            autostart_path = os.path.expanduser(f"~/.config/autostart/rclone_mount_{remote}.desktop")
            autostart_exists = os.path.exists(autostart_path)

            entries.append({
                "remote": remote,
                "script_path": script_path,
                "mount_path": mount_path,
                "mounted": mounted,
                "autostart_path": autostart_path,
                "autostart_exists": autostart_exists,
            })

        return entries

    def _refresh_manage_drives(self, table):
        entries = self._get_managed_script_entries()
        table.setRowCount(len(entries))

        for row, entry in enumerate(entries):
            remote_item = QTableWidgetItem(entry["remote"])
            path_item = QTableWidgetItem(entry["mount_path"])
            mounted_item = QTableWidgetItem("Yes" if entry["mounted"] else "No")
            autostart_item = QTableWidgetItem("Yes" if entry["autostart_exists"] else "No")

            for item in (remote_item, path_item, mounted_item, autostart_item):
                item.setFlags(item.flags() & ~Qt.ItemFlag.ItemIsEditable)

            table.setItem(row, 0, remote_item)
            table.setItem(row, 1, path_item)
            table.setItem(row, 2, mounted_item)
            table.setItem(row, 3, autostart_item)

        self._update_manage_buttons(table)

    def _update_manage_buttons(self, table):
        has_selection = table.currentRow() != -1
        if not has_selection or table.rowCount() == 0:
            self.btn_unmount_current.setEnabled(False)
            self.btn_delete_autorun_current.setEnabled(False)
            self.btn_delete_both.setEnabled(False)
            return

        row = table.currentRow()
        if row < 0 or row >= table.rowCount():
            self.btn_unmount_current.setEnabled(False)
            self.btn_delete_autorun_current.setEnabled(False)
            self.btn_delete_both.setEnabled(False)
            return

        mounted_item = table.item(row, 2)
        autostart_item = table.item(row, 3)
        if not mounted_item or not autostart_item:
            self.btn_unmount_current.setEnabled(False)
            self.btn_delete_autorun_current.setEnabled(False)
            self.btn_delete_both.setEnabled(False)
            return

        mounted = mounted_item.text() == "Yes"
        autostart = autostart_item.text() == "Yes"
        self.btn_unmount_current.setEnabled(mounted)
        self.btn_delete_autorun_current.setEnabled(autostart)
        self.btn_delete_both.setEnabled(True)

    def _confirm_unmount_selected(self, table):
        row = table.currentRow()
        if row == -1 or row >= table.rowCount():
            return

        remote_item = table.item(row, 0)
        mount_item = table.item(row, 1)
        if not remote_item or not mount_item:
            return

        remote = remote_item.text()
        mount_path = mount_item.text()
        if not mount_path:
            QMessageBox.warning(self, "Missing Path", "Selected entry does not contain a valid mount path.")
            return

        if QMessageBox.question(
            self,
            "Unmount Drive",
            f"Unmount the selected drive '{remote}' from '{mount_path}'?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        ) != QMessageBox.StandardButton.Yes:
            return

        success, message = self._unmount_mount_path(mount_path)
        if success:
            QMessageBox.information(self, "Unmounted", message)
        else:
            QMessageBox.critical(self, "Unmount Failed", message)

        self._refresh_manage_drives(table)

    def _confirm_delete_autorun_selected(self, table):
        row = table.currentRow()
        if row == -1 or row >= table.rowCount():
            return

        remote_item = table.item(row, 0)
        if not remote_item:
            return

        remote = remote_item.text()
        autostart_path = os.path.expanduser(f"~/.config/autostart/rclone_mount_{remote}.desktop")
        if not os.path.exists(autostart_path):
            QMessageBox.information(self, "Not Found", "No autorun entry exists for the selected drive.")
            return

        if QMessageBox.question(
            self,
            "Delete Autorun Entry",
            f"Delete the autorun entry for '{remote}'?\n\n{autostart_path}",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        ) != QMessageBox.StandardButton.Yes:
            return

        try:
            os.remove(autostart_path)
            QMessageBox.information(self, "Deleted", f"Autorun entry deleted:\n{autostart_path}")
        except Exception as e:
            QMessageBox.critical(self, "Delete Failed", f"Failed to delete autorun entry:\n{e}")

        self._refresh_manage_drives(table)

    def _confirm_delete_both_selected(self, table):
        row = table.currentRow()
        if row == -1 or row >= table.rowCount():
            return

        remote_item = table.item(row, 0)
        if not remote_item:
            return

        remote = remote_item.text()
        script_path = os.path.join(self.config_dir, f"{remote}_mount.sh")
        autostart_path = os.path.expanduser(f"~/.config/autostart/rclone_mount_{remote}.desktop")
        
        script_exists = os.path.exists(script_path)
        autostart_exists = os.path.exists(autostart_path)
        
        if not script_exists and not autostart_exists:
            QMessageBox.information(self, "Not Found", "No script or autorun entry exists for the selected drive.")
            return

        if QMessageBox.question(
            self,
            "Delete Both Script & Autorun",
            f"Delete both the mount script and autorun entry for '{remote}'?\n\nScript: {script_path}\nAutorun: {autostart_path}",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        ) != QMessageBox.StandardButton.Yes:
            return

        errors = []
        deleted_items = []
        
        if script_exists:
            try:
                os.remove(script_path)
                deleted_items.append(f"Script: {script_path}")
            except Exception as e:
                errors.append(f"Failed to delete script: {e}")
        
        if autostart_exists:
            try:
                os.remove(autostart_path)
                deleted_items.append(f"Autorun: {autostart_path}")
            except Exception as e:
                errors.append(f"Failed to delete autorun entry: {e}")
        
        if errors:
            QMessageBox.critical(self, "Delete Errors", "\n".join(errors))
        elif deleted_items:
            QMessageBox.information(self, "Deleted", "Successfully deleted:\n" + "\n".join(deleted_items))
        
        self._refresh_manage_drives(table)

    def _unmount_mount_path(self, mount_path):
        if not mount_path or not os.path.exists(mount_path):
            return False, f"Mount path '{mount_path}' does not exist."

        result = subprocess.run(["fusermount", "-uz", mount_path], capture_output=True, text=True)
        if result.returncode == 0:
            return True, f"Drive successfully unmounted from '{mount_path}'."

        # If fusermount failed, include stderr if available.
        output = result.stderr.strip() or result.stdout.strip() or "Unknown error."
        return False, f"Failed to unmount '{mount_path}':\n{output}"

    def _delete_all_remotes(self):
        reply = QMessageBox.question(
            self, 
            "Delete All Remotes", 
            "Are you sure you want to delete ALL configured remotes? This action cannot be undone.", 
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if reply == QMessageBox.StandardButton.Yes:
            try:
                res = subprocess.run(["rclone", "config", "file"], capture_output=True, text=True, check=True)
                for line in res.stdout.splitlines():
                    if line.endswith(".conf"):
                        config_path = line.strip()
                        # Extract the actual path if the output line is not the path itself
                        # 'rclone config file' often outputs: "Configuration file is stored at:\n/home/user/.config/rclone/rclone.conf"
                        if " " in config_path and not os.path.exists(config_path):
                            continue
                        
                        if os.path.exists(config_path):
                            os.remove(config_path)
                            QMessageBox.information(self, "Success", "All remotes have been deleted.")
                            self._populate_remotes()
                            return
                
                # Fallback if parsing failed but we still need to delete
                config_path = os.path.expanduser("~/.config/rclone/rclone.conf")
                if os.path.exists(config_path):
                    os.remove(config_path)
                    QMessageBox.information(self, "Success", "All remotes have been deleted.")
                    self._populate_remotes()
                    return
                    
                QMessageBox.information(self, "Not Found", "Rclone config file not found.")
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Failed to delete remotes:\n{e}")

    def _show_about(self):
        """Renders the About dialog with external link delegation."""
        dialog = QDialog(self)
        dialog.setWindowTitle("About Rclone-WIZ")
        dialog.resize(400, 350)
        
        layout = QVBoxLayout(dialog)
        
        text_browser = QTextBrowser()
        # Enable URL resolution and external OS browser launching
        text_browser.setOpenExternalLinks(True) 
        
        about_html = """
        <div style="font-family: sans-serif;">
            <h2 style="color: #3daee9;">Rclone-WIZ 1.6.1</h2>
            <p>A simple and easy-to-use tool to configure, script, and mount cloud drives using rclone.</p>
            <hr>
            <p><b>Created by:</b> Miran Kljun<br>
            2026    &copy; - GPL 3.0<br>
            <a href="https://github.com/themix88/">github.com/themix88/</a></p>
            <hr>
            Source: <li><a href="https://github.com/themix88/Clone-WIZ/Rclone-WIZ">GitHub</a></li>
            <hr>
            <p>Special thanks goes to the rclone developers & community for their amazing work!</p>
            <ul>
                <li><a href="https://rclone.org">rclone.org</a></li>
                <li><a href="https://rclone.org/authors">Authors & Contributors</a></li>
                <li><a href="https://github.com/rclone/rclone">GitHub</a></li>
            </ul>
        </div>
        """
        text_browser.setHtml(about_html)
        layout.addWidget(text_browser)
        
        btn_close = QPushButton("Close")
        btn_close.clicked.connect(dialog.accept)
        layout.addWidget(btn_close)
        
        dialog.exec()

    def _show_tutorial(self):
        """Renders a static HTML tutorial overlay for common configuration paths."""
        dialog = QDialog(self)
        dialog.setWindowTitle("Tutorial: Setting up Google Drive")
        dialog.resize(550, 480)
        
        layout = QVBoxLayout(dialog)
        text_browser = QTextBrowser()
        text_browser.setOpenExternalLinks(True)
        
        tutorial_html = """
        <h2 style="color: #3daee9;">Quick Start: Adding Google Drive</h2>
        <p>Follow these steps using the built-in configuration wizard when you click <b>⚙️ Add / Edit Remote</b>:</p>
        <hr>
        <ol>
            <li><b>Name & Type:</b> Enter a name (e.g., <code>gdrive</code>), select <b>Google Drive</b> from the dropdown, and click <b>Next</b>.</li>
            <li><b>Client ID/Secret:</b> Leave these blank unless you have your own, and click <b>Next</b>.</li>
            <li><b>Scope (Access):</b> Select the <b>Full Access (1)</b> option and click <b>Next</b>.</li>
            <li><b>Advanced Prompts:</b> You can safely click <b>Next</b> through most advanced options to use their default values.</li>
            <li><b>Team Drive:</b> When asked about Team Drives, select <b>No</b> (unless using a Google Workspace Shared Drive). We've marked the recommended option for you!</li>
            <li><b>Web Authentication:</b> When asked <i>"Use auto config?"</i>, make sure <b>Yes</b> is selected and click <b>Next</b>. 
                <br><br>
                <div style="background-color: #2b2b2b; padding: 10px; border-radius: 5px; border-left: 4px solid #f67400;">
                <b>🚀 Your web browser will automatically open!</b><br> 
                Log into your Google account in the browser, click "Allow" to grant Rclone permission, and return to the app.
                </div>
            </li>
            <li><b>Finish:</b> Keep clicking Next until the wizard says "Configuration Complete!", then click <b>Finish</b>.</li>
        </ol>
        <hr>
        <p><i>Your new Google Drive will automatically appear in the Remote list on the main window!</i></p>
        """
        text_browser.setHtml(tutorial_html)
        layout.addWidget(text_browser)
        
        btn_close = QPushButton("Got it!")
        btn_close.clicked.connect(dialog.accept)
        layout.addWidget(btn_close)
        
        dialog.exec()

    def _launch_config(self):
        """Launches the non-interactive GUI wizard for rclone configuration."""
        self.btn_config.setEnabled(False)
        wizard = RcloneConfigWizard(self)
        wizard.exec()
        self._on_config_finished()

    def _launch_terminal_config(self):
        """Launches rclone config in the user's default terminal."""
        terminals = [
            ["konsole", "-e", "rclone", "config"],
            ["gnome-terminal", "--", "rclone", "config"],
            ["x-terminal-emulator", "-e", "rclone", "config"],
            ["xfce4-terminal", "-x", "rclone", "config"],
            ["xterm", "-e", "rclone", "config"],
            ["alacritty", "-e", "rclone", "config"],
            ["kitty", "rclone", "config"]
        ]
        
        launched = False
        for term_cmd in terminals:
            if shutil.which(term_cmd[0]):
                try:
                    subprocess.Popen(term_cmd)
                    launched = True
                    break
                except Exception:
                    continue
                    
        if not launched:
            QMessageBox.warning(self, "Terminal Error", "Could not find a supported terminal emulator on your system.")
        else:
            self.lbl_status.setText("Status: Terminal opened. Click '↻ Refresh' when you are done.")
            self.lbl_status.setStyleSheet("color: #f67400;")

    def _on_config_finished(self):
        """Callback invoked upon termination of the configuration wizard."""
        self.btn_config.setEnabled(True)
        self.lbl_status.setText("Status: Config wizard closed. Remotes updated.")
        self.lbl_status.setStyleSheet("")
        self._populate_remotes()

    def _populate_remotes(self):
        """Executes 'rclone listremotes' via background thread to populate UI."""
        self.combo_remote.clear()
        self.combo_remote.addItem("Loading...")
        self.combo_remote.setEnabled(False)
        
        self.list_remotes_thread = ListRemotesThread()
        self.list_remotes_thread.finished_signal.connect(self._on_remotes_loaded)
        self.list_remotes_thread.error_signal.connect(self._on_remotes_error)
        self.list_remotes_thread.start()

    def _on_remotes_loaded(self, remotes):
        self.combo_remote.clear()
        self.combo_remote.setEnabled(True)
        if remotes:
            self.combo_remote.addItems(remotes)
        self._update_script()

    def _on_remotes_error(self, err):
        self.combo_remote.clear()
        self.combo_remote.setEnabled(True)
        self.combo_remote.addItem("Error: Rclone missing")
        self._update_script()

    def _browse(self):
        """Invokes native OS dialog for directory selection."""
        directory = QFileDialog.getExistingDirectory(self, "Select Mount Folder")
        if directory:
            self.entry_path.setText(directory)

    def _update_script(self):
        """Validates current state constraints and orchestrates bash script payload generation."""
        remote = self.combo_remote.currentText()
        path = self.entry_path.text()
        
        # Evaluate validation rules: Valid remote syntax and defined target path
        is_valid = bool(remote and path and "Error" not in remote and "No remotes" not in remote)

        if bool(remote and "Error" not in remote and "No remotes" not in remote):
            # Compute absolute target path for script persistence
            self.script_path = os.path.join(self.config_dir, f"{remote}_mount.sh")
            self.btn_load_script.setEnabled(True)
        else:
            self.btn_load_script.setEnabled(False)

        if is_valid:
            # Construct optimized Bash script payload
            script_content = (
                "#!/bin/bash\n\n"
                "# Automatically generated by Rclone-WIZ\n"
                f"REMOTE=\"{remote}:\"\n"
                f"MOUNT_PATH=\"{path}\"\n\n"
                "# Verify target directory exists prior to mount initiation\n"
                "echo \"Creating mount directory if it doesn't exist...\"\n"
                "mkdir -p \"$MOUNT_PATH\"\n\n"
                "echo \"Mounting $REMOTE to $MOUNT_PATH...\"\n"
                "# Execute rclone mount with optimized VFS caching and dynamic chunking\n"
                "rclone mount \"$REMOTE\" \"$MOUNT_PATH\" \\\n"
                "  --vfs-cache-mode full \\\n"
                "  --vfs-cache-max-size 50G \\\n"        # Cap the disk usage to 50GB (adjust to your disk)
                "  --vfs-cache-max-age 24h \\\n"         # Remove cache files older than 24 hours
                "  --dir-cache-time 1000h \\\n"          # Cache directory metadata longer to avoid API hangs
                "  --buffer-size 32M \\\n"               # Reduced slightly to save RAM across multiple files
                "  --vfs-read-chunk-size 32M \\\n"       # Starts downloading in small chunks for instant open times
                "  --vfs-read-chunk-size-limit off \\\n" # No limit for smoother sustained reads and best flow
                "  --vfs-read-ahead 256M \\\n"           # Pre-fetch more data for smooth streaming
                "  --vfs-fast-fingerprint \\\n"          # Faster change detection, prevents hangs on large files
                "  --timeout 1h \\\n"                    # Prevents stale connections from hanging the mount
                "  --attr-timeout 1h \\\n"
                "  --poll-interval 15s \\\n"             # Faster polling to keep dir-cache updated
                "  --daemon"                             # Run in background
            )
            self.text_script.setPlainText(script_content)
            
            # Enable execution pipelines upon validation pass
            self.btn_autostart.setEnabled(True)
            if self.mount_thread is None: 
                self.btn_run.setEnabled(True)
                
        else:
            # Fallback state for incomplete parameters
            self.text_script.setPlainText("# Please configure a remote and select a mount path to generate the script.")
            self.btn_autostart.setEnabled(False)
            if self.mount_thread is None:
                self.btn_run.setEnabled(False)

    def _load_existing_script(self):
        """Reads previously serialized script objects to synchronize UI state, including legacy paths."""
        if not self.script_path:
            return
            
        current_remote = self.combo_remote.currentText()
        target_load_path = None
        is_legacy = False
        
        # 1. Primary check: Native config directory
        if os.path.exists(self.script_path):
            target_load_path = self.script_path
            
        # 2. Fallback check: Legacy root directory (v1.0 backwards compatibility)
        elif os.path.exists(self.legacy_script_path):
            try:
                # Verify if the legacy script actually belongs to the currently selected remote
                with open(self.legacy_script_path, "r") as f:
                    legacy_content = f.read()
                if f'REMOTE="{current_remote}:"' in legacy_content:
                    target_load_path = self.legacy_script_path
                    is_legacy = True
            except Exception:
                pass # Fail silently on legacy read and default to "Not Found" logic
        
        if target_load_path:
            try:
                with open(target_load_path, "r") as f:
                    content = f.read()
                
                self.text_script.setPlainText(content)
                
                # Extract MOUNT_PATH variable efficiently to ensure GUI synchronization
                saved_path = None
                for line in content.splitlines():
                    if line.startswith('MOUNT_PATH="'):
                        saved_path = line.split('"')[1]
                        break
                
                if saved_path is not None:
                    
                    # Suppress signal emission to prevent recursive calls to _update_script()
                    self.entry_path.blockSignals(True)
                    self.entry_path.setText(saved_path)
                    self.entry_path.blockSignals(False)
                    
                    # Toggle dependent execution state
                    self.btn_autostart.setEnabled(True)
                    if self.mount_thread is None:
                        self.btn_run.setEnabled(True)

                if is_legacy:
                    self.lbl_status.setText(f"Status: Loaded legacy script for '{current_remote}' (Will migrate on save)")
                    self.lbl_status.setStyleSheet("color: #f67400;") # Orange warning/info
                else:
                    self.lbl_status.setText(f"Status: Loaded existing script for '{current_remote}'")
                    self.lbl_status.setStyleSheet("color: #27ae60;") # Green success
                    
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Failed to load script payload:\n{e}")
        else:
            QMessageBox.information(self, "Not Found", f"No existing script found for '{current_remote}'.\nIt will be created when you click 'Save & Run'.")

    def _save_script(self):
        """Serializes current script payload to disk and sets execution flags (chmod +x)."""
        script_content = self.text_script.toPlainText().strip()
        if not script_content or "# Please configure" in script_content:
            return False

        try:
            with open(self.script_path, "w") as f:
                f.write(script_content)
            
            # Apply standard execution permissions to the generated bash file
            st = os.stat(self.script_path)
            os.chmod(self.script_path, st.st_mode | stat.S_IEXEC)
            return True
        except Exception as e:
            QMessageBox.critical(self, "File Error", f"I/O Exception while persisting script:\n{e}")
            return False

    def _add_to_autostart(self):
        """Generates XDG-compliant .desktop entries for KDE/GNOME initialization execution."""
        if not self._save_script():
            QMessageBox.warning(self, "Missing Info", "Please configure a remote and mount path first.")
            return
            
        remote = self.combo_remote.currentText()
        autostart_dir = os.path.expanduser("~/.config/autostart")
        os.makedirs(autostart_dir, exist_ok=True)
        
        # Dynamically allocate desktop file names to support discrete mount entries
        desktop_file_path = os.path.join(autostart_dir, f"rclone_mount_{remote}.desktop")
        
        # Construct standard .desktop initialization payload
        desktop_entry = (
            "[Desktop Entry]\n"
            "Type=Application\n"
            f"Exec={self.script_path}\n"
            "Hidden=false\n"
            "NoDisplay=false\n"
            "X-GNOME-Autostart-enabled=true\n"
            f"Name=Rclone Auto-Mount ({remote})\n"
            "Comment=Mounts rclone drive automatically on user login\n"
        )
        
        try:
            with open(desktop_file_path, "w") as f:
                f.write(desktop_entry)
            QMessageBox.information(self, "Autostart Enabled", 
                f"The mount script for '{remote}' has been added to your autostart applications!\n\n"
                f"File created at:\n{desktop_file_path}")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to serialize autostart entry:\n{e}")

    def _run_script(self):
        """Prepares and dispatches the background thread for script execution with overlap prevention."""
        path = self.entry_path.text()

        # Check for existing Linux FUSE mount points
        if os.path.exists(path) and os.path.ismount(path):
            QMessageBox.warning(self, "Mount Overlap Detected", 
                                f"The directory '{path}' is already an active mount point.\n\n"
                                "Please unmount it first or select a different folder to prevent FUSE errors.")
            return

        if not self._save_script():
            QMessageBox.warning(self, "Missing Info", "Please complete Steps 1 and 2.")
            return

        self.lbl_status.setText("Status: Executing bash script...")
        self.lbl_status.setStyleSheet("color: #3daee9;")
        
        # Lock interface interactions during active execution contexts
        self.btn_run.setEnabled(False)
        self.btn_stop.setEnabled(True)
        self.btn_config.setEnabled(False)

        self.mount_thread = MountThread(self.script_path)
        self.mount_thread.success_signal.connect(self._on_mount_success)
        self.mount_thread.error_signal.connect(self._on_mount_error)
        self.mount_thread.start()

    def _on_mount_success(self, msg):
        self.lbl_status.setText(msg)
        self.lbl_status.setStyleSheet("color: #27ae60;") 

    def _on_mount_error(self, err_msg):
        self.lbl_status.setText("Status: Script Failed")
        self.lbl_status.setStyleSheet("color: #ed1515;") 
        QMessageBox.critical(self, "Script Error", f"The background subprocess encountered an error:\n{err_msg}")
        
        # Restore execution state
        self.btn_run.setEnabled(True)
        self.btn_stop.setEnabled(False)
        self.btn_config.setEnabled(True)

    def _stop_script(self):
        """Terminates active threads and performs an unmount operation via FUSE."""
        path = self.entry_path.text()
        
        # Dispatch SIGTERM to background worker if currently active
        if self.mount_thread:
            self.mount_thread.stop()
            self.mount_thread = None
        
        # Attempt to gracefully unmount the specified target directory
        subprocess.run(["fusermount", "-uz", path], check=False, capture_output=True)
        
        self.lbl_status.setText("Status: Process terminated and drive unmounted.")
        self.lbl_status.setStyleSheet("")
        
        # Unlock standard execution state controls
        self.btn_run.setEnabled(True)
        self.btn_stop.setEnabled(False)
        self.btn_config.setEnabled(True)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    
    # Modern Aesthetic QSS
    glass_qss = """
    * {
        font-family: "SF Pro Text", "SF Pro Display", "Inter", "Helvetica Neue", sans-serif;
        font-size: 14px;
    }
    QMainWindow, QDialog {
        background: qlineargradient(x1:0, y1:0, x2:1, y2:1,
                                    stop:0 #e0c3fc, stop:1 #8ec5fc);
    }
    #MainPanel {
        background-color: rgba(255, 255, 255, 0.4);
        border: 1px solid rgba(255, 255, 255, 0.6);
        border-radius: 12px;
    }
    QLabel {
        color: #1d1d1f;
        background: transparent;
    }
    QLineEdit, QComboBox, QTextEdit {
        background-color: rgba(255, 255, 255, 0.6);
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        padding: 6px 12px;
        color: #1d1d1f;
        selection-background-color: #007aff;
        selection-color: white;
    }
    QLineEdit:focus, QComboBox:focus, QTextEdit:focus {
        border: 2px solid #007aff;
        background-color: rgba(255, 255, 255, 0.8);
    }
    QComboBox::drop-down {
        border: none;
        padding-right: 10px;
    }
    QComboBox QAbstractItemView {
        background-color: rgba(255, 255, 255, 0.95);
        color: #1d1d1f;
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        selection-background-color: #007aff;
        selection-color: white;
        outline: none;
    }
    QPushButton {
        background-color: rgba(255, 255, 255, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        padding: 8px 16px;
        color: #1d1d1f;
        font-weight: 500;
    }
    QPushButton:hover {
        background-color: rgba(255, 255, 255, 0.8);
    }
    QPushButton:pressed {
        background-color: rgba(200, 200, 200, 0.5);
    }
    QPushButton:disabled {
        background-color: rgba(255, 255, 255, 0.2);
        color: rgba(29, 29, 31, 0.4);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }
    QMenuBar {
        background-color: rgba(255, 255, 255, 0.3);
        border-bottom: 1px solid rgba(255, 255, 255, 0.4);
    }
    QMenuBar::item {
        padding: 6px 10px;
        background: transparent;
        color: #1d1d1f;
    }
    QMenuBar::item:selected {
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 4px;
    }
    QMenu {
        background-color: rgba(255, 255, 255, 0.95);
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
    }
    QMenu::item {
        padding: 6px 20px;
        color: #1d1d1f;
    }
    QMenu::item:selected {
        background-color: #007aff;
        color: white;
        border-radius: 4px;
    }
    QTableWidget {
        background-color: rgba(255, 255, 255, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        color: #1d1d1f;
        gridline-color: rgba(255, 255, 255, 0.6);
    }
    QHeaderView::section {
        background-color: rgba(255, 255, 255, 0.6);
        padding: 4px;
        border: none;
        border-right: 1px solid rgba(255, 255, 255, 0.8);
        border-bottom: 1px solid rgba(255, 255, 255, 0.8);
        font-weight: bold;
        color: #1d1d1f;
    }
    QTextBrowser {
        background-color: rgba(255, 255, 255, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.8);
        border-radius: 8px;
        color: #1d1d1f;
    }
    """
    app.setStyleSheet(glass_qss)

    
    window = RcloneKdeApp()
    window.show()
    sys.exit(app.exec())