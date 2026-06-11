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
                             QTableWidgetItem)
from PyQt6.QtGui import QFont, QAction, QDesktopServices
from PyQt6.QtCore import Qt, QThread, pyqtSignal, QUrl

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

class ConfigThread(QThread):
    """Spawns an interactive terminal for rclone configuration."""
    finished_signal = pyqtSignal()

    def run(self):
        # Ordered list of supported terminal emulators
        terminals = [["konsole", "-e"], ["alacritty", "-e"], ["gnome-terminal", "--"], ["xterm", "-e"], ["kitty", "-e"], ["ghostty", "-e"]]
        cmd = None
        
        # Resolve the first available terminal emulator in the system PATH
        for term in terminals:
            if shutil.which(term[0]):
                cmd = term + ["rclone", "config"]
                break
                
        if cmd:
            try:
                # Block execution until the user closes the terminal window
                subprocess.run(cmd, check=True)
            except Exception:
                # Suppress exceptions resulting from manual terminal termination
                pass
        
        self.finished_signal.emit()


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
        
        self._build_ui()
        self._populate_remotes()

    def _build_ui(self):
        # Initialize menu bar and define core application actions
        menubar = self.menuBar()
        file_menu = menubar.addMenu("File")
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
        tutorial_action = QAction("EXAMPLE Tutorial: Add Google Drive", self)
        tutorial_action.triggered.connect(self._show_tutorial)
        help_menu.addAction(tutorial_action)
        help_menu.addSeparator()
        about_action = QAction("About", self)
        about_action.triggered.connect(self._show_about)
        help_menu.addAction(about_action)

        # Configure primary widget hierarchy and main vertical layout
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QVBoxLayout(central_widget)
        main_layout.setSpacing(15)

        # UI Group: Initialization / Rclone Config Access
        grp_config = QGroupBox("Step 0: Configuration")
        lay_config = QHBoxLayout()
        lay_config.addWidget(QLabel("Need to add a new drive or edit an existing one?"))
        lay_config.addStretch()
        self.btn_config = QPushButton("⚙️ Open Rclone Config")
        self.btn_config.clicked.connect(self._launch_config)
        lay_config.addWidget(self.btn_config)
        grp_config.setLayout(lay_config)
        main_layout.addWidget(grp_config)

        # UI Group: Remote Target Selection
        grp_remote = QGroupBox("Step 1: Select Cloud Drive (Remote)")
        lay_remote = QHBoxLayout()
        lay_remote.addWidget(QLabel("Configured Remotes:"))
        self.combo_remote = QComboBox()
        self.combo_remote.setMinimumWidth(250)
        
        # intercept the signal here to reset the path field
        self.combo_remote.currentTextChanged.connect(self._on_remote_changed)
        
        lay_remote.addWidget(self.combo_remote)
        
        btn_refresh = QPushButton("↻ Refresh")
        btn_refresh.clicked.connect(self._populate_remotes)
        lay_remote.addWidget(btn_refresh)
        lay_remote.addStretch()
        grp_remote.setLayout(lay_remote)
        main_layout.addWidget(grp_remote)

        # UI Group: Local Mount Point Resolution
        grp_mount = QGroupBox("Step 2: Choose Local Mount Folder")
        lay_mount = QHBoxLayout()
        lay_mount.addWidget(QLabel("Mount Path:"))
        self.entry_path = QLineEdit()
        self.entry_path.textChanged.connect(self._update_script)
        lay_mount.addWidget(self.entry_path)
        
        btn_browse = QPushButton("Browse...")
        btn_browse.clicked.connect(self._browse)
        lay_mount.addWidget(btn_browse)
        grp_mount.setLayout(lay_mount)
        main_layout.addWidget(grp_mount)
        
        # UI Group: Bash Script Rendering and Persistence
        grp_script = QGroupBox("Step 3: Review Generated Bash Script")
        lay_script = QVBoxLayout()
        
        # Header action: File system script lookup
        lay_script_header = QHBoxLayout()
        self.btn_load_script = QPushButton("📂 Load Existing Script")
        self.btn_load_script.setEnabled(False)
        self.btn_load_script.clicked.connect(self._load_existing_script)
        self.btn_load_script.setToolTip("Evaluate local state for pre-existing script configurations.")
        lay_script_header.addWidget(self.btn_load_script)
        
        # Helpful hint label next to the button
        lbl_script_hint = QLabel("<i>(If a script loads, the drive is already mounted)</i>")
        lbl_script_hint.setStyleSheet("color: #888888; margin-left: 10px;")
        lay_script_header.addWidget(lbl_script_hint)
        
        lay_script_header.addStretch()
        lay_script.addLayout(lay_script_header)

        # Render monospaced text block for script preview
        self.text_script = QTextEdit()
        font = QFont("Monospace")
        font.setStyleHint(QFont.StyleHint.TypeWriter)
        self.text_script.setFont(font)
        lay_script.addWidget(self.text_script)
        grp_script.setLayout(lay_script)
        main_layout.addWidget(grp_script)

        # UI Group: Execution Controls and Process Status
        lay_actions = QHBoxLayout()
        self.lbl_status = QLabel("Status: Waiting for configuration...")
        self.lbl_status.setStyleSheet("color: #888888;")
        lay_actions.addWidget(self.lbl_status)
        lay_actions.addStretch()
        
        # Default initialization state: Disabled until validation passes
        self.btn_autostart = QPushButton("🚀 Add to Autostart")
        self.btn_autostart.setEnabled(False)
        self.btn_autostart.clicked.connect(self._add_to_autostart)
        lay_actions.addWidget(self.btn_autostart)

        self.btn_stop = QPushButton("⏹ Stop & Unmount")
        self.btn_stop.setEnabled(False)
        self.btn_stop.clicked.connect(self._stop_script)
        lay_actions.addWidget(self.btn_stop)
        
        self.btn_run = QPushButton("▶ Save & Run Script")
        self.btn_run.setEnabled(False)
        self.btn_run.clicked.connect(self._run_script)
        self.btn_run.setStyleSheet("font-weight: bold;")
        lay_actions.addWidget(self.btn_run)
        
        main_layout.addLayout(lay_actions)

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
                    content = f.read()
                match = re.search(r'^MOUNT_PATH="(.*?)"', content, re.MULTILINE)
                if match:
                    mount_path = match.group(1)
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
            <h2 style="color: #3daee9;">Rclone-WIZ 1.5</h2>
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
                <li><a href="https://rclone.org/authors">Authors</a></li>
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
        <h2 style="color: #3daee9;">Quick Start: Adding Google Drive EXAMPLE</h2>
        <p>Follow these steps in the terminal when you click <b>⚙️ Open Rclone Config</b>:</p>
        <hr>
        <ol>
            <li><b>Create New:</b> Type <code>n</code> and press Enter.</li>
            <li><b>Name It:</b> Type a name, for example: <code>gdrive</code> and press Enter.</li>
            <li><b>Select Storage:</b> Type <code>drive</code> (for Google Drive) and press Enter.</li>
            <li><b>Client ID/Secret:</b> Press Enter twice to leave these blank (default is fine).</li>
            <li><b>Scope (Access):</b> Type <code>1</code> for Full Access and press Enter.</li>
            <li><b>Service Account / Advanced:</b> Press Enter continuously to skip the advanced configuration prompts.</li>
            <li><b>Web Authentication:</b> When asked <i>"Use auto config?"</i>, type <code>y</code> and press Enter. 
                <br><br>
                <div style="background-color: #2b2b2b; padding: 10px; border-radius: 5px; border-left: 4px solid #f67400;">
                <b>🚀 Your web browser will automatically open!</b><br> 
                Log into your Google account in the browser, click "Allow" to grant Rclone permission, and then return to the terminal.
                </div>
            </li>
            <li><b>Finish:</b> If it says "Success", type <code>q</code> to quit the config menu.</li>
        </ol>
        <hr>
        <p><i>Once you close the terminal, this app will automatically refresh and your new Google Drive will be ready in Step 1!</i></p>
        """
        text_browser.setHtml(tutorial_html)
        layout.addWidget(text_browser)
        
        btn_close = QPushButton("Got it!")
        btn_close.clicked.connect(dialog.accept)
        layout.addWidget(btn_close)
        
        dialog.exec()

    def _launch_config(self):
        """Initializes the background terminal process to prevent UI blocking."""
        self.btn_config.setEnabled(False)
        self.lbl_status.setText("Status: Rclone config running in Konsole...")
        self.lbl_status.setStyleSheet("color: #3daee9;") 
        
        self.config_thread = ConfigThread()
        self.config_thread.finished_signal.connect(self._on_config_finished)
        self.config_thread.start()

    def _on_config_finished(self):
        """Callback invoked upon termination of the configuration subprocess."""
        self.btn_config.setEnabled(True)
        self.lbl_status.setText("Status: Config closed. Remotes updated.")
        self.lbl_status.setStyleSheet("")
        self._populate_remotes()

    def _populate_remotes(self):
        """Executes 'rclone listremotes' and parses standard output to populate UI."""
        self.combo_remote.clear()
        try:
            result = subprocess.run(["rclone", "listremotes"], capture_output=True, text=True, check=True)
            remotes = [r.strip(':') for r in result.stdout.strip().split('\n') if r]
            if remotes:
                self.combo_remote.addItems(remotes)
            else:
                self.combo_remote.addItem("No remotes found!")
        except Exception:
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
                "  --dir-cache-time 72h \\\n"            # Keep directory metadata in RAM longer
                "  --buffer-size 32M \\\n"               # Reduced slightly to save RAM across multiple files
                "  --vfs-read-chunk-size 32M \\\n"       # FIX: Starts downloading in small chunks for instant open times
                "  --vfs-read-chunk-size-limit 2G \\\n"  # FIX: Gradually increases chunk size for smooth sustained reads
                "  --vfs-read-ahead 128M \\\n"           # Pre-fetch data for smooth streaming
                "  --attr-timeout 1h \\\n"
                "  --poll-interval 1m \\\n"
                "  --daemon"                             # Run in background
                #"  --vfs-read-chunk-size-limit off\n"
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
                
                # Extract MOUNT_PATH variable via regex to ensure GUI synchronization
                match = re.search(r'^MOUNT_PATH="(.*?)"', content, re.MULTILINE)
                if match:
                    saved_path = match.group(1)
                    
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
    
    # Enforce standard KDE styling where available
    app.setStyle("Breeze")
    
    window = RcloneKdeApp()
    window.show()
    sys.exit(app.exec())