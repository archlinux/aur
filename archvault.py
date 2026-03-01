#!/usr/bin/env python3
import sys
import os
import json
import argparse
import subprocess

# ── PARSE --run-task FIRST — before ANY Qt imports ────────────────────────
# Qt reads QT_QPA_PLATFORM at QApplication creation, but some distro builds
# probe for a platform plugin during `import PyQt6.QtWidgets`.  Setting the
# env var BEFORE the import guarantees headless systemd services never fail.
parser = argparse.ArgumentParser()
parser.add_argument("--run-task", type=str, help="Run a scheduled task headlessly")
args, unknown = parser.parse_known_args()

if args.run_task:
    os.environ["QT_QPA_PLATFORM"] = "offscreen"

# HIGH DPI / RESOLUTION SCALING SUPPORT (Qt6 has automatic DPI scaling)
os.environ["QT_AUTO_SCREEN_SCALE_FACTOR"] = "1"
os.environ["QT_ENABLE_HIGHDPI_SCALING"] = "1"

# ── Now safe to import Qt ─────────────────────────────────────────────────
from PyQt6.QtWidgets import QApplication, QMainWindow, QMessageBox, QSystemTrayIcon, QMenu, QStyle
from PyQt6.QtGui import QAction, QIcon
from PyQt6.QtCore import QProcess, QTimer

os.environ["QT_QPA_PLATFORMTHEME"] = ""
os.environ["QT_STYLE_OVERRIDE"] = ""
os.environ["GTK_THEME"] = "Adwaita:dark"
os.environ["GTK_ICON_THEME"] = "Adwaita"
os.environ["XDG_DATA_DIRS"] = "/usr/share:/usr/local/share"

for key in ["XDG_DATA_HOME", "XDG_CONFIG_HOME"]:
    if key in os.environ:
        del os.environ[key]

# SECURE CACHE DIRECTORY FIX
os.environ["XDG_CACHE_HOME"] = "/root/.cache/archvault"
os.makedirs("/root/.cache/archvault", exist_ok=True)

from core_backend import BackendMixin
from engine_base import EngineBaseMixin
from engine_cloud import EngineCloudMixin
from engine_backup import EngineBackupMixin
from engine_restore import EngineRestoreMixin
from ui_shell import UIShellMixin
from ui_tabs_main import UITabsMainMixin
from ui_tabs_targets import UITabsTargetsMixin
from ui_tab_tasks import TasksMixin

VERSION = "v5.0.1-beta"
SETTINGS_FILE = "/etc/archvault/app_settings.json"
JOBS_FILE = "/etc/archvault/archvault_jobs.json"

# ── App icon — installed SVG, fallback to Qt system icon ──────────────────
_ICON_PATHS = [
    "/usr/share/icons/hicolor/scalable/apps/archvault.svg",
    os.path.join(os.path.dirname(os.path.abspath(__file__)), "archvault.svg"),
]

def _load_app_icon():
    """Load the ArchVault SVG icon from installed or local path."""
    for p in _ICON_PATHS:
        if os.path.exists(p):
            return QIcon(p)
    return None


# ═════════════════════════════════════════════════════════════════════════════
#  GNOME BACKGROUND PORTAL — shows in quick-settings panel
# ═════════════════════════════════════════════════════════════════════════════

class _GnomeBackgroundPortal:
    """
    Communicates with org.freedesktop.portal.Background via gdbus.
    Shows ArchVault in the GNOME quick-settings "Background Apps" section.
    Fails silently on non-GNOME desktops or if the portal isn't available.
    """

    _DEST   = "org.freedesktop.portal.Desktop"
    _PATH   = "/org/freedesktop/portal/desktop"
    _IFACE  = "org.freedesktop.portal.Background"

    def __init__(self):
        self._available = None  # lazy-check
        self._last_status = None

    def _gdbus(self, method, args_str):
        """Call a portal method via gdbus. Returns True on success."""
        try:
            cmd = [
                "gdbus", "call", "--session",
                "--dest", self._DEST,
                "--object-path", self._PATH,
                "--method", f"{self._IFACE}.{method}",
            ] + args_str
            result = subprocess.run(
                cmd, capture_output=True, text=True, timeout=5,
                env=self._get_bus_env())
            return result.returncode == 0
        except Exception:
            return False

    def _get_bus_env(self):
        """
        Build environment for gdbus. When running as root via pkexec,
        DBUS_SESSION_BUS_ADDRESS must point to the invoking user's bus.
        """
        env = os.environ.copy()
        if "DBUS_SESSION_BUS_ADDRESS" not in env:
            # Try to find the invoking user's session bus
            sudo_uid = os.environ.get("PKEXEC_UID") or os.environ.get("SUDO_UID")
            if sudo_uid:
                bus_path = f"unix:path=/run/user/{sudo_uid}/bus"
                if os.path.exists(f"/run/user/{sudo_uid}/bus"):
                    env["DBUS_SESSION_BUS_ADDRESS"] = bus_path
            else:
                # Try XDG_RUNTIME_DIR
                xdg_rt = os.environ.get("XDG_RUNTIME_DIR", "")
                bus_file = os.path.join(xdg_rt, "bus")
                if xdg_rt and os.path.exists(bus_file):
                    env["DBUS_SESSION_BUS_ADDRESS"] = f"unix:path={bus_file}"
        return env

    def is_available(self):
        """Check once if the background portal is reachable."""
        if self._available is None:
            try:
                cmd = [
                    "gdbus", "introspect", "--session",
                    "--dest", self._DEST,
                    "--object-path", self._PATH,
                ]
                result = subprocess.run(
                    cmd, capture_output=True, text=True, timeout=3,
                    env=self._get_bus_env())
                self._available = (
                    result.returncode == 0
                    and "Background" in result.stdout)
            except Exception:
                self._available = False
        return self._available

    def request_background(self):
        """
        Request permission to run in the background.
        GNOME will show ArchVault in the Background Apps section.
        """
        if not self.is_available():
            return False
        return self._gdbus("RequestBackground", [
            "",  # parent_window (empty = no parent)
            "{'reason': <'ArchVault monitors scheduled backups and "
            "runs automated tasks'>}",
        ])

    def set_status(self, message):
        """
        Update the status message shown next to ArchVault in the
        GNOME quick-settings Background Apps panel.
        Uses SetStatus (portal version 2, GNOME 44+).
        """
        if not self.is_available():
            return False
        if message == self._last_status:
            return True  # No change, skip the call
        self._last_status = message
        # Escape single quotes in message
        safe_msg = message.replace("'", "\\'")
        return self._gdbus("SetStatus", [
            f"{{'message': <'{safe_msg}'>}}",
        ])

    def clear_status(self):
        """Clear status when app exits."""
        if self._available:
            self._gdbus("SetStatus", ["{'message': <''>}"])


class ArchVault(
    QMainWindow, BackendMixin, EngineBaseMixin, EngineCloudMixin,
    EngineBackupMixin, EngineRestoreMixin, UITabsMainMixin,
    UITabsTargetsMixin, UIShellMixin, TasksMixin
):
    def __init__(self):
        super().__init__()
        self.setWindowTitle(
            f"ArchVault - Professional Linux Backup Suite ({VERSION})")

        if os.geteuid() != 0:
            QMessageBox.critical(
                None, "Privilege Error",
                "ArchVault must be run as root (sudo).")
            sys.exit(1)

        self.profiles = {
            "network": {}, "cloud": {}, "local": {},
            "usb": {}, "sftp": {}
        }
        self.scheduled_tasks = {}
        self.job_history = []
        self.current_job_id = None
        self.current_job_log = []

        self.settings = {
            "theme": "ArchVault",
            "global_retention": 7,
            "max_log_lines": 1000,
            "auto_validate": False,
            "exclude_cache": True,
            "backup_name_format": "ArchVault_%profile%_%datetime%",
            "time_format": "24 Hour",
            "close_to_tray": True,
            "tray_notifications": True,
            "show_log_bar": True,
            "dashboard_layout": None
        }
        self.currently_editing = {"category": None, "name": None}
        self.editing_task = None

        self.init_encryption(headless=bool(args.run_task))

        self.process = QProcess(self)
        self.process.readyReadStandardOutput.connect(self.handle_stdout)
        self.process.readyReadStandardError.connect(self.handle_stderr)
        self.process.finished.connect(self.handle_finished)
        self.is_paused = False

        self.load_settings()
        # Migrate old theme name
        if self.settings.get("theme") == "Dark (Default)":
            self.settings["theme"] = "Dark"
        self.load_profiles()
        self.load_tasks()
        self.load_jobs()

        self.init_ui()
        self.apply_theme(self.settings.get("theme", "ArchVault"))

        # ── App icon (window titlebar + tray idle state) ──────────────────
        self._app_icon = _load_app_icon()
        if self._app_icon:
            self.setWindowIcon(self._app_icon)
            QApplication.instance().setWindowIcon(self._app_icon)
        else:
            self._app_icon = self.style().standardIcon(
                QStyle.StandardPixmap.SP_DriveNetIcon)
            self.setWindowIcon(self._app_icon)

        self.refresh_dropdowns()

        if hasattr(self, 'refresh_jobs_ui'):
            self.refresh_jobs_ui()

        if hasattr(self, 'refresh_tasks_ui'):
            self.refresh_tasks_ui()

        if hasattr(self, 'apply_time_format'):
            self.apply_time_format()

        self.console.document().setMaximumBlockCount(
            self.settings.get("max_log_lines", 1000))

        self._last_jobs_mtime = 0
        self.job_monitor_timer = QTimer(self)
        self.job_monitor_timer.timeout.connect(self.sync_jobs_from_disk)
        self.job_monitor_timer.start(3000)

        # ── GNOME Background Portal ──────────────────────────────────────
        self._portal = _GnomeBackgroundPortal()

        if not args.run_task:
            self.init_system_tray()
            # Register with GNOME background apps panel
            self._portal.request_background()
            self._portal.set_status("Idle — no active jobs")

    def init_system_tray(self):
        self.tray_icon = QSystemTrayIcon(self)
        self.tray_icon.setIcon(self._app_icon)
        self.tray_icon.setToolTip("ArchVault — Idle")

        tray_menu = QMenu()

        self._tray_status_action = QAction("Status: Idle", self)
        self._tray_status_action.setEnabled(False)
        tray_menu.addAction(self._tray_status_action)
        tray_menu.addSeparator()

        open_action = QAction("Open ArchVault", self)
        open_action.triggered.connect(self.show_normal)
        tray_menu.addAction(open_action)

        jobs_action = QAction("View Jobs", self)
        jobs_action.triggered.connect(
            lambda: (self.show_normal(), self._navigate_to_jobs()))
        tray_menu.addAction(jobs_action)

        tray_menu.addSeparator()

        quit_action = QAction("Quit Completely", self)
        quit_action.triggered.connect(self.force_quit)
        tray_menu.addAction(quit_action)

        self.tray_icon.setContextMenu(tray_menu)
        self.tray_icon.activated.connect(self.tray_icon_activated)
        self.tray_icon.show()

    def _navigate_to_jobs(self):
        if hasattr(self, '_row_to_stack') and hasattr(self, 'sidebar'):
            self.sidebar.setCurrentRow(12)

    def update_tray_status(self):
        if not hasattr(self, 'tray_icon'):
            return
        from PyQt6.QtCore import QProcess as _QP
        is_running = self.process.state() == _QP.ProcessState.Running
        is_paused = getattr(self, 'is_paused', False)
        active_cloud = (hasattr(self, '_cloud_worker')
                        and self._cloud_worker
                        and self._cloud_worker.isRunning())

        if is_paused:
            status_text = "Status: Paused"
            portal_msg = "Backup paused"
            icon = self.style().standardIcon(
                QStyle.StandardPixmap.SP_MediaPause)
            tip = "ArchVault — Stream Paused"
        elif is_running or active_cloud:
            job_type = getattr(self, 'active_job_type', 'Backup') or 'Backup'
            status_text = f"Status: {job_type.title()} Running..."
            portal_msg = f"{job_type.title()} in progress…"
            icon = self.style().standardIcon(
                QStyle.StandardPixmap.SP_MediaPlay)
            tip = f"ArchVault — {job_type.title()} in progress"
        else:
            running_bg = any(
                j.get("status") == "Running" for j in self.job_history)
            if running_bg:
                status_text = "Status: Background Task Running"
                portal_msg = "Background task running…"
                icon = self.style().standardIcon(
                    QStyle.StandardPixmap.SP_MediaPlay)
                tip = "ArchVault — Background task in progress"
            else:
                status_text = "Status: Idle"
                portal_msg = "Idle — no active jobs"
                icon = self._app_icon
                tip = "ArchVault — Idle"

        self.tray_icon.setIcon(icon)
        self.tray_icon.setToolTip(tip)
        if hasattr(self, '_tray_status_action'):
            self._tray_status_action.setText(status_text)

        # Update GNOME Background Apps panel
        if hasattr(self, '_portal'):
            self._portal.set_status(portal_msg)

    def show_normal(self):
        self.show()
        self.activateWindow()

    def force_quit(self):
        self.is_force_quitting = True
        self.close()

    def tray_icon_activated(self, reason):
        if reason == QSystemTrayIcon.ActivationReason.Trigger:
            self.show_normal()

    def closeEvent(self, event):
        if getattr(self, 'is_force_quitting', False):
            if self.process.state() == QProcess.ProcessState.Running:
                self.stop_process()
                self.process.waitForFinished(2000)
            # Clear portal status on exit
            if hasattr(self, '_portal'):
                self._portal.clear_status()
            event.accept()
            return

        close_to_tray = self.settings.get("close_to_tray", True)

        if self.process.state() == QProcess.ProcessState.Running:
            msg = QMessageBox(self)
            msg.setWindowTitle("Active Task Running")
            msg.setText(
                "A backup or restore stream is actively running.\n\n"
                "Minimise to tray to let it finish in the background, "
                "or kill it now and exit.")
            btn_bg = msg.addButton(
                "Minimise to Tray", QMessageBox.ButtonRole.AcceptRole)
            btn_kill = msg.addButton(
                "Kill Task & Exit", QMessageBox.ButtonRole.DestructiveRole)
            btn_cancel = msg.addButton(
                "Cancel", QMessageBox.ButtonRole.RejectRole)
            msg.exec()
            clicked = msg.clickedButton()
            if clicked == btn_bg:
                self.hide()
                if hasattr(self, 'tray_icon'):
                    self.tray_icon.showMessage(
                        "ArchVault Running in Background",
                        "Your backup is continuing. Click the tray icon "
                        "to restore.",
                        QSystemTrayIcon.MessageIcon.Information, 5000)
                event.ignore()
            elif clicked == btn_kill:
                self.stop_process()
                self.process.waitForFinished(2000)
                if hasattr(self, '_portal'):
                    self._portal.clear_status()
                event.accept()
            else:
                event.ignore()
        elif close_to_tray:
            self.hide()
            event.ignore()
        else:
            if hasattr(self, '_portal'):
                self._portal.clear_status()
            event.accept()

    def sync_jobs_from_disk(self):
        if not os.path.exists(JOBS_FILE):
            return
        try:
            mtime = os.path.getmtime(JOBS_FILE)
            if self._last_jobs_mtime != mtime:
                self._last_jobs_mtime = mtime

                # ── Read jobs file (may be encrypted) ─────────────────
                with open(JOBS_FILE, "rb") as f:
                    raw = f.read()
                if not raw:
                    return

                new_history = None
                # Try decryption first (matches write_jobs behaviour)
                if hasattr(self, 'cipher') and self.cipher:
                    try:
                        decrypted = self.cipher.decrypt(raw).decode('utf-8')
                        new_history = json.loads(decrypted)
                    except Exception:
                        pass
                # Fall back to plain JSON
                if new_history is None:
                    try:
                        new_history = json.loads(raw.decode('utf-8'))
                    except Exception:
                        return

                if (self.settings.get("tray_notifications", True)
                        and hasattr(self, 'tray_icon')):
                    old_ids = {
                        j["id"]: j.get("status") for j in self.job_history}
                    for job in new_history:
                        jid = job.get("id")
                        new_status = job.get("status", "")
                        old_status = old_ids.get(jid)
                        if (old_status == "Running"
                                and new_status == "Completed"):
                            self.tray_icon.showMessage(
                                "ArchVault — Backup Complete",
                                f"{job.get('type', 'Job')} finished "
                                f"successfully: {job.get('target', '')}",
                                QSystemTrayIcon.MessageIcon.Information,
                                6000)
                        elif (old_status == "Running"
                              and new_status in ("Failed", "Error")):
                            self.tray_icon.showMessage(
                                "ArchVault — Backup Failed",
                                f"{job.get('type', 'Job')} failed: "
                                f"{job.get('target', '')}",
                                QSystemTrayIcon.MessageIcon.Critical,
                                8000)

                self.job_history = new_history
                if hasattr(self, 'refresh_jobs_ui'):
                    self.refresh_jobs_ui()
                if hasattr(self, 'refresh_dashboard'):
                    self.refresh_dashboard()
        except Exception:
            pass
        self.update_tray_status()

    def save_settings_from_ui(self):
        self.settings["theme"] = self.theme_combo.currentText()
        self.settings["global_retention"] = self.spin_retention.value()
        self.settings["max_log_lines"] = self.spin_log_lines.value()
        self.settings["auto_validate"] = self.chk_auto_validate.isChecked()
        self.settings["exclude_cache"] = self.chk_exclude_cache.isChecked()
        self.settings["backup_name_format"] = (
            self.txt_name_format.text().strip())
        self.settings["time_format"] = self.combo_time_format.currentText()
        self.settings["close_to_tray"] = (
            self.toggle_close_to_tray.isChecked())
        self.settings["tray_notifications"] = (
            self.toggle_tray_notifications.isChecked())
        self.settings["show_log_bar"] = self.toggle_show_log_bar.isChecked()

        # Apply autostart setting (creates/removes .desktop entry)
        if hasattr(self, 'toggle_autostart'):
            self._apply_autostart(self.toggle_autostart.isChecked())

        # Dashboard layout is saved separately via _save_dashboard_layout
        # but ensure it's preserved during settings save
        if hasattr(self, '_db_grid'):
            self.settings["dashboard_layout"] = (
                self._db_grid.get_layout_order())

        try:
            if not os.path.exists("/etc/archvault"):
                os.makedirs("/etc/archvault")
            with open(SETTINGS_FILE, "w") as f:
                json.dump(self.settings, f, indent=4)
            os.chmod(SETTINGS_FILE, 0o600)

            self.apply_theme(self.settings["theme"])
            if hasattr(self, 'apply_time_format'):
                self.apply_time_format()

            self.console.document().setMaximumBlockCount(
                self.settings["max_log_lines"])

            # Apply log bar visibility
            if hasattr(self, '_bottom_log_bar'):
                self._bottom_log_bar.setVisible(
                    self.settings.get("show_log_bar", True))

            self.log("INFO: Application settings updated and saved.")
            QMessageBox.information(
                self, "Success", "Global settings saved and applied.")
        except Exception as e:
            QMessageBox.critical(
                self, "Error", f"Failed to save settings: {e}")

    def execute_headless_task(self, task_name):
        task = self.scheduled_tasks.get(task_name)
        if not task:
            print(f"CRITICAL: Scheduled task '{task_name}' not found "
                  f"in database.", flush=True)
            print(f"  Available tasks: "
                  f"{list(self.scheduled_tasks.keys())}", flush=True)
            sys.exit(1)
            return
        if task.get("task_type") == "verification":
            print(f"CRITICAL: '{task_name}' is a verification task "
                  f"— use --run-verification.", flush=True)
            sys.exit(1)
            return

        print(f"--- INITIATING HEADLESS AUTOMATION: {task_name} ---",
              flush=True)
        self.log(f"--- INITIATING HEADLESS AUTOMATION: {task_name} ---")

        # Store the systemd unit name so the GUI can stop it
        safe_name = "".join(
            ch if ch.isalnum() else "_" for ch in task_name)
        self._headless_systemd_unit = (
            f"archvault-task-{safe_name}.service")

        # Block signals so setCurrentIndex doesn't queue a deferred
        # auto-detect via singleShot(0) — we'll run it synchronously below
        self.target_combo.blockSignals(True)

        t_idx = self.target_combo.findText(task["target"])
        # Case-insensitive fallback for tasks saved with old casing
        if t_idx < 0:
            target_lower = task["target"].lower()
            for i in range(self.target_combo.count()):
                if self.target_combo.itemText(i).lower() == target_lower:
                    t_idx = i
                    break
        if t_idx >= 0:
            self.target_combo.setCurrentIndex(t_idx)
        else:
            print(f"CRITICAL: Target profile '{task['target']}' not found "
                  f"in saved profiles.", flush=True)
            print(f"  Available targets: "
                  f"[{', '.join(self.target_combo.itemText(i) for i in range(self.target_combo.count()))}]",
                  flush=True)
            sys.exit(1)

        self.target_combo.blockSignals(False)

        # Run filesystem auto-detection SYNCHRONOUSLY in headless mode.
        # In the GUI this runs deferred via singleShot(0), which causes a
        # race: start_backup_process() fires before auto-detect finishes,
        # so the engine combo still has the wrong value.
        self._auto_detect_fs_deferred(
            self.target_combo, self.engine_combo, silent=False)

        # Log what engine was selected so journalctl shows the decision
        print(f"  Engine after auto-detect: "
              f"{self.engine_combo.currentText()}", flush=True)

        val_state = task.get("validate", False)
        if hasattr(self.chk_val_backup, 'setChecked'):
            self.chk_val_backup.setChecked(val_state)

        _orig_log = self.log

        def headless_log(msg):
            print(msg, flush=True)
            _orig_log(msg)
        self.log = headless_log

        try:
            self.process.finished.disconnect()
        except Exception:
            pass

        def headless_finished(exit_code, exit_status):
            type(self).handle_finished(self, exit_code, exit_status)
            print(f"--- HEADLESS TASK COMPLETE (exit {exit_code}) ---",
                  flush=True)
            QApplication.quit()

        self.process.finished.connect(headless_finished)
        self.process.readyReadStandardOutput.connect(self.handle_stdout)
        self.process.readyReadStandardError.connect(self.handle_stderr)

        self.start_backup_process()

        # Tag the job with systemd unit + type so the GUI can stop it
        if getattr(self, 'current_job_id', None):
            for j in self.job_history:
                if j.get("id") == self.current_job_id:
                    j["systemd_unit"] = self._headless_systemd_unit
                    j["type"] = "Scheduled Backup"
                    break
            self.write_jobs()


if __name__ == '__main__':
    app = QApplication(sys.argv)

    # Tell GNOME which .desktop file this app belongs to
    app.setDesktopFileName("archvault")

    window = ArchVault()
    if args.run_task:
        window.execute_headless_task(args.run_task)
        sys.exit(app.exec())
    else:
        app.setStyle("Fusion")
        from PyQt6.QtCore import QTimer as _QTimer
        window.show()
        _QTimer.singleShot(0, window.showMaximized)
        sys.exit(app.exec())
