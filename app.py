#!/usr/bin/env python3
"""Нативный UI раскадровки — чёрно-белый, Arial.

Запуск:
  raskadrovka
  # или: python app.py
"""

from __future__ import annotations

import os
import sys
import tempfile
import traceback
from pathlib import Path

from PyQt6.QtCore import Qt, QSize, QThread, pyqtSignal, QUrl
from PyQt6.QtGui import QFont, QImage, QPixmap, QColor, QPalette, QAction, QKeySequence
from PyQt6.QtMultimedia import QAudioOutput, QMediaPlayer
from PyQt6.QtMultimediaWidgets import QVideoWidget
from PyQt6.QtWidgets import (
    QApplication,
    QMainWindow,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QLabel,
    QPushButton,
    QListWidget,
    QListWidgetItem,
    QAbstractItemView,
    QFileDialog,
    QTabWidget,
    QSpinBox,
    QDoubleSpinBox,
    QCheckBox,
    QTextEdit,
    QSplitter,
    QMessageBox,
    QGroupBox,
    QFormLayout,
    QComboBox,
    QStatusBar,
    QStackedWidget,
    QSlider,
)

from pipeline import (
    IMAGE_SUFFIXES,
    VIDEO_SUFFIXES,
    flip_media,
    flip_many,
    run_scans_to_video,
    run_video_to_sheets,
    rotate_media,
    rotate_many,
)


def _work_dir() -> Path:
    """Writable job dir: next to sources in dev, XDG cache when installed."""
    base = Path(__file__).resolve().parent
    if str(base).startswith("/usr"):
        root = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache")) / "raskadrovka"
    else:
        root = base / "_ui_work"
    root.mkdir(parents=True, exist_ok=True)
    return root


WORK = _work_dir()

STYLE = """
* {
    font-family: Arial;
    font-size: 13px;
    color: #ffffff;
    background-color: #000000;
}
QMainWindow, QWidget, QTabWidget, QTabBar, QSplitter, QGroupBox {
    background-color: #000000;
    color: #ffffff;
}
QTabBar::tab {
    background: #111111;
    color: #cccccc;
    padding: 8px 16px;
    border: 1px solid #333333;
    margin-right: 2px;
}
QTabBar::tab:selected {
    background: #ffffff;
    color: #000000;
}
QPushButton {
    background-color: #ffffff;
    color: #000000;
    border: 1px solid #ffffff;
    padding: 6px 12px;
    min-height: 28px;
}
QPushButton:hover {
    background-color: #dddddd;
}
QPushButton:pressed {
    background-color: #bbbbbb;
}
QPushButton:disabled {
    background-color: #333333;
    color: #777777;
    border-color: #333333;
}
QListWidget, QTextEdit, QSpinBox, QDoubleSpinBox, QComboBox {
    background-color: #0a0a0a;
    color: #ffffff;
    border: 1px solid #444444;
    selection-background-color: #ffffff;
    selection-color: #000000;
}
QComboBox QAbstractItemView {
    background-color: #0a0a0a;
    color: #ffffff;
    selection-background-color: #ffffff;
    selection-color: #000000;
}
QCheckBox {
    spacing: 8px;
}
QCheckBox::indicator {
    width: 16px;
    height: 16px;
    border: 1px solid #ffffff;
    background: #000000;
}
QCheckBox::indicator:checked {
    background: #ffffff;
}
QGroupBox {
    border: 1px solid #444444;
    margin-top: 12px;
    padding-top: 8px;
    font-weight: bold;
}
QGroupBox::title {
    subcontrol-origin: margin;
    left: 8px;
    padding: 0 4px;
}
QStatusBar {
    background: #000000;
    color: #aaaaaa;
    border-top: 1px solid #333333;
}
QScrollBar:vertical, QScrollBar:horizontal {
    background: #000000;
    border: none;
    width: 10px;
    height: 10px;
}
QScrollBar::handle {
    background: #555555;
}
QLabel#preview {
    background-color: #000000;
    border: 1px solid #333333;
}
QVideoWidget {
    background-color: #000000;
    border: 1px solid #333333;
}
QSlider::groove:horizontal {
    height: 6px;
    background: #333333;
}
QSlider::handle:horizontal {
    background: #ffffff;
    width: 12px;
    margin: -4px 0;
}
QSlider::sub-page:horizontal {
    background: #ffffff;
}
"""


def load_pixmap(path: Path, max_size: QSize) -> QPixmap:
    img = QImage(str(path))
    if img.isNull():
        return QPixmap()
    pix = QPixmap.fromImage(img)
    return pix.scaled(
        max_size,
        Qt.AspectRatioMode.KeepAspectRatio,
        Qt.TransformationMode.SmoothTransformation,
    )


class Worker(QThread):
    finished_ok = pyqtSignal(object)
    failed = pyqtSignal(str)

    def __init__(self, fn, *args, **kwargs):
        super().__init__()
        self.fn = fn
        self.args = args
        self.kwargs = kwargs

    def run(self):
        try:
            self.finished_ok.emit(self.fn(*self.args, **self.kwargs))
        except Exception as exc:
            self.failed.emit(f"{exc}\n\n{traceback.format_exc()}")


class PathListPanel(QWidget):
    """Список файлов с drag-and-drop и кнопками порядка."""

    order_changed = pyqtSignal()
    selection_changed = pyqtSignal()

    def __init__(self, parent=None):
        super().__init__(parent)
        lay = QVBoxLayout(self)
        lay.setContentsMargins(0, 0, 0, 0)

        self.list = QListWidget()
        self.list.setDragDropMode(QAbstractItemView.DragDropMode.InternalMove)
        self.list.setDefaultDropAction(Qt.DropAction.MoveAction)
        self.list.setSelectionMode(QAbstractItemView.SelectionMode.ExtendedSelection)
        self.list.model().rowsMoved.connect(lambda *_: self.order_changed.emit())
        self.list.itemSelectionChanged.connect(self.selection_changed.emit)
        self.list.itemDoubleClicked.connect(self._on_activate)
        lay.addWidget(self.list, stretch=1)

        row = QHBoxLayout()
        self.btn_top = QPushButton("⇈")
        self.btn_up = QPushButton("↑")
        self.btn_down = QPushButton("↓")
        self.btn_bottom = QPushButton("⇊")
        self.btn_remove = QPushButton("Удалить")
        for b in (self.btn_top, self.btn_up, self.btn_down, self.btn_bottom, self.btn_remove):
            b.setFixedHeight(28)
            row.addWidget(b)
        lay.addLayout(row)

        self.btn_top.clicked.connect(lambda: self.move_selected("top"))
        self.btn_up.clicked.connect(lambda: self.move_selected("up"))
        self.btn_down.clicked.connect(lambda: self.move_selected("down"))
        self.btn_bottom.clicked.connect(lambda: self.move_selected("bottom"))
        self.btn_remove.clicked.connect(self.remove_selected)

    def _on_activate(self, _item):
        self.selection_changed.emit()

    def add_paths(self, paths: list[Path], *, unique: bool = True):
        existing = {str(p) for p in self.paths()} if unique else set()
        for path in paths:
            path = Path(path)
            key = str(path.resolve()) if path.exists() else str(path)
            if unique and key in existing:
                continue
            item = QListWidgetItem(path.name)
            item.setData(Qt.ItemDataRole.UserRole, str(path))
            item.setToolTip(str(path))
            self.list.addItem(item)
            existing.add(key)
        self.order_changed.emit()

    def clear(self):
        self.list.clear()
        self.order_changed.emit()

    def paths(self) -> list[Path]:
        out: list[Path] = []
        for i in range(self.list.count()):
            data = self.list.item(i).data(Qt.ItemDataRole.UserRole)
            if data:
                out.append(Path(data))
        return out

    def selected_paths(self) -> list[Path]:
        out: list[Path] = []
        for item in self.list.selectedItems():
            data = item.data(Qt.ItemDataRole.UserRole)
            if data:
                out.append(Path(data))
        return out

    def move_selected(self, where: str):
        rows = sorted({i.row() for i in self.list.selectedIndexes()})
        if not rows:
            return
        payload = []
        for r in rows:
            item = self.list.item(r)
            payload.append(
                (item.text(), item.data(Qt.ItemDataRole.UserRole), item.toolTip())
            )
        for r in reversed(rows):
            self.list.takeItem(r)

        if where == "top":
            insert_at = 0
        elif where == "bottom":
            insert_at = self.list.count()
        elif where == "up":
            insert_at = max(0, rows[0] - 1)
        else:
            insert_at = min(self.list.count(), rows[0] + 1)

        for i, (text, data, tip) in enumerate(payload):
            item = QListWidgetItem(text)
            item.setData(Qt.ItemDataRole.UserRole, data)
            item.setToolTip(tip or "")
            self.list.insertItem(insert_at + i, item)
            item.setSelected(True)
        self.order_changed.emit()

    def remove_selected(self):
        for item in self.list.selectedItems():
            self.list.takeItem(self.list.row(item))
        self.order_changed.emit()


class PreviewPane(QWidget):
    """Preview + rotate controls for current media list."""

    def __init__(self, parent=None):
        super().__init__(parent)
        self.paths: list[Path] = []
        self.index = 0
        self._showing_video = False

        layout = QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0)

        self.title = QLabel("Нет файла")
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(self.title)

        self.stack = QStackedWidget()
        self.stack.setMinimumSize(420, 320)

        self.image_label = QLabel()
        self.image_label.setObjectName("preview")
        self.image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.image_label.setScaledContents(False)
        self.stack.addWidget(self.image_label)

        self.video_widget = QVideoWidget()
        self.video_widget.setAspectRatioMode(Qt.AspectRatioMode.KeepAspectRatio)
        self.stack.addWidget(self.video_widget)

        layout.addWidget(self.stack, stretch=1)

        self.player = QMediaPlayer(self)
        self.audio = QAudioOutput(self)
        self.audio.setVolume(0.8)
        self.player.setAudioOutput(self.audio)
        self.player.setVideoOutput(self.video_widget)
        self.player.errorOccurred.connect(self._on_player_error)

        transport = QHBoxLayout()
        self.btn_play = QPushButton("▶")
        self.btn_play.setFixedWidth(40)
        self.btn_stop = QPushButton("■")
        self.btn_stop.setFixedWidth(40)
        self.seek = QSlider(Qt.Orientation.Horizontal)
        self.seek.setRange(0, 0)
        self.time_lbl = QLabel("0:00 / 0:00")
        self.time_lbl.setMinimumWidth(100)
        transport.addWidget(self.btn_play)
        transport.addWidget(self.btn_stop)
        transport.addWidget(self.seek, stretch=1)
        transport.addWidget(self.time_lbl)
        layout.addLayout(transport)
        self._set_transport_enabled(False)

        self.btn_play.clicked.connect(self.toggle_play)
        self.btn_stop.clicked.connect(self.stop_video)
        self.seek.sliderMoved.connect(self.player.setPosition)
        self.player.positionChanged.connect(self._on_position)
        self.player.durationChanged.connect(self._on_duration)
        self.player.playbackStateChanged.connect(self._on_state)

        nav = QHBoxLayout()
        self.btn_prev = QPushButton("← Пред")
        self.btn_next = QPushButton("След →")
        self.counter = QLabel("0 / 0")
        self.counter.setAlignment(Qt.AlignmentFlag.AlignCenter)
        nav.addWidget(self.btn_prev)
        nav.addWidget(self.counter, stretch=1)
        nav.addWidget(self.btn_next)
        layout.addLayout(nav)

        rot = QHBoxLayout()
        self.btn_ccw = QPushButton("↺ 90°")
        self.btn_180 = QPushButton("180°")
        self.btn_cw = QPushButton("↻ 90°")
        self.btn_all_cw = QPushButton("Все ↻ 90°")
        self.btn_all_180 = QPushButton("Все 180°")
        for b in (self.btn_ccw, self.btn_180, self.btn_cw, self.btn_all_cw, self.btn_all_180):
            rot.addWidget(b)
        layout.addLayout(rot)

        flip = QHBoxLayout()
        self.btn_flip_h = QPushButton("↔ Горизонт.")
        self.btn_flip_v = QPushButton("↕ Вертик.")
        self.btn_flip_all_h = QPushButton("Все ↔")
        self.btn_flip_all_v = QPushButton("Все ↕")
        for b in (self.btn_flip_h, self.btn_flip_v, self.btn_flip_all_h, self.btn_flip_all_v):
            flip.addWidget(b)
        layout.addLayout(flip)

        self.btn_prev.clicked.connect(self.prev_item)
        self.btn_next.clicked.connect(self.next_item)
        self.btn_cw.clicked.connect(lambda: self.rotate_current(90))
        self.btn_ccw.clicked.connect(lambda: self.rotate_current(270))
        self.btn_180.clicked.connect(lambda: self.rotate_current(180))
        self.btn_all_cw.clicked.connect(lambda: self.rotate_all(90))
        self.btn_all_180.clicked.connect(lambda: self.rotate_all(180))
        self.btn_flip_h.clicked.connect(lambda: self.flip_current(horizontal=True))
        self.btn_flip_v.clicked.connect(lambda: self.flip_current(vertical=True))
        self.btn_flip_all_h.clicked.connect(lambda: self.flip_all(horizontal=True))
        self.btn_flip_all_v.clicked.connect(lambda: self.flip_all(vertical=True))

    def _set_transport_enabled(self, enabled: bool):
        self.btn_play.setEnabled(enabled)
        self.btn_stop.setEnabled(enabled)
        self.seek.setEnabled(enabled)

    def _fmt(self, ms: int) -> str:
        s = max(0, ms) // 1000
        return f"{s // 60}:{s % 60:02d}"

    def _on_position(self, pos: int):
        if not self.seek.isSliderDown():
            self.seek.setValue(pos)
        dur = self.player.duration()
        self.time_lbl.setText(f"{self._fmt(pos)} / {self._fmt(dur)}")

    def _on_duration(self, dur: int):
        self.seek.setRange(0, max(0, dur))

    def _on_state(self, state):
        playing = state == QMediaPlayer.PlaybackState.PlayingState
        self.btn_play.setText("❚❚" if playing else "▶")

    def _on_player_error(self, *_args):
        err = self.player.errorString() or "неизвестная ошибка"
        self.image_label.setText(f"Не удалось открыть видео\n{err}")
        self.stack.setCurrentWidget(self.image_label)
        self._set_transport_enabled(False)

    def toggle_play(self):
        if self.player.playbackState() == QMediaPlayer.PlaybackState.PlayingState:
            self.player.pause()
        else:
            self.player.play()

    def stop_video(self):
        self.player.pause()
        self.player.setPosition(0)

    def stop_and_clear_player(self):
        self.player.stop()
        self.player.setSource(QUrl())
        self._showing_video = False
        self._set_transport_enabled(False)

    def set_paths(self, paths: list[Path]):
        self.stop_and_clear_player()
        self.paths = [Path(p) for p in paths if Path(p).exists()]
        self.index = 0
        self.refresh()

    def current(self) -> Path | None:
        if not self.paths:
            return None
        return self.paths[self.index]

    def refresh(self):
        n = len(self.paths)
        self.counter.setText(f"{self.index + 1 if n else 0} / {n}")
        path = self.current()
        if path is None:
            self.stop_and_clear_player()
            self.title.setText("Нет файла")
            self.image_label.clear()
            self.stack.setCurrentWidget(self.image_label)
            return

        self.title.setText(path.name)
        suffix = path.suffix.lower()
        if suffix in IMAGE_SUFFIXES:
            self.stop_and_clear_player()
            self.stack.setCurrentWidget(self.image_label)
            pix = load_pixmap(path, self.image_label.size() - QSize(16, 16))
            if pix.isNull():
                self.image_label.setText(path.name)
            else:
                self.image_label.setPixmap(pix)
        elif suffix in VIDEO_SUFFIXES:
            self.stack.setCurrentWidget(self.video_widget)
            self._set_transport_enabled(True)
            url = QUrl.fromLocalFile(str(path.resolve()))
            if self.player.source() != url or not self._showing_video:
                self.player.setSource(url)
                self._showing_video = True
                self.player.play()
        else:
            self.stop_and_clear_player()
            self.stack.setCurrentWidget(self.image_label)
            self.image_label.setText(path.name)

    def resizeEvent(self, event):
        super().resizeEvent(event)
        # Only re-fit still images; don't reload video.
        path = self.current()
        if path and path.suffix.lower() in IMAGE_SUFFIXES:
            pix = load_pixmap(path, self.image_label.size() - QSize(16, 16))
            if not pix.isNull():
                self.image_label.setPixmap(pix)

    def prev_item(self):
        if not self.paths:
            return
        self.index = (self.index - 1) % len(self.paths)
        self.refresh()

    def next_item(self):
        if not self.paths:
            return
        self.index = (self.index + 1) % len(self.paths)
        self.refresh()

    def rotate_current(self, degrees_cw: int):
        path = self.current()
        if path is None:
            return
        was_video = path.suffix.lower() in VIDEO_SUFFIXES
        if was_video:
            self.stop_and_clear_player()
        try:
            rotate_media(path, degrees_cw, inplace=True)
            self.refresh()
        except Exception as exc:
            QMessageBox.critical(self, "Ошибка поворота", str(exc))

    def rotate_all(self, degrees_cw: int):
        if not self.paths:
            return
        self.stop_and_clear_player()
        try:
            rotate_many(self.paths, degrees_cw, inplace=True)
            self.refresh()
        except Exception as exc:
            QMessageBox.critical(self, "Ошибка поворота", str(exc))

    def flip_current(self, *, horizontal: bool = False, vertical: bool = False):
        path = self.current()
        if path is None:
            return
        was_video = path.suffix.lower() in VIDEO_SUFFIXES
        if was_video:
            self.stop_and_clear_player()
        try:
            flip_media(path, horizontal=horizontal, vertical=vertical, inplace=True)
            self.refresh()
        except Exception as exc:
            QMessageBox.critical(self, "Ошибка отражения", str(exc))

    def flip_all(self, *, horizontal: bool = False, vertical: bool = False):
        if not self.paths:
            return
        self.stop_and_clear_player()
        try:
            flip_many(self.paths, horizontal=horizontal, vertical=vertical, inplace=True)
            self.refresh()
        except Exception as exc:
            QMessageBox.critical(self, "Ошибка отражения", str(exc))


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Раскадровка")
        self.resize(1180, 760)
        self.worker: Worker | None = None

        self.scan_paths: list[Path] = []  # kept in sync via scan_panel.paths()
        self.video_paths: list[Path] = []
        self.result_paths: list[Path] = []

        central = QWidget()
        self.setCentralWidget(central)
        root = QHBoxLayout(central)

        splitter = QSplitter(Qt.Orientation.Horizontal)
        root.addWidget(splitter)

        left = QWidget()
        left_l = QVBoxLayout(left)
        self.tabs = QTabWidget()
        left_l.addWidget(self.tabs)
        self.log = QTextEdit()
        self.log.setReadOnly(True)
        self.log.setMaximumHeight(160)
        left_l.addWidget(self.log)
        splitter.addWidget(left)

        self.preview = PreviewPane()
        splitter.addWidget(self.preview)
        splitter.setStretchFactor(0, 1)
        splitter.setStretchFactor(1, 2)

        self._build_video_tab()
        self._build_scans_tab()
        self._build_rotate_tab()

        self.status = QStatusBar()
        self.setStatusBar(self.status)
        self.status.showMessage("Готово")

        open_act = QAction("Открыть медиа…", self)
        open_act.setShortcut(QKeySequence.StandardKey.Open)
        open_act.triggered.connect(self.open_any_media)
        self.menuBar().addAction(open_act)

    def append_log(self, text: str):
        self.log.append(text)
        self.status.showMessage(text.splitlines()[-1][:120] if text else "")

    def _build_video_tab(self):
        tab = QWidget()
        lay = QVBoxLayout(tab)

        btn_pick = QPushButton("Добавить видео…")
        btn_pick.clicked.connect(self.pick_video)
        lay.addWidget(btn_pick)

        self.video_panel = PathListPanel()
        self.video_panel.order_changed.connect(self._on_video_order_changed)
        self.video_panel.selection_changed.connect(self._preview_selected_videos)
        lay.addWidget(self.video_panel, stretch=1)
        lay.addWidget(QLabel("Порядок = очередь обработки. Перетащите или ↑↓."))

        form = QFormLayout()
        self.interval = QDoubleSpinBox()
        self.interval.setRange(0.05, 5.0)
        self.interval.setSingleStep(0.05)
        self.interval.setValue(0.25)
        self.hold_v = QDoubleSpinBox()
        self.hold_v.setRange(0.05, 2.0)
        self.hold_v.setSingleStep(0.05)
        self.hold_v.setValue(0.1)
        self.per_page = QSpinBox()
        self.per_page.setRange(4, 24)
        self.per_page.setValue(12)
        form.addRow("Интервал (с)", self.interval)
        form.addRow("Удержание (с)", self.hold_v)
        form.addRow("Кадров на лист", self.per_page)
        lay.addLayout(form)

        self.chk_storyboard = QCheckBox("Листы A4")
        self.chk_storyboard.setChecked(True)
        self.chk_contact = QCheckBox("Contact sheet")
        self.chk_only = QCheckBox("Только листы (без видео)")
        self.chk_keep = QCheckBox("Сохранить кадры")
        self.chk_keep.setChecked(True)
        for c in (self.chk_storyboard, self.chk_contact, self.chk_only, self.chk_keep):
            lay.addWidget(c)

        btn_run = QPushButton("Сделать раскадровку")
        btn_run.clicked.connect(self.run_video_job)
        lay.addWidget(btn_run)
        self.tabs.addTab(tab, "Видео → листы")

    def _build_scans_tab(self):
        tab = QWidget()
        lay = QVBoxLayout(tab)

        btn_pick = QPushButton("Добавить сканы (PDF/PNG/JPG)…")
        btn_pick.clicked.connect(self.pick_scans)
        lay.addWidget(btn_pick)

        self.scan_panel = PathListPanel()
        self.scan_panel.order_changed.connect(self._on_scan_order_changed)
        self.scan_panel.selection_changed.connect(self._preview_selected_scans)
        lay.addWidget(self.scan_panel, stretch=1)
        lay.addWidget(QLabel("Порядок = порядок кадров в ролике. Перетащите или ↑↓."))

        form = QFormLayout()
        self.fps = QSpinBox()
        self.fps.setRange(4, 30)
        self.fps.setValue(16)
        self.hold_s = QDoubleSpinBox()
        self.hold_s.setRange(0.05, 2.0)
        self.hold_s.setSingleStep(0.05)
        self.hold_s.setValue(0.1)
        self.gif_width = QSpinBox()
        self.gif_width.setRange(240, 1280)
        self.gif_width.setSingleStep(40)
        self.gif_width.setValue(720)
        self.rotate_all = QComboBox()
        for d in (0, 90, 180, 270):
            self.rotate_all.addItem(f"{d}°", d)
        self.rows = QSpinBox()
        self.rows.setRange(0, 8)
        self.rows.setValue(0)
        self.rows.setSpecialValueText("авто")

        self.order_major = QComboBox()
        self.order_major.addItem("По столбцам (↓ потом →)", "column")
        self.order_major.addItem("По рядам (→ потом ↓)", "row")
        self.order_h = QComboBox()
        self.order_h.addItem("Слева → направо", "ltr")
        self.order_h.addItem("Справа → налево", "rtl")
        self.order_v = QComboBox()
        self.order_v.addItem("Сверху → вниз", "ttb")
        self.order_v.addItem("Снизу → вверх", "btt")

        form.addRow("FPS", self.fps)
        form.addRow("Удержание (с)", self.hold_s)
        form.addRow("Ширина GIF", self.gif_width)
        form.addRow("Поворот всех", self.rotate_all)
        form.addRow("Рядов (0=авто)", self.rows)
        form.addRow("Обход сетки", self.order_major)
        form.addRow("С какого края (гориз.)", self.order_h)
        form.addRow("С какого края (верт.)", self.order_v)
        lay.addLayout(form)

        self.chk_gif = QCheckBox("Собрать GIF")
        self.chk_gif.setChecked(True)
        lay.addWidget(self.chk_gif)

        btn_run = QPushButton("Вырезать и собрать")
        btn_run.clicked.connect(self.run_scans_job)
        lay.addWidget(btn_run)
        self.tabs.addTab(tab, "Сканы → видео")

    def _build_rotate_tab(self):
        tab = QWidget()
        lay = QVBoxLayout(tab)
        lay.addWidget(
            QLabel(
                "Откройте фото, листы или видео — крутите текущий файл\n"
                "или все сразу кнопками справа в превью."
            )
        )
        btn = QPushButton("Открыть файлы для поворота…")
        btn.clicked.connect(self.open_any_media)
        lay.addWidget(btn)

        grp = QGroupBox("Быстрый поворот выбранных в списке сканов")
        g = QHBoxLayout(grp)
        b1 = QPushButton("Сканы ↻ 90°")
        b2 = QPushButton("Сканы 180°")
        b3 = QPushButton("Сканы ↺ 90°")
        b1.clicked.connect(lambda: self.rotate_scan_list(90))
        b2.clicked.connect(lambda: self.rotate_scan_list(180))
        b3.clicked.connect(lambda: self.rotate_scan_list(270))
        g.addWidget(b1)
        g.addWidget(b2)
        g.addWidget(b3)
        lay.addWidget(grp)
        lay.addStretch(1)
        self.tabs.addTab(tab, "Поворот")

    def pick_video(self):
        paths, _ = QFileDialog.getOpenFileNames(
            self,
            "Выбрать видео",
            str(Path.home()),
            "Video (*.mp4 *.mov *.avi *.mkv *.webm);;All (*.*)",
        )
        if not paths:
            return
        self.video_panel.add_paths([Path(p) for p in paths])
        self._on_video_order_changed()
        self.preview.set_paths(self.video_panel.paths())
        self.append_log(f"Видео в очереди: {len(self.video_panel.paths())}")

    def pick_scans(self):
        paths, _ = QFileDialog.getOpenFileNames(
            self,
            "Сканы листов",
            str(Path.home()),
            "Scans (*.pdf *.png *.jpg *.jpeg *.PDF *.PNG);;All (*.*)",
        )
        if not paths:
            return
        self.scan_panel.add_paths([Path(p) for p in paths])
        self._on_scan_order_changed()
        previewable = [
            p for p in self.scan_panel.paths() if p.suffix.lower() in IMAGE_SUFFIXES
        ]
        if previewable:
            self.preview.set_paths(previewable)
        self.append_log(f"Сканов: {len(self.scan_panel.paths())}")

    def _on_video_order_changed(self):
        self.video_paths = self.video_panel.paths()

    def _on_scan_order_changed(self):
        self.scan_paths = self.scan_panel.paths()

    def _preview_selected_videos(self):
        selected = self.video_panel.selected_paths()
        if selected:
            self.preview.set_paths(selected)
        elif self.video_panel.paths():
            self.preview.set_paths(self.video_panel.paths())

    def _preview_selected_scans(self):
        selected = self.scan_panel.selected_paths()
        show = [p for p in selected if p.suffix.lower() in IMAGE_SUFFIXES]
        if not show:
            show = [
                p
                for p in self.scan_panel.paths()
                if p.suffix.lower() in IMAGE_SUFFIXES
            ]
        if show:
            self.preview.set_paths(show)

    def open_any_media(self):
        paths, _ = QFileDialog.getOpenFileNames(
            self,
            "Фото / листы / видео",
            str(Path.home()),
            "Media (*.png *.jpg *.jpeg *.pdf *.mp4 *.mov *.avi *.mkv);;All (*.*)",
        )
        if not paths:
            return
        media = [Path(p) for p in paths]
        show = [p for p in media if p.suffix.lower() in IMAGE_SUFFIXES | VIDEO_SUFFIXES]
        if not show:
            show = media
        self.preview.set_paths(show)
        self.result_paths = show
        self.tabs.setCurrentIndex(2)
        self.append_log(f"Открыто для поворота: {len(show)}")

    def rotate_scan_list(self, degrees: int):
        self.scan_paths = self.scan_panel.paths()
        if not self.scan_paths:
            QMessageBox.information(self, "Поворот", "Сначала добавьте сканы.")
            return
        rotatable = [p for p in self.scan_paths if p.suffix.lower() in IMAGE_SUFFIXES]
        if not rotatable:
            QMessageBox.information(
                self,
                "Поворот",
                "В списке только PDF — поверните листы после раскадровки "
                "или откройте PNG/JPG во вкладке «Поворот».",
            )
            return
        try:
            rotate_many(rotatable, degrees, inplace=True)
            self.preview.set_paths(rotatable)
            self.append_log(f"Повернуто сканов: {len(rotatable)} × {degrees}°")
        except Exception as exc:
            QMessageBox.critical(self, "Ошибка", str(exc))

    def _set_busy(self, busy: bool):
        self.setEnabled(not busy)
        self.status.showMessage("Работаю…" if busy else "Готово")

    def run_video_job(self):
        videos = self.video_panel.paths()
        if not videos:
            QMessageBox.warning(self, "Видео", "Добавьте хотя бы одно видео.")
            return
        job_dir = Path(tempfile.mkdtemp(prefix="video_", dir=WORK))
        kwargs = dict(
            interval=self.interval.value(),
            hold=self.hold_v.value(),
            storyboard=self.chk_storyboard.isChecked(),
            contact_sheet=self.chk_contact.isChecked(),
            storyboard_only=self.chk_only.isChecked(),
            keep_frames=self.chk_keep.isChecked(),
            per_page=self.per_page.value(),
        )
        self._set_busy(True)
        self.worker = Worker(self._run_videos_ordered, videos, job_dir, kwargs)
        self.worker.finished_ok.connect(self._on_video_done)
        self.worker.failed.connect(self._on_fail)
        self.worker.start()

    @staticmethod
    def _run_videos_ordered(videos: list[Path], job_dir: Path, kwargs: dict):
        from pipeline import VideoJobResult

        merged = VideoJobResult()
        logs: list[str] = []
        for i, video in enumerate(videos, 1):
            out = job_dir / f"{i:02d}_{video.stem}"
            out.mkdir(parents=True, exist_ok=True)
            result = run_video_to_sheets(video, out, **kwargs)
            merged.videos.extend(result.videos)
            merged.storyboard_pages.extend(result.storyboard_pages)
            merged.contact_sheets.extend(result.contact_sheets)
            logs.append(f"=== {i}/{len(videos)} {video.name} ===\n{result.log}")
        merged.log = "\n\n".join(logs)
        return merged

    def _on_video_done(self, result):
        self._set_busy(False)
        self.append_log(result.log)
        paths: list[Path] = []
        paths.extend(result.storyboard_pages)
        paths.extend(result.contact_sheets)
        if result.videos:
            paths.extend(result.videos)
        self.result_paths = paths
        show = [p for p in paths if p.suffix.lower() in IMAGE_SUFFIXES]
        if not show and result.videos:
            show = result.videos
        self.preview.set_paths(show or paths)
        self.append_log("Готово. Листы/видео можно крутить в превью.")

    def run_scans_job(self):
        scans = self.scan_panel.paths()
        if not scans:
            QMessageBox.warning(self, "Сканы", "Добавьте PDF/PNG сканы.")
            return
        job_dir = Path(tempfile.mkdtemp(prefix="scans_", dir=WORK))
        from pipeline import save_uploads

        inputs = save_uploads(scans, job_dir / "inputs")
        rows = self.rows.value()
        self._set_busy(True)
        self.worker = Worker(
            run_scans_to_video,
            inputs,
            job_dir,
            fps=float(self.fps.value()),
            hold=self.hold_s.value(),
            gif_width=self.gif_width.value(),
            rotate_all=int(self.rotate_all.currentData()),
            rows=None if rows <= 0 else rows,
            make_gif=self.chk_gif.isChecked(),
            major=str(self.order_major.currentData()),
            h_dir=str(self.order_h.currentData()),
            v_dir=str(self.order_v.currentData()),
        )
        self.worker.finished_ok.connect(self._on_scans_done)
        self.worker.failed.connect(self._on_fail)
        self.worker.start()

    def _on_scans_done(self, result):
        self._set_busy(False)
        self.append_log(result.log)
        paths: list[Path] = []
        paths.extend(result.preview_frames)
        if result.gif:
            paths.append(result.gif)
        if result.video:
            paths.append(result.video)
        self.result_paths = paths
        show = [p for p in paths if p.suffix.lower() in IMAGE_SUFFIXES]
        self.preview.set_paths(show or paths)
        self.append_log("Готово. Кадры/GIF/видео крутятся кнопками справа.")

    def _on_fail(self, err: str):
        self._set_busy(False)
        self.append_log(err)
        QMessageBox.critical(self, "Ошибка", err[:800])


def main() -> int:
    app = QApplication(sys.argv)
    app.setStyle("Fusion")
    font = QFont("Arial", 11)
    app.setFont(font)

    palette = QPalette()
    palette.setColor(QPalette.ColorRole.Window, QColor(0, 0, 0))
    palette.setColor(QPalette.ColorRole.WindowText, QColor(255, 255, 255))
    palette.setColor(QPalette.ColorRole.Base, QColor(10, 10, 10))
    palette.setColor(QPalette.ColorRole.Text, QColor(255, 255, 255))
    palette.setColor(QPalette.ColorRole.Button, QColor(255, 255, 255))
    palette.setColor(QPalette.ColorRole.ButtonText, QColor(0, 0, 0))
    palette.setColor(QPalette.ColorRole.Highlight, QColor(255, 255, 255))
    palette.setColor(QPalette.ColorRole.HighlightedText, QColor(0, 0, 0))
    app.setPalette(palette)
    app.setStyleSheet(STYLE)

    win = MainWindow()
    win.show()
    return app.exec()


if __name__ == "__main__":
    raise SystemExit(main())
