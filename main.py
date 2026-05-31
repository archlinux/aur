import os
import shutil
import subprocess
import sys
import tempfile

import fitz  # PyMuPDF
from PyQt6.QtCore import QDir, QModelIndex, Qt, QTimer
from PyQt6.QtGui import (
    QFileSystemModel,
    QFont,
    QImage,
    QKeySequence,
    QPixmap,
    QShortcut,
    QTextCursor,
    QTextDocument,
)
from PyQt6.QtWidgets import (
    QApplication,
    QComboBox,
    QDialog,
    QHBoxLayout,
    QLabel,
    QLineEdit,
    QListView,
    QMainWindow,
    QMessageBox,
    QPlainTextEdit,
    QPushButton,
    QScrollArea,
    QSplitter,
    QStackedWidget,
    QVBoxLayout,
    QWidget,
)

# --- THEME ENGINE ---


def get_standard_css(
    bg_main,
    bg_alt,
    bg_hover,
    fg_main,
    fg_dim,
    accent,
    accent_hover,
    accent_text,
    border,
):
    return f"""
    QMainWindow, QDialog, QStackedWidget {{ background-color: {bg_main}; color: {fg_main}; }}
    QLabel {{ color: {fg_main}; font-weight: bold; }}
    QLabel#WelcomeTitle {{ font-size: 45px; color: {accent}; }}
    QLabel#WelcomeSubtitle {{ font-size: 16px; color: {fg_dim}; }}
    QLabel#ExplorerTitle {{ font-size: 24px; color: {accent}; padding: 10px; }}
    
    QPushButton {{
        background-color: {bg_alt}; color: {fg_main}; border: 1px solid {border};
        padding: 10px; border-radius: 6px; font-weight: bold;
    }}
    QPushButton:hover {{ background-color: {bg_hover}; }}
    QPushButton:pressed {{ background-color: {accent}; color: {accent_text}; }}
    
    QPushButton.SidebarBtn {{ background-color: transparent; border: none; text-align: left; padding: 12px; }}
    QPushButton.SidebarBtn:hover {{ background-color: {bg_hover}; color: {accent}; }}
    
    QPushButton.FindBtn {{ padding: 6px 10px; border-radius: 4px; font-size: 12px; }}
    
    QPushButton#WelcomeBtnNew, QPushButton#WelcomeBtnOpen, QPushButton#DialogBtnAction {{
        font-size: 16px; padding: 15px 30px; background-color: {accent}; color: {accent_text}; border: none;
    }}
    QPushButton#WelcomeBtnNew:hover, QPushButton#WelcomeBtnOpen:hover, QPushButton#DialogBtnAction:hover {{
        background-color: {accent_hover};
    }}

    QLineEdit {{ background-color: {bg_alt}; color: {fg_main}; border: 1px solid {border}; padding: 10px; border-radius: 4px; }}
    QLineEdit:focus {{ border: 1px solid {accent}; }}
    QLineEdit#FindInput {{ padding: 6px; border-radius: 4px; }}
    
    QListView {{ background-color: {bg_alt}; color: {fg_main}; border: 1px solid {border}; border-radius: 6px; outline: none; padding: 5px; }}
    QListView::item {{ padding: 10px; border-radius: 4px; }}
    QListView::item:selected {{ background-color: {accent}; color: {accent_text}; }}
    QListView::item:hover:!selected {{ background-color: {bg_hover}; }}
    
    QSplitter::handle {{ background-color: {border}; width: 2px; }}
    QWidget#Sidebar {{ background-color: {bg_alt}; border-right: 1px solid {border}; }}
    QWidget#Toolbar {{ background-color: {bg_alt}; border-bottom: 1px solid {border}; }}
    QWidget#FindBar {{ background-color: {bg_alt}; border-bottom: 1px solid {border}; }}
    
    QPlainTextEdit {{
        background-color: {bg_main}; color: {fg_main}; border: none; padding: 15px;
        selection-background-color: {accent}; selection-color: {accent_text}; font-size: 14px;
    }}
    
    QScrollArea {{ background-color: {bg_main}; border: none; }}
    QLabel#PdfPage {{ background-color: white; border: 1px solid {border}; margin: 20px; }}
    
    QLabel#StatusLabel {{ padding: 8px; font-weight: bold; border-top: 1px solid {border}; font-size: 12px; }}
    QLabel#StatusLabel[state="normal"] {{ background-color: {bg_alt}; color: {fg_dim}; }}
    QLabel#StatusLabel[state="working"] {{ background-color: {accent}; color: {accent_text}; }}
    QLabel#StatusLabel[state="success"] {{ background-color: #4caf50; color: #ffffff; }}
    QLabel#StatusLabel[state="warning"] {{ background-color: #ff9800; color: #ffffff; }}
    QLabel#StatusLabel[state="error"] {{ background-color: #f44336; color: #ffffff; }}

    QComboBox {{ background-color: {bg_alt}; color: {fg_main}; border: 1px solid {border}; padding: 8px; border-radius: 4px; font-weight: bold; }}
    QComboBox::drop-down {{ border: none; }}
    QComboBox QAbstractItemView {{ background-color: {bg_alt}; color: {fg_main}; selection-background-color: {accent}; }}
    """


THEMES = {
    "Tokyo Night": get_standard_css(
        bg_main="#1a1b26",
        bg_alt="#16161e",
        bg_hover="#292e42",
        fg_main="#c0caf5",
        fg_dim="#565f89",
        accent="#7aa2f7",
        accent_hover="#8db0f7",
        accent_text="#16161e",
        border="#24283b",
    ),
    "Dark": get_standard_css(
        bg_main="#1e1e1e",
        bg_alt="#252526",
        bg_hover="#3e3e42",
        fg_main="#cccccc",
        fg_dim="#808080",
        accent="#007acc",
        accent_hover="#0098ff",
        accent_text="#ffffff",
        border="#333333",
    ),
    "Light": get_standard_css(
        bg_main="#ffffff",
        bg_alt="#f3f3f3",
        bg_hover="#e1e1e1",
        fg_main="#111111",
        fg_dim="#666666",
        accent="#0078d4",
        accent_hover="#2b88d8",
        accent_text="#ffffff",
        border="#cccccc",
    ),
    "Green": get_standard_css(
        bg_main="#0f1712",
        bg_alt="#16221a",
        bg_hover="#233629",
        fg_main="#e2f0e6",
        fg_dim="#8ba895",
        accent="#4caf50",
        accent_hover="#66bb6a",
        accent_text="#ffffff",
        border="#1f3025",
    ),
    "Neobrutalism": """
        QMainWindow, QDialog, QStackedWidget { background-color: #F4F0EA; color: #000000; }
        QLabel { color: #000000; font-weight: 900; }
        QLabel#WelcomeTitle { font-size: 55px; letter-spacing: -2px; }
        QLabel#WelcomeSubtitle { font-size: 18px; }
        QLabel#ExplorerTitle { font-size: 24px; background-color: #FF90E8; border: 3px solid #000000; border-right: 6px solid #000000; border-bottom: 6px solid #000000; padding: 10px 20px; margin-bottom: 15px; }
        
        QPushButton { background-color: #FFDE59; color: #000000; font-size: 15px; font-weight: 900; border: 3px solid #000000; border-right: 6px solid #000000; border-bottom: 6px solid #000000; padding: 12px 20px; }
        QPushButton:hover { background-color: #42E6A4; }
        QPushButton:pressed { background-color: #00C4CC; border-right: 2px solid #000000; border-bottom: 2px solid #000000; margin-top: 4px; margin-left: 4px; }
        
        QPushButton.SidebarBtn { background-color: #FFFFFF; text-align: left; margin-bottom: 8px; }
        QPushButton#SidebarBtnNew { background-color: #42E6A4; }
        QPushButton#SidebarBtnOpen { background-color: #FFDE59; }
        QPushButton#SidebarBtnSave { background-color: #FF90E8; }
        QPushButton#SidebarBtnPdf { background-color: #00C4CC; }
        
        QPushButton.FindBtn { padding: 5px 15px; font-size: 12px; }
        
        QPushButton#WelcomeBtnNew { background-color: #42E6A4; font-size: 18px; padding: 20px 40px; }
        QPushButton#WelcomeBtnOpen, QPushButton#DialogBtnAction { background-color: #FF90E8; font-size: 18px; padding: 20px 40px; }
        
        QLineEdit { background-color: #FFFFFF; color: #000000; border: 3px solid #000000; border-right: 5px solid #000000; border-bottom: 5px solid #000000; padding: 12px; font-size: 15px; font-weight: 900; }
        QLineEdit:focus { background-color: #E0F7FA; outline: none; }
        QLineEdit#FindInput { padding: 6px; }
        
        QListView { background-color: #FFFFFF; color: #000000; border: 3px solid #000000; border-right: 7px solid #000000; border-bottom: 7px solid #000000; font-size: 15px; font-weight: bold; padding: 5px; outline: none; }
        QListView::item { padding: 12px; border-bottom: 2px solid #000000; }
        QListView::item:selected { background-color: #B794F4; color: #000000; border: 3px solid #000000; }
        QListView::item:hover:!selected { background-color: #FFDE59; }
        
        QSplitter::handle { background-color: #000000; width: 6px; }
        QWidget#Sidebar { background-color: #F4F0EA; border-right: 6px solid #000000; }
        QWidget#Toolbar { background-color: #F4F0EA; border-bottom: 6px solid #000000; }
        QWidget#FindBar { background-color: #F4F0EA; border-bottom: 6px solid #000000; }
        
        QPlainTextEdit { background-color: #FFFFFF; color: #000000; border: none; padding: 15px; font-size: 15px; font-weight: bold; selection-background-color: #FF90E8; selection-color: #000000; }
        QScrollArea { background-color: #F4F0EA; border: none; }
        QLabel#PdfPage { background-color: #FFFFFF; border: 3px solid #000000; border-right: 10px solid #000000; border-bottom: 10px solid #000000; margin: 20px; }
        
        QLabel#StatusLabel { font-weight: 900; padding: 12px; font-size: 13px; border-top: 5px solid #000000; color: #000000; }
        QLabel#StatusLabel[state="normal"] { background-color: #FFFFFF; }
        QLabel#StatusLabel[state="working"] { background-color: #FFDE59; }
        QLabel#StatusLabel[state="success"] { background-color: #42E6A4; }
        QLabel#StatusLabel[state="warning"] { background-color: #FF90E8; }
        QLabel#StatusLabel[state="error"] { background-color: #FF5A5A; }
        
        QComboBox { background-color: #FFFFFF; color: #000000; border: 3px solid #000000; border-right: 5px solid #000000; border-bottom: 5px solid #000000; padding: 8px; font-weight: 900; }
        QComboBox::drop-down { border: none; }
        QComboBox QAbstractItemView { background-color: #FFFFFF; color: #000000; selection-background-color: #42E6A4; }
    """,
}


# --- CUSTOM FILE EXPLORER DIALOG ---
class CustomFileDialog(QDialog):
    def __init__(self, mode="open", extension=".tex", parent=None):
        super().__init__(parent)
        self.mode = mode
        self.extension = extension
        self.selected_path = None

        self.setWindowTitle(
            f"{'Open' if mode == 'open' else 'Save'} File ({extension})"
        )
        self.resize(800, 600)

        layout = QVBoxLayout(self)
        layout.setSpacing(15)
        layout.setContentsMargins(20, 20, 20, 20)

        title = QLabel(f" {'📂 OPEN FILE' if mode == 'open' else '💾 SAVE FILE'} ")
        title.setObjectName("ExplorerTitle")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        path_layout = QHBoxLayout()
        btn_up = QPushButton("⬆ UP DIR")
        btn_up.clicked.connect(self.go_up)

        self.path_edit = QLineEdit()
        self.path_edit.setReadOnly(True)

        path_layout.addWidget(btn_up)
        path_layout.addWidget(self.path_edit)
        layout.addLayout(path_layout)

        self.model = QFileSystemModel()
        self.model.setRootPath("")

        if self.mode == "open":
            self.model.setNameFilters([f"*{self.extension}"])
            self.model.setNameFilterDisables(False)

        self.list_view = QListView()
        self.list_view.setModel(self.model)
        self.list_view.setRootIndex(self.model.index(QDir.homePath()))
        self.path_edit.setText(QDir.homePath())

        self.list_view.doubleClicked.connect(self.on_double_click)
        self.list_view.clicked.connect(self.on_single_click)
        layout.addWidget(self.list_view)

        bottom_layout = QHBoxLayout()
        self.name_input = QLineEdit()

        if self.mode == "save":
            self.name_input.setPlaceholderText("Enter file name (e.g. my_document)")
        else:
            self.name_input.setPlaceholderText("Select a file from the list above...")
            self.name_input.setReadOnly(True)

        btn_action = QPushButton("SAVE IT!" if mode == "save" else "OPEN IT!")
        btn_action.setObjectName("DialogBtnAction")
        btn_action.clicked.connect(self.accept_action)

        bottom_layout.addWidget(self.name_input)
        bottom_layout.addWidget(btn_action)
        layout.addLayout(bottom_layout)

    def go_up(self):
        current_dir = QDir(self.model.filePath(self.list_view.rootIndex()))
        if current_dir.cdUp():
            new_index = self.model.index(current_dir.absolutePath())
            self.list_view.setRootIndex(new_index)
            self.path_edit.setText(current_dir.absolutePath())

    def on_single_click(self, index: QModelIndex):
        if not self.model.isDir(index):
            file_name = self.model.fileName(index)
            if self.mode == "save" and file_name.endswith(self.extension):
                file_name = file_name.replace(self.extension, "")
            self.name_input.setText(file_name)

    def on_double_click(self, index: QModelIndex):
        if self.model.isDir(index):
            self.list_view.setRootIndex(index)
            self.path_edit.setText(self.model.filePath(index))
        else:
            self.accept_action()

    def accept_action(self):
        current_folder = self.path_edit.text()
        input_name = self.name_input.text().strip()

        if not input_name and self.mode == "save":
            QMessageBox.warning(self, "Warning", "Please enter a file name.")
            return

        if self.mode == "save":
            if not input_name.endswith(self.extension):
                input_name += self.extension
        else:
            if not input_name:
                return
            if not input_name.endswith(self.extension):
                input_name += self.extension

        self.selected_path = os.path.join(current_folder, input_name)
        self.accept()


# --- MAIN APPLICATION ---
class SuyoraTexApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("SuyoraTex - Multi-Theme LaTeX Editor")
        self.resize(1350, 850)

        self.current_file = None
        self.temp_dir = tempfile.TemporaryDirectory()
        self.live_tex_file = os.path.join(self.temp_dir.name, "live_preview.tex")
        self.pdf_file = os.path.join(self.temp_dir.name, "live_preview.pdf")

        self.zoom_factor = 2.0
        self.compile_timer = QTimer()
        self.compile_timer.setSingleShot(True)
        self.compile_timer.setInterval(800)
        self.compile_timer.timeout.connect(self.compile_latex)

        self.init_ui()
        self.init_shortcuts()

        self.change_theme("Tokyo Night")

    def init_ui(self):
        self.stacked_widget = QStackedWidget()
        self.setCentralWidget(self.stacked_widget)
        self.setup_welcome_page()
        self.setup_workspace_page()
        self.stacked_widget.setCurrentIndex(0)

    def setup_welcome_page(self):
        self.welcome_page = QWidget()
        layout = QVBoxLayout(self.welcome_page)

        top_bar = QHBoxLayout()
        top_bar.addStretch()
        self.theme_combo_welcome = QComboBox()
        self.theme_combo_welcome.addItems(THEMES.keys())
        self.theme_combo_welcome.currentTextChanged.connect(self.change_theme)
        top_bar.addWidget(QLabel("🎨 Theme:"))
        top_bar.addWidget(self.theme_combo_welcome)
        layout.addLayout(top_bar)

        layout.addStretch()

        title = QLabel("SuyoraTex Editor")
        title.setObjectName("WelcomeTitle")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)

        subtitle = QLabel("A fast, live-preview LaTeX editor with dynamic themes.")
        subtitle.setObjectName("WelcomeSubtitle")
        subtitle.setAlignment(Qt.AlignmentFlag.AlignCenter)

        btn_new = QPushButton("📝 CREATE NEW")
        btn_new.setObjectName("WelcomeBtnNew")
        btn_new.clicked.connect(self.action_new_file)

        btn_open = QPushButton("📂 OPEN FILE")
        btn_open.setObjectName("WelcomeBtnOpen")
        btn_open.clicked.connect(self.action_open_file)

        layout.addWidget(title)
        layout.addWidget(subtitle)
        layout.addSpacing(60)

        btn_layout = QHBoxLayout()
        btn_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
        btn_layout.setSpacing(40)
        btn_layout.addWidget(btn_new)
        btn_layout.addWidget(btn_open)

        layout.addLayout(btn_layout)
        layout.addStretch()

        self.stacked_widget.addWidget(self.welcome_page)

    def setup_workspace_page(self):
        self.workspace_page = QWidget()
        self.root_splitter = QSplitter(Qt.Orientation.Horizontal, self.workspace_page)
        main_page_layout = QVBoxLayout(self.workspace_page)
        main_page_layout.setContentsMargins(0, 0, 0, 0)
        main_page_layout.addWidget(self.root_splitter)

        # --- SIDEBAR ---
        sidebar = QWidget()
        sidebar.setObjectName("Sidebar")
        sidebar.setMinimumWidth(160)
        sidebar_layout = QVBoxLayout(sidebar)
        sidebar_layout.setContentsMargins(15, 20, 15, 20)
        sidebar_layout.setSpacing(10)

        def make_sidebar_btn(text, obj_name, callback):
            btn = QPushButton(text)
            btn.setProperty("class", "SidebarBtn")
            btn.setObjectName(obj_name)
            btn.clicked.connect(callback)
            sidebar_layout.addWidget(btn)

        make_sidebar_btn("🏠 HOME", "SidebarBtnHome", self.action_close_to_home)
        make_sidebar_btn("📝 NEW", "SidebarBtnNew", self.action_new_file)
        make_sidebar_btn("📂 OPEN", "SidebarBtnOpen", self.action_open_file)
        make_sidebar_btn("💾 SAVE", "SidebarBtnSave", self.action_save_file)
        make_sidebar_btn("🖨️ PDF", "SidebarBtnPdf", self.action_export_pdf)

        sidebar_layout.addStretch()

        self.theme_combo_side = QComboBox()
        self.theme_combo_side.addItems(THEMES.keys())
        self.theme_combo_side.currentTextChanged.connect(self.change_theme)
        sidebar_layout.addWidget(QLabel("🎨 Theme:"))
        sidebar_layout.addWidget(self.theme_combo_side)

        self.root_splitter.addWidget(sidebar)

        # --- WORKSPACE ---
        self.workspace_splitter = QSplitter(Qt.Orientation.Horizontal)

        # --- EDITOR PANEL ---
        editor_panel = QWidget()
        editor_layout = QVBoxLayout(editor_panel)
        editor_layout.setContentsMargins(0, 0, 0, 0)
        editor_layout.setSpacing(0)

        # FIND BAR (Hidden by default)
        self.find_bar = QWidget()
        self.find_bar.setObjectName("FindBar")
        find_layout = QHBoxLayout(self.find_bar)
        find_layout.setContentsMargins(10, 5, 10, 5)

        self.find_input = QLineEdit()
        self.find_input.setObjectName("FindInput")
        self.find_input.setPlaceholderText("Find text...")
        self.find_input.returnPressed.connect(
            self.find_next
        )  # Pressing Enter finds next

        btn_find_prev = QPushButton("▲ Prev")
        btn_find_prev.setProperty("class", "FindBtn")
        btn_find_prev.clicked.connect(self.find_prev)

        btn_find_next = QPushButton("▼ Next")
        btn_find_next.setProperty("class", "FindBtn")
        btn_find_next.clicked.connect(self.find_next)

        btn_find_close = QPushButton("✖")
        btn_find_close.setProperty("class", "FindBtn")
        btn_find_close.clicked.connect(self.hide_find_bar)

        find_layout.addWidget(QLabel("🔍"))
        find_layout.addWidget(self.find_input)
        find_layout.addWidget(btn_find_prev)
        find_layout.addWidget(btn_find_next)
        find_layout.addWidget(btn_find_close)

        self.find_bar.hide()  # Hidden initially
        editor_layout.addWidget(self.find_bar)

        # Text Editor
        self.editor = QPlainTextEdit()
        font = QFont("Monospace", 13)
        font.setStyleHint(QFont.StyleHint.Monospace)
        self.editor.setFont(font)
        self.editor.setLineWrapMode(QPlainTextEdit.LineWrapMode.WidgetWidth)
        self.editor.textChanged.connect(self.on_text_changed)

        self.status_bar = QLabel("READY.")
        self.status_bar.setObjectName("StatusLabel")
        self.set_status_state("READY.", "normal")

        editor_layout.addWidget(self.editor)
        editor_layout.addWidget(self.status_bar)
        self.workspace_splitter.addWidget(editor_panel)

        # --- PDF VIEWER PANEL ---
        pdf_panel = QWidget()
        pdf_layout = QVBoxLayout(pdf_panel)
        pdf_layout.setContentsMargins(0, 0, 0, 0)
        pdf_layout.setSpacing(0)

        toolbar = QWidget()
        toolbar.setObjectName("Toolbar")
        toolbar_layout = QHBoxLayout(toolbar)
        toolbar_layout.setContentsMargins(15, 10, 15, 10)

        btn_out = QPushButton("ZOOM -")
        btn_out.clicked.connect(self.zoom_out)
        btn_reset = QPushButton("RESET")
        btn_reset.clicked.connect(self.zoom_reset)
        btn_in = QPushButton("ZOOM +")
        btn_in.clicked.connect(self.zoom_in)

        toolbar_layout.addWidget(btn_out)
        toolbar_layout.addWidget(btn_reset)
        toolbar_layout.addWidget(btn_in)
        toolbar_layout.addStretch()

        pdf_layout.addWidget(toolbar)

        self.scroll_area = QScrollArea()
        self.scroll_area.setWidgetResizable(True)
        self.scroll_area.setAlignment(Qt.AlignmentFlag.AlignHCenter)

        self.pdf_container = QWidget()
        self.pdf_content_layout = QVBoxLayout(self.pdf_container)
        self.pdf_content_layout.setAlignment(
            Qt.AlignmentFlag.AlignTop | Qt.AlignmentFlag.AlignHCenter
        )
        self.scroll_area.setWidget(self.pdf_container)

        pdf_layout.addWidget(self.scroll_area)
        self.workspace_splitter.addWidget(pdf_panel)

        self.workspace_splitter.setSizes([600, 600])
        self.root_splitter.addWidget(self.workspace_splitter)
        self.root_splitter.setSizes([180, 1200])

        self.stacked_widget.addWidget(self.workspace_page)

    def init_shortcuts(self):
        # Global Shortcuts
        QShortcut(QKeySequence("Ctrl+="), self).activated.connect(self.zoom_in)
        QShortcut(QKeySequence("Ctrl++"), self).activated.connect(self.zoom_in)
        QShortcut(QKeySequence("Ctrl+-"), self).activated.connect(self.zoom_out)
        QShortcut(QKeySequence("Ctrl+0"), self).activated.connect(self.zoom_reset)
        QShortcut(QKeySequence("Ctrl+S"), self).activated.connect(self.action_save_file)
        QShortcut(QKeySequence("Ctrl+P"), self).activated.connect(
            self.action_export_pdf
        )

        # Find Shortcuts
        QShortcut(QKeySequence("Ctrl+F"), self).activated.connect(self.show_find_bar)

        # Pressing Escape inside the find input closes it
        shortcut_esc = QShortcut(QKeySequence("Esc"), self.find_input)
        shortcut_esc.setContext(Qt.ShortcutContext.WidgetShortcut)
        shortcut_esc.activated.connect(self.hide_find_bar)

    # --- FIND FUNCTIONALITY ---
    def show_find_bar(self):
        if self.stacked_widget.currentIndex() == 1:
            self.find_bar.show()
            self.find_input.setFocus()
            self.find_input.selectAll()

    def hide_find_bar(self):
        self.find_bar.hide()
        self.editor.setFocus()

    def execute_find(self, backward=False):
        text = self.find_input.text()
        if not text:
            return

        options = QTextDocument.FindFlag(0)  # No flags = forward search
        if backward:
            options |= QTextDocument.FindFlag.FindBackward

        found = self.editor.find(text, options)

        # If we hit the end/beginning of the document, wrap around
        if not found:
            cursor = self.editor.textCursor()
            if backward:
                cursor.movePosition(QTextCursor.MoveOperation.End)
            else:
                cursor.movePosition(QTextCursor.MoveOperation.Start)
            self.editor.setTextCursor(cursor)
            self.editor.find(text, options)  # Try searching once more after wrap

    def find_next(self):
        self.execute_find(backward=False)

    def find_prev(self):
        self.execute_find(backward=True)

    # --- THEMES & FILE IO ---
    def change_theme(self, theme_name):
        if theme_name in THEMES:
            QApplication.instance().setStyleSheet(THEMES[theme_name])

            self.theme_combo_welcome.blockSignals(True)
            self.theme_combo_side.blockSignals(True)
            self.theme_combo_welcome.setCurrentText(theme_name)
            self.theme_combo_side.setCurrentText(theme_name)
            self.theme_combo_welcome.blockSignals(False)
            self.theme_combo_side.blockSignals(False)

    def set_status_state(self, text, state="normal"):
        self.status_bar.setText(text)
        self.status_bar.setProperty("state", state)
        self.status_bar.style().unpolish(self.status_bar)
        self.status_bar.style().polish(self.status_bar)

    def action_new_file(self):
        self.current_file = None
        self.editor.blockSignals(True)
        self.editor.setPlainText(self.get_default_latex())
        self.editor.blockSignals(False)
        self.stacked_widget.setCurrentIndex(1)
        self.setWindowTitle("SuyoraTex - UNTITLED")
        self.compile_latex()

    def action_open_file(self):
        dialog = CustomFileDialog(mode="open", extension=".tex", parent=self)
        if dialog.exec() == QDialog.DialogCode.Accepted and dialog.selected_path:
            try:
                with open(dialog.selected_path, "r", encoding="utf-8") as f:
                    content = f.read()
                self.current_file = dialog.selected_path
                self.editor.blockSignals(True)
                self.editor.setPlainText(content)
                self.editor.blockSignals(False)
                self.stacked_widget.setCurrentIndex(1)
                self.setWindowTitle(
                    f"SuyoraTex - {os.path.basename(self.current_file)}"
                )
                self.compile_latex()
            except Exception as e:
                QMessageBox.critical(self, "ERROR", f"Could not open file:\n{e}")

    def action_save_file(self):
        if self.stacked_widget.currentIndex() != 1:
            return

        if not self.current_file:
            dialog = CustomFileDialog(mode="save", extension=".tex", parent=self)
            if dialog.exec() == QDialog.DialogCode.Accepted and dialog.selected_path:
                self.current_file = dialog.selected_path
            else:
                return

        try:
            with open(self.current_file, "w", encoding="utf-8") as f:
                f.write(self.editor.toPlainText())
            self.setWindowTitle(f"SuyoraTex - {os.path.basename(self.current_file)}")
            self.set_status_state(f"SUCCESS: SAVED AT {self.current_file}", "success")
        except Exception as e:
            QMessageBox.critical(self, "ERROR", f"Could not save file:\n{e}")

    def action_export_pdf(self):
        if self.stacked_widget.currentIndex() != 1:
            return
        if not os.path.exists(self.pdf_file):
            QMessageBox.warning(self, "WARNING", "No compiled PDF exists yet.")
            return

        dialog = CustomFileDialog(mode="save", extension=".pdf", parent=self)
        if dialog.exec() == QDialog.DialogCode.Accepted and dialog.selected_path:
            try:
                shutil.copy(self.pdf_file, dialog.selected_path)
                self.set_status_state(
                    f"SUCCESS: EXPORTED TO {dialog.selected_path}", "success"
                )
                QMessageBox.information(
                    self, "SUCCESS", f"PDF Exported:\n{dialog.selected_path}"
                )
            except Exception as e:
                QMessageBox.critical(self, "ERROR", f"Could not export PDF:\n{e}")

    def action_close_to_home(self):
        self.stacked_widget.setCurrentIndex(0)
        self.setWindowTitle("SuyoraTex Editor")

    def on_text_changed(self):
        self.set_status_state("WAITING TO COMPILE...", "working")
        self.compile_timer.start()

    def compile_latex(self):
        self.set_status_state("COMPILING...", "working")
        QApplication.processEvents()

        latex_code = self.editor.toPlainText()
        with open(self.live_tex_file, "w", encoding="utf-8") as f:
            f.write(latex_code)

        working_dir = (
            os.path.dirname(self.current_file)
            if self.current_file
            else self.temp_dir.name
        )
        command = [
            "pdflatex",
            "-interaction=nonstopmode",
            "-output-directory",
            self.temp_dir.name,
            self.live_tex_file,
        ]

        try:
            result = subprocess.run(
                command,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                cwd=working_dir,
            )
            if os.path.exists(self.pdf_file):
                self.render_pdf()
                if result.returncode == 0:
                    self.set_status_state("SUCCESS: COMPILED CLEANLY.", "success")
                else:
                    self.set_status_state(
                        "WARNING: COMPILED WITH SYNTAX ERRORS.", "warning"
                    )
            else:
                self.set_status_state("FATAL: COMPILATION FAILED.", "error")
        except Exception as e:
            self.set_status_state(f"SYSTEM ERROR: {str(e)}", "error")

    def render_pdf(self):
        for i in reversed(range(self.pdf_content_layout.count())):
            widget = self.pdf_content_layout.itemAt(i).widget()
            self.pdf_content_layout.removeWidget(widget)
            widget.setParent(None)
        try:
            doc = fitz.open(self.pdf_file)
            for page_num in range(len(doc)):
                page = doc.load_page(page_num)
                matrix = fitz.Matrix(self.zoom_factor, self.zoom_factor)
                pix = page.get_pixmap(matrix=matrix, alpha=False)

                img = QImage(
                    pix.samples,
                    pix.width,
                    pix.height,
                    pix.stride,
                    QImage.Format.Format_RGB888,
                )
                page_label = QLabel()
                page_label.setObjectName("PdfPage")
                page_label.setPixmap(QPixmap.fromImage(img))
                self.pdf_content_layout.addWidget(page_label)
            doc.close()
        except Exception as e:
            pass

    def zoom_in(self):
        if self.stacked_widget.currentIndex() == 1 and self.zoom_factor < 8.0:
            self.zoom_factor *= 1.2
            if os.path.exists(self.pdf_file):
                self.render_pdf()

    def zoom_out(self):
        if self.stacked_widget.currentIndex() == 1 and self.zoom_factor > 0.5:
            self.zoom_factor /= 1.2
            if os.path.exists(self.pdf_file):
                self.render_pdf()

    def zoom_reset(self):
        if self.stacked_widget.currentIndex() == 1:
            self.zoom_factor = 2.0
            if os.path.exists(self.pdf_file):
                self.render_pdf()

    def get_default_latex(self):
        return r"""\documentclass[12pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{xcolor}
\usepackage{amsmath}

\begin{document}

\begin{center}
    \Huge \textbf{SuyoraTex Editor}
\end{center}

\vspace{1cm}

\noindent \textbf{New Feature Added: Find Text!} \\
Press \texttt{Ctrl + F} on your keyboard right now to open the search bar at the top of the editor.

\vspace{0.5cm}

\noindent \textbf{How to use the Find bar:}
\begin{itemize}
    \item Type what you are looking for.
    \item Press \texttt{Enter} to instantly jump to the next matching word.
    \item Use the \textbf{Prev} / \textbf{Next} buttons to navigate.
    \item Press \texttt{Esc} while in the search box to close it and return to the editor.
    \item It even loops around the document automatically!
\end{itemize}

\vspace{1cm}

\begin{equation}
    f(x) = \int_{-\infty}^{\infty} \hat{f}(\xi)\,e^{2 \pi i \xi x} \,d\xi
\end{equation}

\end{document}
"""

    def closeEvent(self, event):
        self.temp_dir.cleanup()
        super().closeEvent(event)


if __name__ == "__main__":
    os.environ["QT_QPA_PLATFORM"] = "wayland;xcb"
    app = QApplication(sys.argv)
    window = SuyoraTexApp()
    window.show()
    sys.exit(app.exec())
