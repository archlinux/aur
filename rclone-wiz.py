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
                             QMessageBox, QDialog, QTextBrowser)
from PyQt6.QtGui import QFont, QAction
from PyQt6.QtCore import Qt, QThread, pyqtSignal

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
        terminals = [["konsole", "-e"], ["alacritty", "-e"], ["gnome-terminal", "--"], ["xterm", "-e"]]
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
            <h2 style="color: #3daee9;">Rclone-WIZ 1.3</h2>
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
                "# Execute rclone mount with optimized VFS caching and buffer limits for stream performance\n"
                "rclone mount \"$REMOTE\" \"$MOUNT_PATH\" \\\n"
                "  --vfs-cache-mode full \\\n"
                "  --dir-cache-time 72h \\\n"
                "  --buffer-size 128M \\\n"
                "  --vfs-read-chunk-size 32M \\\n"
                "  --vfs-read-chunk-size-limit off\n"
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