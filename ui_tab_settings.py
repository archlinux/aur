from PyQt6.QtWidgets import (QWidget, QVBoxLayout, QHBoxLayout, QLabel,
                             QLineEdit, QPushButton, QComboBox, QMessageBox,
                             QListWidget, QCheckBox, QFileDialog,
                             QTabWidget, QSpinBox, QTimeEdit, QTextBrowser,
                             QApplication, QTextEdit, QTableWidget, QTableWidgetItem,
                             QHeaderView, QTreeWidget, QTreeWidgetItem, QRadioButton,
                             QFrame, QSizePolicy, QButtonGroup, QScrollArea,
                             QGridLayout)
from PyQt6.QtCore import QTime, Qt, QUrl, QProcess, QTimer, QRectF, pyqtSignal
from PyQt6.QtGui import (QFont, QColor, QBrush, QPainter, QPen, QPainterPath,
                          QLinearGradient)
from ui_widgets import ToggleSwitch
from soft_ui_components import (BTN_PRIMARY, BTN_SUCCESS, BTN_DANGER,
                                 BTN_WARNING, BTN_SECONDARY, BTN_INFO,
                                 mk_page_title)
import os
import subprocess
import json
from datetime import datetime

VERSION = "v5.0.1-beta"

# ── Shared micro-styles ──────────────────────────────────────────────────────
_SEC_LABEL = ("font-size:10px; font-weight:700; letter-spacing:1.5px; "
              "color:#64748b; background:transparent; border:none;")
_NOTE_STYLE = "color:#64748b; font-size:11px; background:transparent; border:none;"
_TOGGLE_LBL = "background:transparent; border:none; margin-left:10px;"

# Theme colour definitions — mirrors ui_shell.py
THEME_COLORS = {
    "ArchVault": {
        "bg": "#1a1b26", "fg": "#cdd6f4",
        "panel": "#24283b", "border": "#414868",
        "primary": "#1793d1", "primary_fg": "#ffffff",
        "sidebar_bg": "#0d0e17", "sidebar_fg": "#7aa2f7",
        "sidebar_sel": "#24283b", "sidebar_hover": "#1a1b26",
        "input_bg": "#16171f",
        "topbar_bg": "#13141e", "status_bg": "#0a0b12",
    },
    "Dark": {
        "bg": "#0b0e1a", "fg": "#e2e8f0",
        "panel": "#111827", "border": "#1e2d45",
        "primary": "#818cf8", "primary_fg": "#ffffff",
        "sidebar_bg": "#070910", "sidebar_fg": "#8892b0",
        "sidebar_sel": "#111827", "sidebar_hover": "#0d1020",
        "input_bg": "#0d1120",
        "topbar_bg": "#090c18", "status_bg": "#060810",
    },
    "Light": {
        "bg": "#f8fafc", "fg": "#0f172a",
        "panel": "#ffffff", "border": "#e2e8f0",
        "primary": "#4f46e5", "primary_fg": "#ffffff",
        "sidebar_bg": "#f1f5f9", "sidebar_fg": "#475569",
        "sidebar_sel": "#ffffff", "sidebar_hover": "#e2e8f0",
        "input_bg": "#f8fafc",
        "topbar_bg": "#e9ecf0", "status_bg": "#dde1e7",
    },
    "Midnight Blue": {
        "bg": "#020617", "fg": "#e2e8f0",
        "panel": "#0f172a", "border": "#1e293b",
        "primary": "#38bdf8", "primary_fg": "#020617",
        "sidebar_bg": "#020617", "sidebar_fg": "#94a3b8",
        "sidebar_sel": "#0f172a", "sidebar_hover": "#0b1120",
        "input_bg": "#020617",
        "topbar_bg": "#010411", "status_bg": "#010311",
    },
    "Deep Purple": {
        "bg": "#2e1065", "fg": "#ede9fe",
        "panel": "#4c1d95", "border": "#5b21b6",
        "primary": "#c084fc", "primary_fg": "#2e1065",
        "sidebar_bg": "#1e1b4b", "sidebar_fg": "#c4b5fd",
        "sidebar_sel": "#4c1d95", "sidebar_hover": "#3b0764",
        "input_bg": "#3b0764",
        "topbar_bg": "#1e1b4b", "status_bg": "#17143a",
    },
    "USA": {
        "bg": "#0a1628", "fg": "#e8edf5",
        "panel": "#1a2d4d", "border": "#2e4a73",
        "primary": "#dc2626", "primary_fg": "#ffffff",
        "sidebar_bg": "#0a1628", "sidebar_fg": "#cbd5e1",
        "sidebar_sel": "#1a2d4d", "sidebar_hover": "#152038",
        "input_bg": "#152038",
        "topbar_bg": "#071020", "status_bg": "#06101e",
    },
}


def _hsep():
    f = QFrame()
    f.setFrameShape(QFrame.Shape.HLine)
    f.setFixedHeight(1)
    f.setStyleSheet("background:rgba(100,116,139,0.18); border:none;")
    return f


def _sec_label(text):
    lbl = QLabel(text)
    lbl.setStyleSheet(_SEC_LABEL)
    return lbl


# ═══════════════════════════════════════════════════════════════════════════
#  THEME PREVIEW CARD  —  mini painted replica of the ArchVault layout
# ═══════════════════════════════════════════════════════════════════════════
class _ThemePreviewCard(QWidget):
    """Clickable card that paints a miniature ArchVault layout preview."""
    clicked = pyqtSignal(str)

    def __init__(self, theme_name, colors, selected=False, parent=None):
        super().__init__(parent)
        self._name = theme_name
        self._c = colors
        self._selected = selected
        self.setFixedSize(230, 176)
        self.setCursor(Qt.CursorShape.PointingHandCursor)

    def set_selected(self, sel):
        self._selected = sel
        self.update()

    def mousePressEvent(self, ev):
        self.clicked.emit(self._name)
        super().mousePressEvent(ev)

    def paintEvent(self, ev):
        p = QPainter(self)
        p.setRenderHint(QPainter.RenderHint.Antialiasing)
        c = self._c
        w, h = self.width(), self.height()

        # ── Outer card background ────────────────────────────────────────
        card_r = QRectF(0, 0, w, h)
        outer_path = QPainterPath()
        outer_path.addRoundedRect(card_r, 12, 12)

        # Subtle card background (neutral)
        p.fillPath(outer_path, QColor("#1e2030" if c["bg"][1] < '8' else "#e8ecf0"))

        # ── Selected glow border ─────────────────────────────────────────
        if self._selected:
            pen = QPen(QColor("#3b82f6"), 3)
            p.setPen(pen)
            p.drawPath(outer_path)
        else:
            pen = QPen(QColor(c["border"]), 1)
            p.setPen(pen)
            p.drawPath(outer_path)

        # ── Inset: mini app preview ──────────────────────────────────────
        mx, my = 10, 8          # margins
        pw = w - mx * 2         # preview width
        ph = h - my - 32        # preview height (leave room for label)
        px, py = mx, my         # preview origin

        # Clip to rounded preview area
        preview_path = QPainterPath()
        preview_path.addRoundedRect(QRectF(px, py, pw, ph), 8, 8)
        p.setClipPath(preview_path)

        # Background fill
        p.fillRect(QRectF(px, py, pw, ph), QColor(c["bg"]))

        # Sidebar (left ~22%)
        sb_w = int(pw * 0.22)
        p.fillRect(QRectF(px, py, sb_w, ph), QColor(c["sidebar_bg"]))

        # Sidebar items (small horizontal bars)
        bar_x = px + 6
        bar_y = py + 14
        for i in range(6):
            bar_w = sb_w - 14 if i != 1 else sb_w - 18
            bar_h = 4
            rect = QRectF(bar_x, bar_y, bar_w, bar_h)
            bar_path = QPainterPath()
            bar_path.addRoundedRect(rect, 2, 2)
            if i == 1:
                p.fillPath(bar_path, QColor(c["sidebar_sel"]))
                # Selected item accent bar
                p.fillRect(QRectF(px, bar_y - 2, 2.5, bar_h + 4),
                           QColor(c["primary"]))
            else:
                col = QColor(c["sidebar_fg"])
                col.setAlpha(60)
                p.fillPath(bar_path, col)
            bar_y += 11

        # Content area origin
        cx = px + sb_w + 1
        cy = py

        # Top bar
        topbar_h = 12
        p.fillRect(QRectF(cx, cy, pw - sb_w - 1, topbar_h),
                    QColor(c["topbar_bg"]))

        # Content body
        body_y = cy + topbar_h + 4
        body_w = pw - sb_w - 10

        # Title "line"
        t_path = QPainterPath()
        t_path.addRoundedRect(QRectF(cx + 6, body_y, body_w * 0.45, 5), 2.5, 2.5)
        p.fillPath(t_path, QColor(c["fg"]))

        # Subtitle line
        sub_path = QPainterPath()
        sub_path.addRoundedRect(
            QRectF(cx + 6, body_y + 8, body_w * 0.65, 3), 1.5, 1.5)
        sub_col = QColor(c["fg"])
        sub_col.setAlpha(80)
        p.fillPath(sub_path, sub_col)

        # Primary accent "button"
        btn_path = QPainterPath()
        btn_rect = QRectF(cx + 6, body_y + 16, body_w * 0.28, 7)
        btn_path.addRoundedRect(btn_rect, 3.5, 3.5)
        p.fillPath(btn_path, QColor(c["primary"]))

        # Secondary "button"
        btn2_path = QPainterPath()
        btn2_rect = QRectF(cx + 6 + body_w * 0.30, body_y + 16,
                           body_w * 0.22, 7)
        btn2_path.addRoundedRect(btn2_rect, 3.5, 3.5)
        border_col = QColor(c["border"])
        border_col.setAlpha(160)
        p.fillPath(btn2_path, border_col)

        # Panel card
        card_y = body_y + 29
        card_h = ph - (card_y - py) - 16
        if card_h > 10:
            panel_rect = QRectF(cx + 6, card_y, body_w, card_h)
            panel_path = QPainterPath()
            panel_path.addRoundedRect(panel_rect, 5, 5)
            p.fillPath(panel_path, QColor(c["panel"]))

            # Panel border
            p.setPen(QPen(QColor(c["border"]), 0.8))
            p.drawPath(panel_path)
            p.setPen(Qt.PenStyle.NoPen)

            # Panel text lines
            line_y = card_y + 6
            for i in range(min(3, int((card_h - 12) / 7))):
                lw = body_w * (0.75 if i == 0 else (0.60 if i == 1 else 0.50))
                lp = QPainterPath()
                lp.addRoundedRect(
                    QRectF(cx + 12, line_y, lw - 8, 3), 1.5, 1.5)
                lcol = QColor(c["fg"])
                lcol.setAlpha(70)
                p.fillPath(lp, lcol)
                line_y += 7

        # Status bar at bottom
        status_h = 6
        p.fillRect(QRectF(cx, py + ph - status_h, pw - sb_w - 1, status_h),
                    QColor(c["status_bg"]))

        # Release clip
        p.setClipping(False)

        # ── Theme name label ─────────────────────────────────────────────
        label_y = py + ph + 4
        label_col = QColor("#e2e8f0") if c["bg"][1] < '8' else QColor("#1e293b")
        p.setPen(QPen(label_col))
        font = QFont("Segoe UI", 10, QFont.Weight.Bold)
        p.setFont(font)
        p.drawText(QRectF(px + 4, label_y, pw * 0.65, 20),
                   Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignVCenter,
                   self._name)

        # Checkmark if selected
        if self._selected:
            chk_col = QColor("#3b82f6")
            p.setPen(Qt.PenStyle.NoPen)
            chk_rect = QRectF(w - 28, label_y + 1, 18, 18)
            chk_path = QPainterPath()
            chk_path.addRoundedRect(chk_rect, 9, 9)
            p.fillPath(chk_path, chk_col)
            p.setPen(QPen(QColor("#ffffff"), 2))
            # Draw checkmark
            p.drawLine(int(chk_rect.x() + 4), int(chk_rect.y() + 9),
                       int(chk_rect.x() + 7), int(chk_rect.y() + 12))
            p.drawLine(int(chk_rect.x() + 7), int(chk_rect.y() + 12),
                       int(chk_rect.x() + 13), int(chk_rect.y() + 5))

        p.end()


# ═══════════════════════════════════════════════════════════════════════════
#  SETTINGS MIXIN
# ═══════════════════════════════════════════════════════════════════════════
class SettingsMixin:
    def build_settings_page(self):
        page = QWidget()
        page.setStyleSheet("background:transparent;")
        layout = QVBoxLayout(page)
        layout.setSpacing(18)
        layout.setContentsMargins(0, 0, 0, 0)

        layout.addWidget(mk_page_title(
            "Settings",
            "Global preferences, themes, and application configuration"))

        tabs = QTabWidget()

        # ══════════════════════════════════════════════════════════════════
        #  GENERAL TAB
        # ══════════════════════════════════════════════════════════════════
        gen_inner = QWidget()
        gen_inner.setStyleSheet("background:transparent;")
        gen_lay = QVBoxLayout(gen_inner)
        gen_lay.setSpacing(14)
        gen_lay.setContentsMargins(8, 16, 8, 16)

        gen_lay.addWidget(_sec_label("DISPLAY"))

        ft = QHBoxLayout()
        ft.setSpacing(10)
        ft.addWidget(QLabel("Global Time Format:"))
        self.combo_time_format = QComboBox()
        self.combo_time_format.addItems(["24 Hour", "12 Hour"])
        idx = self.combo_time_format.findText(
            getattr(self, "settings", {}).get("time_format", "24 Hour"))
        self.combo_time_format.setCurrentIndex(max(0, idx))
        ft.addWidget(self.combo_time_format)
        ft.addStretch()
        gen_lay.addLayout(ft)

        gen_lay.addWidget(_hsep())
        gen_lay.addWidget(_sec_label("LOGGING"))

        lg = QHBoxLayout()
        lg.setSpacing(10)
        lg.addWidget(QLabel("Maximum Console Log Lines (Memory limit):"))
        self.spin_log_lines = QSpinBox()
        self.spin_log_lines.setRange(100, 10000)
        self.spin_log_lines.setSingleStep(100)
        self.spin_log_lines.setValue(
            getattr(self, "settings", {}).get("max_log_lines", 1000))
        lg.addWidget(self.spin_log_lines)
        lg.addStretch()
        gen_lay.addLayout(lg)

        eg = QHBoxLayout()
        eg.setSpacing(10)
        eg.addWidget(QLabel("Export Activity Logs:"))
        btn_exp = QPushButton("\U0001f4e5  Export to Downloads")
        btn_exp.setStyleSheet(BTN_SECONDARY)
        btn_exp.clicked.connect(self.export_global_logs)
        self.lbl_export_status = QLabel("")
        eg.addWidget(btn_exp)
        eg.addWidget(self.lbl_export_status)
        eg.addStretch()
        gen_lay.addLayout(eg)

        log_bar_row = QHBoxLayout()
        self.toggle_show_log_bar = ToggleSwitch()
        self.toggle_show_log_bar.setChecked(
            getattr(self, "settings", {}).get("show_log_bar", True))
        log_bar_lbl = QLabel(
            "Show Activity Log Bar at the bottom of the application")
        log_bar_lbl.setStyleSheet(_TOGGLE_LBL)
        log_bar_row.addWidget(self.toggle_show_log_bar)
        log_bar_row.addWidget(log_bar_lbl)
        log_bar_row.addStretch()
        gen_lay.addLayout(log_bar_row)

        gen_lay.addWidget(_hsep())
        gen_lay.addWidget(_sec_label("BACKGROUND & TRAY BEHAVIOUR"))

        tray_row1 = QHBoxLayout()
        self.toggle_close_to_tray = ToggleSwitch()
        self.toggle_close_to_tray.setChecked(
            getattr(self, "settings", {}).get("close_to_tray", True))
        tray_lbl1 = QLabel(
            "Minimise to Tray on Close  (keep app running in background)")
        tray_lbl1.setStyleSheet(_TOGGLE_LBL)
        tray_row1.addWidget(self.toggle_close_to_tray)
        tray_row1.addWidget(tray_lbl1)
        tray_row1.addStretch()
        gen_lay.addLayout(tray_row1)

        tray_row2 = QHBoxLayout()
        self.toggle_tray_notifications = ToggleSwitch()
        self.toggle_tray_notifications.setChecked(
            getattr(self, "settings", {}).get("tray_notifications", True))
        tray_lbl2 = QLabel(
            "Show System Notifications when a backup completes, fails, "
            "or is cancelled")
        tray_lbl2.setStyleSheet(_TOGGLE_LBL)
        tray_row2.addWidget(self.toggle_tray_notifications)
        tray_row2.addWidget(tray_lbl2)
        tray_row2.addStretch()
        gen_lay.addLayout(tray_row2)

        tray_note = QLabel(
            "Notifications are sent via the Linux desktop notification "
            "system (notify-send / D-Bus) and appear in your desktop "
            "environment's notification bar. They work for both GUI "
            "and headless scheduled tasks, as long as a user session "
            "is active.")
        tray_note.setStyleSheet(_NOTE_STYLE)
        tray_note.setWordWrap(True)
        gen_lay.addWidget(tray_note)

        gen_lay.addSpacing(6)

        autostart_row = QHBoxLayout()
        self.toggle_autostart = ToggleSwitch()
        self.toggle_autostart.setChecked(self._detect_autostart())
        autostart_lbl = QLabel(
            "Start ArchVault at Login  (launch minimised to tray "
            "on desktop startup)")
        autostart_lbl.setStyleSheet(_TOGGLE_LBL)
        autostart_row.addWidget(self.toggle_autostart)
        autostart_row.addWidget(autostart_lbl)
        autostart_row.addStretch()
        gen_lay.addLayout(autostart_row)

        autostart_note = QLabel(
            "Creates an XDG autostart entry so ArchVault launches "
            "in the background when you log in. Useful for monitoring "
            "scheduled tasks. Requires 'Minimise to Tray on Close' "
            "to stay running.")
        autostart_note.setStyleSheet(_NOTE_STYLE)
        autostart_note.setWordWrap(True)
        gen_lay.addWidget(autostart_note)

        gen_lay.addStretch()
        gen_scroll = QScrollArea()
        gen_scroll.setWidgetResizable(True)
        gen_scroll.setFrameShape(QFrame.Shape.NoFrame)
        gen_scroll.setWidget(gen_inner)
        tabs.addTab(gen_scroll, "General")

        # ══════════════════════════════════════════════════════════════════
        #  BACKUPS TAB
        # ══════════════════════════════════════════════════════════════════
        bak_inner = QWidget()
        bak_inner.setStyleSheet("background:transparent;")
        bak_lay = QVBoxLayout(bak_inner)
        bak_lay.setSpacing(14)
        bak_lay.setContentsMargins(8, 16, 8, 16)

        bak_lay.addWidget(_sec_label("RETENTION"))

        rg = QHBoxLayout()
        rg.setSpacing(10)
        rg.addWidget(QLabel("Global Default Retention Policy (Days):"))
        self.spin_retention = QSpinBox()
        self.spin_retention.setRange(1, 365)
        self.spin_retention.setValue(
            getattr(self, "settings", {}).get("global_retention", 7))
        rg.addWidget(self.spin_retention)
        rg.addStretch()
        bak_lay.addLayout(rg)

        bak_lay.addWidget(_hsep())
        bak_lay.addWidget(_sec_label("ARCHIVE BEHAVIOUR"))

        cache_row = QHBoxLayout()
        self.chk_exclude_cache = ToggleSwitch()
        self.chk_exclude_cache.setChecked(
            getattr(self, "settings", {}).get("exclude_cache", True))
        cache_lbl = QLabel(
            "Automatically Exclude User Cache and Trash from Tar Archives "
            "(Saves space)")
        cache_lbl.setStyleSheet(_TOGGLE_LBL)
        cache_row.addWidget(self.chk_exclude_cache)
        cache_row.addWidget(cache_lbl)
        cache_row.addStretch()
        bak_lay.addLayout(cache_row)

        val_row = QHBoxLayout()
        self.chk_auto_validate = ToggleSwitch()
        self.chk_auto_validate.setChecked(
            getattr(self, "settings", {}).get("auto_validate", False))
        val_lbl = QLabel("Auto-Validate Backups On Completion")
        val_lbl.setStyleSheet(_TOGGLE_LBL)
        val_row.addWidget(self.chk_auto_validate)
        val_row.addWidget(val_lbl)
        val_row.addStretch()
        bak_lay.addLayout(val_row)

        bak_lay.addWidget(_hsep())
        bak_lay.addWidget(_sec_label("NAMING CONVENTION"))

        name_note = QLabel(
            "Variables: %profile%, %date% (YYYY-MM-DD), %time% (HHMM), "
            "%datetime%, %hostname%")
        name_note.setStyleSheet(_NOTE_STYLE)
        bak_lay.addWidget(name_note)

        self.txt_name_format = QLineEdit()
        self.txt_name_format.setText(
            getattr(self, "settings", {}).get(
                "backup_name_format", "ArchVault_%profile%_%datetime%"))
        bak_lay.addWidget(self.txt_name_format)

        bak_lay.addStretch()
        bak_scroll = QScrollArea()
        bak_scroll.setWidgetResizable(True)
        bak_scroll.setFrameShape(QFrame.Shape.NoFrame)
        bak_scroll.setWidget(bak_inner)
        tabs.addTab(bak_scroll, "Backups")

        # ══════════════════════════════════════════════════════════════════
        #  THEMES TAB  —  visual gallery
        # ══════════════════════════════════════════════════════════════════
        thm_inner = QWidget()
        thm_inner.setStyleSheet("background:transparent;")
        thm_lay = QVBoxLayout(thm_inner)
        thm_lay.setSpacing(14)
        thm_lay.setContentsMargins(8, 16, 8, 16)

        thm_lay.addWidget(_sec_label("SELECT A THEME"))
        thm_desc = QLabel(
            "Click a preview to select it. The theme is applied when you "
            "press Apply and Save Settings.")
        thm_desc.setStyleSheet(_NOTE_STYLE)
        thm_desc.setWordWrap(True)
        thm_lay.addWidget(thm_desc)

        # Hidden combo keeps save_settings_from_ui compatible
        self.theme_combo = QComboBox()
        self.theme_combo.addItems(list(THEME_COLORS.keys()))
        current_theme = getattr(self, "settings", {}).get(
            "theme", "ArchVault")
        idx = self.theme_combo.findText(current_theme)
        self.theme_combo.setCurrentIndex(max(0, idx))
        self.theme_combo.hide()
        thm_lay.addWidget(self.theme_combo)

        # Build gallery grid (3 columns)
        grid = QGridLayout()
        grid.setSpacing(14)
        self._theme_cards = {}

        for i, (name, colors) in enumerate(THEME_COLORS.items()):
            card = _ThemePreviewCard(
                name, colors, selected=(name == current_theme))
            card.clicked.connect(self._on_theme_card_clicked)
            self._theme_cards[name] = card
            grid.addWidget(card, i // 3, i % 3)

        thm_lay.addLayout(grid)
        thm_lay.addStretch()

        thm_scroll = QScrollArea()
        thm_scroll.setWidgetResizable(True)
        thm_scroll.setFrameShape(QFrame.Shape.NoFrame)
        thm_scroll.setWidget(thm_inner)
        tabs.addTab(thm_scroll, "Themes")

        # ══════════════════════════════════════════════════════════════════
        #  CHANGE LOG TAB
        # ══════════════════════════════════════════════════════════════════
        tab_log = QWidget()
        log_lay = QVBoxLayout(tab_log)
        log_lay.setContentsMargins(8, 16, 8, 8)

        log_browser = QTextBrowser()
        log_browser.setReadOnly(True)
        log_browser.setStyleSheet(
            "background-color: #0f111a; color: #e2e8f0; "
            "border: 1px solid #2e3246; border-radius: 8px; "
            "padding: 15px; font-family: 'Segoe UI', system-ui, sans-serif; "
            "font-size: 13px;")
        log_browser.setOpenExternalLinks(True)

        changelog_html = """
        <style>
            h2 { color: #60a5fa; border-bottom: 1px solid #334155;
                 padding-bottom: 6px; }
            .ver-current { font-size: 16px; font-weight: bold; color: #34d399;
                           margin-top: 18px; margin-bottom: 6px; }
            .ver-old     { font-size: 15px; font-weight: bold; color: #64748b;
                           margin-top: 18px; margin-bottom: 6px; }
            .date { font-size: 12px; color: #475569; margin-left: 8px; }
            ul   { margin-top: 4px; margin-bottom: 4px; }
            li   { margin-bottom: 4px; color: #cbd5e1; }
            code { color: #f472b6; font-family: monospace; font-size: 12px; }
        </style>
        <h2>ArchVault Change Log</h2>

        <p class="ver-current">v5.0.1-beta
            <span class="date">2026-02-28</span></p>
        <ul>
            <li><b>Feature — GNOME Background Apps integration:</b>
                ArchVault now registers with the XDG Background
                Portal via DBus. When minimised to tray, it appears
                in the GNOME quick-settings "Background Apps" panel
                with a live status message (Idle, Backup in
                progress, Paused, etc.). Works on GNOME 44+ with
                xdg-desktop-portal. Fails silently on other DEs.</li>
            <li><b>Improved — Desktop file identity:</b>
                <code>setDesktopFileName("archvault")</code> links
                the running process to the .desktop launcher so
                GNOME correctly identifies the app in the panel,
                Alt-Tab, and background apps list.</li>
            <li><b>Improved — DBus session bus for root:</b>
                Portal calls detect the invoking user's session bus
                via PKEXEC_UID / SUDO_UID so background registration
                works even when running as root via pkexec.</li>
            <li><b>Feature — Start at Login toggle:</b>
                New setting in General tab creates an XDG autostart
                desktop entry in the user's
                <code>~/.config/autostart/</code> directory.
                ArchVault launches minimised to tray on desktop
                startup. Resolves the real user's home directory
                when running as root via pkexec/sudo.</li>
        </ul>

        <p class="ver-old">v5.0.0-beta
            <span class="date">2026-02-28</span></p>
        <ul>
            <li><b>🎉  First public release — AUR &amp; GitHub.</b></li>
            <li><b>Themed confirmation dialogs, 2-D dashboard,
                scheduled tasks, theme gallery, app icon.</b></li>
        </ul>

        <p class="ver-old">v4.3.19-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Feature — 2-D tile grid, 4-edge resize,
                scalable donut chart.</b></li>
        </ul>

        <p class="ver-old">v4.3.17-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Fix — Seamless rounded edges, edge resize.</b></li>
        </ul>

        <p class="ver-old">v4.3.16-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Fix — Full title-bar drag, row highlight,
                no yellow underline.</b></li>
        </ul>

        <p class="ver-old">v4.3.15-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Feature — Editable drag-and-drop dashboard.</b></li>
            <li><b>Feature — 5 new dashboard tiles.</b></li>
            <li><b>Feature — Reset dashboard button.</b></li>
        </ul>

        <p class="ver-old">v4.3.14-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Feature — Native Linux system notifications.</b></li>
        </ul>

        <p class="ver-old">v4.3.13-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Feature — Human-readable error messages:</b>
                All failure outputs now show plain-language reasons
                instead of "Exit 1". Stderr is pattern-matched against
                15+ common Linux/network errors (permission denied,
                no space, mount failure, broken pipe, authentication,
                I/O error, DNS, timeout, etc.).</li>
            <li><b>Feature — User cancellation tracking:</b>
                Cancelled jobs now show "Cancelled by user" instead
                of "Failed". Bash trap handlers exit with code 130
                (SIGINT convention). Jobs tab shows Cancelled status
                in purple.</li>
            <li><b>Feature — Bash script error output:</b>
                All bash scripts in backup and restore engines now
                emit descriptive <code>echo >&2</code> messages
                before every exit. Mount failures use exit code 10
                with specific messaging. Rsync exit codes 1–35 are
                mapped to human-readable descriptions.</li>
            <li><b>Feature — Signal name decoding:</b>
                Exit codes above 128 are decoded to signal names
                (SIGKILL, SIGTERM, SIGPIPE, etc.) with explanations.</li>
        </ul>

        <p class="ver-old">v4.3.12-beta
            <span class="date">2026-02-27</span></p>
        <ul>
            <li><b>Feature — Scheduled tasks visible in Jobs tab.</b></li>
            <li><b>Feature — Cancel scheduled tasks from GUI.</b></li>
            <li><b>Fix — Jobs sync encrypted file handling.</b></li>
        </ul>

        <p class="ver-old">v4.3.11-beta
            <span class="date">2026-02-26</span></p>
        <ul>
            <li><b>Fix — Headless backup using wrong engine.</b></li>
        </ul>

        <p class="ver-old">v4.3.10-beta
            <span class="date">2026-02-26</span></p>
        <ul>
            <li><b>Fix — Scheduled tasks failing to find target:</b>
                Tasks page was saving profile targets with
                <code>.title()</code> casing (<code>Network:</code>)
                while the main dropdown uses <code>.upper()</code>
                (<code>NETWORK:</code>). Headless <code>findText</code>
                is case-sensitive and always failed. Now both use
                <code>.upper()</code>. Added case-insensitive fallback
                in headless mode for previously-saved tasks.</li>
        </ul>

        <p class="ver-old">v4.3.9-beta
            <span class="date">2026-02-26</span></p>
        <ul>
            <li><b>Fix — Scheduled tasks not triggering:</b> Systemd
                service files now include environment variables, 
                WorkingDirectory, network-online dependency, and
                use <code>sys.executable</code>.</li>
            <li><b>Fix — Headless Qt crash:</b> Moved offscreen
                platform setup before all PyQt6 imports.</li>
        </ul>

        <p class="ver-old">v4.3.8-beta
            <span class="date">2026-02-26</span></p>
        <ul>
            <li><b>UI — Theme gallery:</b> Settings → Themes now shows a
                visual gallery of clickable preview cards instead of a plain
                dropdown. Each card paints a miniature replica of the
                ArchVault layout using the theme's actual colours.</li>
            <li><b>UI — Settings + Jobs pages modernised.</b></li>
            <li><b>Default theme changed to ArchVault.</b></li>
        </ul>

        <p class="ver-old">v4.3.7-beta
            <span class="date">2026-02-26</span></p>
        <ul>
            <li><b>Interim build — superseded by v4.3.8.</b></li>
        </ul>

        <p class="ver-old">v4.3.6-beta
            <span class="date">2026-02-25</span></p>
        <ul>
            <li><b>UI — Profiles section complete overhaul:</b> All five
                profile pages rewritten to match the modern UI standard.</li>
            <li><b>UI — Edit panels modernised.</b></li>
            <li><b>UI — Notification sub-panels use card containers.</b></li>
        </ul>

        <p class="ver-old">v4.3.5-beta
            <span class="date">2026-02-25</span></p>
        <ul>
            <li><b>Fix — Light theme page titles invisible.</b></li>
            <li><b>UI — Stream Progress card compacted.</b></li>
            <li><b>UI — Pause → Resume button toggle.</b></li>
            <li><b>UI — Logs drawer no longer auto-opens.</b></li>
            <li><b>Feature — Show Activity Log Bar setting.</b></li>
        </ul>

        <p class="ver-old">v4.3.4-beta
            <span class="date">2026-02-25</span></p>
        <ul>
            <li><b>UI — Removed per-tab stream consoles.</b></li>
            <li><b>UI — Stream Progress cards for Backup and Restore.</b></li>
            <li><b>Feature — Pre-flight size calculation.</b></li>
        </ul>

        <p class="ver-old">v4.3.3-beta
            <span class="date">2026-02-25</span></p>
        <ul>
            <li><b>Fix — Scheduled tasks not triggering.</b></li>
            <li><b>Fix — Pause button stops backups.</b></li>
            <li><b>Fix — Light theme dropdown menus.</b></li>
        </ul>

        <p class="ver-old">v4.3.2-beta
            <span class="date">2026-02-24</span></p>
        <ul>
            <li><b>UI — Collapsible console drawer.</b></li>
        </ul>

        <p class="ver-old">v4.3.1-beta
            <span class="date">2026-02-24</span></p>
        <ul>
            <li><b>Feature — Restore: Btrfs Snapshot source.</b></li>
        </ul>

        <p class="ver-old">v4.2.1-beta
            <span class="date">2026-02-22</span></p>
        <ul>
            <li><b>Multiple SFTP / rsync auth and restore fixes.</b></li>
        </ul>

        <p class="ver-old">v4.2.0-beta
            <span class="date">2026-02-19</span></p>
        <ul>
            <li><b>Feature — Pre/Post Backup Hooks.</b></li>
            <li><b>Feature — Real Progress Bar via <code>pv</code>.</b></li>
            <li><b>Feature — Snapshot Browser auto-scan + overhaul.</b></li>
            <li><b>Feature — SFTP rsync-over-SSH transfer mode.</b></li>
        </ul>

        <p class="ver-old">v4.1.0-beta
            <span class="date">2026-02-19</span></p>
        <ul>
            <li><b>Fix:</b> All 14 project files output together. VERSION
                unified. Grey tab backgrounds removed. Maximize restored.</li>
        </ul>

        <p class="ver-old">v4.0.0-beta
            <span class="date">2026-02-19</span></p>
        <ul>
            <li><b>Feature:</b> Restore from Network / SFTP. SFTP profiles.
                Snapshot Browser. 14-file modular architecture.</li>
        </ul>

        <p class="ver-old">v3.0.0-beta
            <span class="date">2026-02-19</span></p>
        <ul>
            <li><b>Feature:</b> rsync incremental, GPG encryption,
                compression control, email + webhook notifications.</li>
        </ul>

        <p class="ver-old">v2.1.0-beta
            <span class="date">2026-02-19</span></p>
        <ul>
            <li><b>Feature:</b> System tray, desktop notifications,
                background mode.</li>
        </ul>

        <p class="ver-old">v1.0.x
            <span class="date">2026-02-18</span></p>
        <ul>
            <li><b>Initial Release:</b> Core backup engine, profile
                management, systemd scheduling, job history, PyQt6 UI.</li>
        </ul>
        """
        log_browser.setHtml(changelog_html)
        log_lay.addWidget(log_browser)
        tabs.addTab(tab_log, "Change Log")

        tabs.currentChanged.connect(
            lambda: self.lbl_export_status.setText(""))
        if hasattr(self, 'sidebar'):
            self.sidebar.currentRowChanged.connect(
                lambda: self.lbl_export_status.setText("")
                if hasattr(self, 'lbl_export_status') else None)

        layout.addWidget(tabs)

        # ── Save button ───────────────────────────────────────────────────
        layout.addWidget(_hsep())
        btn_box = QHBoxLayout()
        btn_save = QPushButton("\U0001f4be  Apply and Save Settings")
        btn_save.setStyleSheet(BTN_SUCCESS)
        btn_save.clicked.connect(self.save_settings_from_ui)
        btn_box.addWidget(btn_save)
        btn_box.addStretch()
        layout.addLayout(btn_box)

        return page

    # ── Theme card click handler ──────────────────────────────────────────
    def _on_theme_card_clicked(self, name):
        """Select a theme card and update the hidden combo."""
        for cname, card in self._theme_cards.items():
            card.set_selected(cname == name)
        self.theme_combo.setCurrentText(name)

    # ── Autostart helpers ─────────────────────────────────────────────────

    _AUTOSTART_FILENAME = "archvault.desktop"
    _AUTOSTART_CONTENT = (
        "[Desktop Entry]\n"
        "Name=ArchVault\n"
        "Comment=Backup & Restore Manager for Arch Linux\n"
        "GenericName=Backup Manager\n"
        "Exec=archvault\n"
        "Icon=archvault\n"
        "Terminal=false\n"
        "Type=Application\n"
        "Categories=System;Archiving;Utility;\n"
        "X-GNOME-Autostart-enabled=true\n"
        "X-GNOME-Autostart-Delay=5\n"
        "StartupNotify=false\n"
    )

    def _get_autostart_dir(self):
        """
        Return the real user's ~/.config/autostart/ directory.
        When running as root via pkexec/sudo, resolve the invoking
        user's home from PKEXEC_UID / SUDO_UID.
        """
        uid = (os.environ.get("PKEXEC_UID")
               or os.environ.get("SUDO_UID"))
        if uid:
            try:
                import pwd
                pw = pwd.getpwuid(int(uid))
                return os.path.join(pw.pw_dir, ".config", "autostart")
            except Exception:
                pass
        # Fallback — system-wide autostart
        return "/etc/xdg/autostart"

    def _get_autostart_path(self):
        return os.path.join(
            self._get_autostart_dir(), self._AUTOSTART_FILENAME)

    def _detect_autostart(self):
        """Check if the autostart desktop entry exists."""
        return os.path.isfile(self._get_autostart_path())

    def _apply_autostart(self, enabled):
        """Create or remove the autostart desktop entry."""
        path = self._get_autostart_path()
        if enabled:
            try:
                autodir = self._get_autostart_dir()
                os.makedirs(autodir, exist_ok=True)
                with open(path, "w") as f:
                    f.write(self._AUTOSTART_CONTENT)
                os.chmod(path, 0o644)
                # Fix ownership if we're root writing to user dir
                uid = (os.environ.get("PKEXEC_UID")
                       or os.environ.get("SUDO_UID"))
                gid = (os.environ.get("SUDO_GID"))
                if uid:
                    u = int(uid)
                    g = int(gid) if gid else u
                    os.chown(path, u, g)
                    # Also fix autostart dir ownership if we created it
                    os.chown(autodir, u, g)
                self.log("INFO: Autostart entry created — ArchVault "
                         "will launch at login.")
            except Exception as e:
                self.log(f"WARN: Could not create autostart entry: {e}")
        else:
            try:
                if os.path.exists(path):
                    os.remove(path)
                self.log("INFO: Autostart entry removed — ArchVault "
                         "will no longer launch at login.")
            except Exception as e:
                self.log(f"WARN: Could not remove autostart entry: {e}")
