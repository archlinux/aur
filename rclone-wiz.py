#!/usr/bin/env python3
import sys
import subprocess
import os
import stat
import shutil
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout,
                             QHBoxLayout, QLabel, QComboBox, QLineEdit,
                             QPushButton, QTextEdit, QGroupBox, QFileDialog,
                             QMessageBox, QDialog, QTextBrowser)
from PyQt6.QtGui import QFont, QAction
from PyQt6.QtCore import Qt, QThread, pyqtSignal

# --- Background Worker Threads ---

class MountThread(QThread):
    error_signal = pyqtSignal(str)
    success_signal = pyqtSignal(str)

    def __init__(self, script_path):
        super().__init__()
        self.script_path = script_path
        self.process = None

    def run(self):
        try:
            self.process = subprocess.Popen(["bash", self.script_path],
                                            stdout=subprocess.PIPE,
                                            stderr=subprocess.PIPE,
                                            text=True)
            try:
                _, err = self.process.communicate(timeout=1.5)
                if self.process.returncode != 0:
                    self.error_signal.emit(f"Process exited with code {self.process.returncode}:\n{err}")
            except subprocess.TimeoutExpired:
                self.success_signal.emit(f"Status: Drive mounted via {os.path.basename(self.script_path)}")
        except Exception as e:
            self.error_signal.emit(str(e))

    def stop(self):
        if self.process:
            self.process.terminate()

class ConfigThread(QThread):
    finished_signal = pyqtSignal()

    def run(self):
        terminals = [["konsole", "-e"], ["alacritty", "-e"], ["gnome-terminal", "--"], ["xterm", "-e"]]
        cmd = None
        for term in terminals:
            if shutil.which(term[0]):
                cmd = term + ["rclone", "config"]
                break
                
        if cmd:
            try:
                subprocess.run(cmd, check=True)
            except Exception:
                pass
        self.finished_signal.emit()


# --- Main GUI Application ---

class RcloneKdeApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Rclone-WIZ")
        self.resize(750, 650)
        
        self.script_path = os.path.expanduser("~/rclone_mount_script.sh")
        self.mount_thread = None
        self.config_thread = None
        
        self._build_ui()
        self._populate_remotes()

    def _build_ui(self):
        # Menu Bar
        menubar = self.menuBar()
        file_menu = menubar.addMenu("File")
        exit_action = QAction("Exit", self)
        exit_action.triggered.connect(self.close)
        file_menu.addAction(exit_action)
        
        help_menu = menubar.addMenu("Help")
        
        # New Tutorial Action
        tutorial_action = QAction("EXAMPLE Tutorial: Add Google Drive", self)
        tutorial_action.triggered.connect(self._show_tutorial)
        help_menu.addAction(tutorial_action)
        
        help_menu.addSeparator()
        
        about_action = QAction("About", self)
        about_action.triggered.connect(self._show_about)
        help_menu.addAction(about_action)

        # Central Widget and Main Layout
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QVBoxLayout(central_widget)
        main_layout.setSpacing(15)

        # Step 0: Configuration Group
        grp_config = QGroupBox("Step 0: Configuration")
        lay_config = QHBoxLayout()
        lay_config.addWidget(QLabel("Need to add a new drive or edit an existing one?"))
        lay_config.addStretch()
        self.btn_config = QPushButton("⚙️ Open Rclone Config")
        self.btn_config.clicked.connect(self._launch_config)
        lay_config.addWidget(self.btn_config)
        grp_config.setLayout(lay_config)
        main_layout.addWidget(grp_config)

        # Step 1: Remote Selection Group
        grp_remote = QGroupBox("Step 1: Select Cloud Drive (Remote)")
        lay_remote = QHBoxLayout()
        lay_remote.addWidget(QLabel("Configured Remotes:"))
        self.combo_remote = QComboBox()
        self.combo_remote.setMinimumWidth(250)
        self.combo_remote.currentTextChanged.connect(self._update_script)
        lay_remote.addWidget(self.combo_remote)
        
        btn_refresh = QPushButton("↻ Refresh")
        btn_refresh.clicked.connect(self._populate_remotes)
        lay_remote.addWidget(btn_refresh)
        lay_remote.addStretch()
        grp_remote.setLayout(lay_remote)
        main_layout.addWidget(grp_remote)

        # Step 2: Mount Point Group
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

        # Step 3: Script Generator Group
        grp_script = QGroupBox("Step 3: Review Generated Bash Script")
        lay_script = QVBoxLayout()
        self.text_script = QTextEdit()
        font = QFont("Monospace")
        font.setStyleHint(QFont.StyleHint.TypeWriter)
        self.text_script.setFont(font)
        lay_script.addWidget(self.text_script)
        grp_script.setLayout(lay_script)
        main_layout.addWidget(grp_script)

        # Step 4: Actions and Status
        lay_actions = QHBoxLayout()
        self.lbl_status = QLabel("Status: Waiting for configuration...")
        self.lbl_status.setStyleSheet("color: #888888;")
        lay_actions.addWidget(self.lbl_status)
        lay_actions.addStretch()
        
        # Autostart Button - Starts Disabled
        self.btn_autostart = QPushButton("🚀 Add to Autostart")
        self.btn_autostart.setEnabled(False)
        self.btn_autostart.clicked.connect(self._add_to_autostart)
        lay_actions.addWidget(self.btn_autostart)

        self.btn_stop = QPushButton("⏹ Stop & Unmount")
        self.btn_stop.setEnabled(False)
        self.btn_stop.clicked.connect(self._stop_script)
        lay_actions.addWidget(self.btn_stop)
        
        # Run Button - Starts Disabled
        self.btn_run = QPushButton("▶ Save & Run Script")
        self.btn_run.setEnabled(False)
        self.btn_run.clicked.connect(self._run_script)
        self.btn_run.setStyleSheet("font-weight: bold;")
        lay_actions.addWidget(self.btn_run)
        
        main_layout.addLayout(lay_actions)

    def _show_about(self):
        # Create a Dialog instead of a MessageBox for better HTML support
        dialog = QDialog(self)
        dialog.setWindowTitle("About Rclone-WIZ")
        dialog.resize(400, 350)
        
        layout = QVBoxLayout(dialog)
        
        text_browser = QTextBrowser()
        text_browser.setOpenExternalLinks(True) # Required to make the links work
        
        # This is your HTML content
        about_html = """
        <div style="font-family: sans-serif;">
            <h2 style="color: #3daee9;">Rclone-WIZ 1.1</h2>
            <p>A simple and easy-to-use tool to configure, script, and mount cloud drives using rclone.</p>
            <hr>
            <p><b>Created by:</b> Miran Kljun<br>
            2026	&copy; - GPL 3.0<br>
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
        
        # Add a "Close" button
        btn_close = QPushButton("Close")
        btn_close.clicked.connect(dialog.accept)
        layout.addWidget(btn_close)
        
        dialog.exec()

    def _show_tutorial(self):
        """Displays a formatted HTML dialog guiding the user through GDrive setup."""
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
        self.btn_config.setEnabled(False)
        self.lbl_status.setText("Status: Rclone config running in Konsole...")
        self.lbl_status.setStyleSheet("color: #3daee9;") 
        
        self.config_thread = ConfigThread()
        self.config_thread.finished_signal.connect(self._on_config_finished)
        self.config_thread.start()

    def _on_config_finished(self):
        self.btn_config.setEnabled(True)
        self.lbl_status.setText("Status: Config closed. Remotes updated.")
        self.lbl_status.setStyleSheet("")
        self._populate_remotes()

    def _populate_remotes(self):
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
        directory = QFileDialog.getExistingDirectory(self, "Select Mount Folder")
        if directory:
            self.entry_path.setText(directory)

    def _update_script(self):
        """Generates the bash script text and manages the Enable/Disable states of the buttons based on required info."""
        remote = self.combo_remote.currentText()
        path = self.entry_path.text()
        
        # Check if we have valid info
        is_valid = bool(remote and path and "Error" not in remote and "No remotes" not in remote)

        if is_valid:
            script_content = (
                "#!/bin/bash\n\n"
                "# Auto-generated rclone mount script\n"
                f"REMOTE=\"{remote}:\"\n"
                f"MOUNT_PATH=\"{path}\"\n\n"
                "echo \"Creating mount directory if it doesn't exist...\"\n"
                "mkdir -p \"$MOUNT_PATH\"\n\n"
                "echo \"Mounting $REMOTE to $MOUNT_PATH...\"\n"
                "# --vfs-cache-mode writes is required for normal file editing\n"
                "rclone mount \"$REMOTE\" \"$MOUNT_PATH\" --vfs-cache-mode writes\n"
            )
            self.text_script.setPlainText(script_content)
            
            # Enable the buttons since information is valid
            self.btn_autostart.setEnabled(True)
            # Only enable the Run button if the script isn't actively running
            if self.mount_thread is None: 
                self.btn_run.setEnabled(True)
                
        else:
            self.text_script.setPlainText("# Please configure a remote and select a mount path to generate the script.")
            
            # Disable the buttons because information is missing
            self.btn_autostart.setEnabled(False)
            if self.mount_thread is None:
                self.btn_run.setEnabled(False)

    def _save_script(self):
        """Helper method to ensure the script is saved to disk before mounting or autostarting."""
        script_content = self.text_script.toPlainText().strip()
        if not script_content or "# Please configure" in script_content:
            return False

        try:
            with open(self.script_path, "w") as f:
                f.write(script_content)
            st = os.stat(self.script_path)
            os.chmod(self.script_path, st.st_mode | stat.S_IEXEC)
            return True
        except Exception as e:
            QMessageBox.critical(self, "File Error", f"Failed to save the script:\n{e}")
            return False

    def _add_to_autostart(self):
        if not self._save_script():
            QMessageBox.warning(self, "Missing Info", "Please configure a remote and mount path first.")
            return
            
        autostart_dir = os.path.expanduser("~/.config/autostart")
        os.makedirs(autostart_dir, exist_ok=True)
        desktop_file_path = os.path.join(autostart_dir, "rclone_mount_script.desktop")
        
        desktop_entry = (
            "[Desktop Entry]\n"
            "Type=Application\n"
            f"Exec={self.script_path}\n"
            "Hidden=false\n"
            "NoDisplay=false\n"
            "X-GNOME-Autostart-enabled=true\n"
            "Name=Rclone Auto-Mount\n"
            "Comment=Mounts rclone drive automatically on user login\n"
        )
        
        try:
            with open(desktop_file_path, "w") as f:
                f.write(desktop_entry)
            QMessageBox.information(self, "Autostart Enabled", 
                "The mount script has been added to your autostart applications!\n\n"
                f"File created at:\n{desktop_file_path}")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Failed to create autostart entry:\n{e}")

    def _run_script(self):
        if not self._save_script():
            QMessageBox.warning(self, "Missing Info", "Please complete Steps 1 and 2.")
            return

        self.lbl_status.setText("Status: Executing bash script...")
        self.lbl_status.setStyleSheet("color: #3daee9;")
        
        # State management while running
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
        QMessageBox.critical(self, "Script Error", f"The script encountered an error:\n{err_msg}")
        
        self.btn_run.setEnabled(True)
        self.btn_stop.setEnabled(False)
        self.btn_config.setEnabled(True)

    def _stop_script(self):
        path = self.entry_path.text()
        
        if self.mount_thread:
            self.mount_thread.stop()
            self.mount_thread = None
        
        subprocess.run(["fusermount", "-uz", path], check=False, capture_output=True)
        
        self.lbl_status.setText("Status: Script stopped and drive unmounted.")
        self.lbl_status.setStyleSheet("")
        
        self.btn_run.setEnabled(True)
        self.btn_stop.setEnabled(False)
        self.btn_config.setEnabled(True)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setStyle("Breeze")
    window = RcloneKdeApp()
    window.show()
    sys.exit(app.exec())