# coding=utf-8
import sys
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QLineEdit, QVBoxLayout, QWidget,
    QToolBar, QStatusBar, QTabWidget, QStyleFactory, QDialog,
    QLabel, QPushButton, QHBoxLayout, QGroupBox, QComboBox, QProgressBar,
    QTabBar, QToolButton, QMessageBox
)
from PyQt6.QtCore import QUrl, QSize, Qt, QSettings
from PyQt6.QtGui import QAction, QIcon, QFont, QCloseEvent, QPixmap, QImage, QPainter, QBrush, QColor
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineProfile


class SettingsDialog(QDialog):
    """
    Класс для окна настроек браузера.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Настройки Daniella Browser")
        self.setMinimumSize(400, 200)

        self.settings = QSettings("Daniella Browser", "Browser")

        main_layout = QVBoxLayout()
        self.setLayout(main_layout)

        homepage_group = QGroupBox("Домашняя страница")
        homepage_layout = QVBoxLayout()
        self.homepage_edit = QLineEdit(self.settings.value("homepage", "https://www.google.com"))
        homepage_layout.addWidget(self.homepage_edit)
        homepage_group.setLayout(homepage_layout)
        main_layout.addWidget(homepage_group)

        data_group = QGroupBox("Данные браузера")
        data_layout = QVBoxLayout()
        clear_cache_btn = QPushButton("Очистить кэш и куки")
        clear_cache_btn.clicked.connect(self.clear_cache)
        data_layout.addWidget(clear_cache_btn)
        data_group.setLayout(data_layout)
        main_layout.addWidget(data_group)

        appearance_group = QGroupBox("Настройки внешнего вида")
        appearance_layout = QHBoxLayout()
        theme_label = QLabel("Тема:")
        self.theme_combo = QComboBox()
        self.theme_combo.addItems(["Светлая", "Тёмная"])
        current_theme = self.settings.value("theme", "Светлая")
        self.theme_combo.setCurrentText(current_theme)
        appearance_layout.addWidget(theme_label)
        appearance_layout.addWidget(self.theme_combo)
        appearance_group.setLayout(appearance_layout)
        main_layout.addWidget(appearance_group)

        button_layout = QHBoxLayout()
        save_button = QPushButton("Сохранить")
        save_button.clicked.connect(self.save_settings)
        cancel_button = QPushButton("Отмена")
        cancel_button.clicked.connect(self.reject)
        button_layout.addStretch()
        button_layout.addWidget(save_button)
        button_layout.addWidget(cancel_button)
        main_layout.addLayout(button_layout)

    def save_settings(self):
        self.settings.setValue("homepage", self.homepage_edit.text())
        self.settings.setValue("theme", self.theme_combo.currentText())
        self.accept()

    def clear_cache(self):
        QWebEngineProfile.defaultProfile().clearHttpCache()
        QWebEngineProfile.defaultProfile().clearAllVisitedLinks()
        QWebEngineProfile.defaultProfile().cookieStore().deleteAllCookies()
        self.parent().statusBar().showMessage("Кэш, история и куки очищены!", 3000)


class UrlBarWithIcon(QLineEdit):
    """
    Кастомный виджет QLineEdit для адресной строки, который может отображать иконку
    внутри себя, не смещая текст.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self._icon = QIcon()
        self.setTextMargins(25, 1, 1, 1)

    def set_icon(self, icon):
        """Устанавливает иконку для отображения."""
        self._icon = icon
        self.repaint()

    def paintEvent(self, event):
        """Отрисовывает иконку и остальное содержимое."""
        super().paintEvent(event)
        if not self._icon.isNull():
            painter = QPainter(self)
            painter.setRenderHint(QPainter.RenderHint.Antialiasing)
            pixmap = self._icon.pixmap(QSize(16, 16))
            icon_rect = pixmap.rect()
            x = 4
            y = (self.height() - icon_rect.height()) // 2
            painter.drawPixmap(x, y, pixmap)


def create_svg_icon(path, color, size):
    """Создает QIcon из SVG строки."""
    svg_data = f"""<svg xmlns="http://www.w3.org/2000/svg" width="{size}" height="{size}" viewBox="0 0 24 24"><path fill="{color}" d="{path}"/></svg>"""
    return QIcon(QPixmap.fromImage(QImage.fromData(svg_data.encode())))


def create_loading_icon(color):
    """Создает анимированный SVG-кружок для индикатора загрузки."""
    loading_color = "#3498db"
    if color == "#cccccc":
        loading_color = "#3498db"

    static_loading_svg = f"""<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
        <circle cx="12" cy="12" r="10" stroke="{loading_color}" stroke-width="2" fill="none" stroke-dasharray="10 50" />
    </svg>"""
    return QIcon(QPixmap.fromImage(QImage.fromData(static_loading_svg.encode())))


class CustomTabBar(QTabBar):
    """Кастомный класс QTabBar для ручной настройки кнопок закрытия."""
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setTabsClosable(True)
        self.setMovable(True)
        self.close_buttons = {}
        self.tabBarClicked.connect(self._handle_tab_bar_clicked)

    def _handle_tab_bar_clicked(self, index):
        """Обрабатывает клики по вкладке и передает их в основное окно."""
        # Этот метод больше не нужен, так как мы создаем кнопку закрытия напрямую
        pass

    def tabInserted(self, index):
        """
        Метод, который вызывается при вставке новой вкладки.
        Здесь мы создаем кастомную кнопку закрытия.
        """
        super().tabInserted(index)
        close_button = QToolButton(self)
        close_button.setText("❌")
        close_button.setFont(QFont("Segoe UI Emoji", 14))
        close_button.setStyleSheet("""
            QToolButton {
                border: none;
                background-color: transparent;
                padding: 0px;
            }
            QToolButton:hover {
                background-color: #ffcccc;
                border-radius: 5px;
            }
        """)
        close_button.setFixedSize(20, 20)
        # Связываем кнопку с функцией закрытия вкладки
        close_button.clicked.connect(lambda: self.tabCloseRequested.emit(index))
        self.setTabButton(index, QTabBar.ButtonPosition.RightSide, close_button)
        self.close_buttons[index] = close_button

    def tabRemoved(self, index):
        """Удаляем кнопку закрытия из словаря при удалении вкладки."""
        super().tabRemoved(index)
        if index in self.close_buttons:
            del self.close_buttons[index]


class CustomTabWidget(QTabWidget):
    """
    Кастомный класс QTabWidget, который использует наш CustomTabBar.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setTabBar(CustomTabBar(self))


class Browser(QMainWindow):
    """
    Основной класс браузера, который управляет окном, вкладками и навигацией.
    """
    def __init__(self, is_incognito=False):
        super().__init__()

        self.settings = QSettings("Daniella Browser", "Browser")
        self.homepage_url = self.settings.value("homepage", "https://www.google.com")
        self.is_incognito = is_incognito
        
        if self.is_incognito:
            self.profile = QWebEngineProfile()
            self.setWindowTitle("Daniella Browser (Инкогнито)")
        else:
            self.profile = QWebEngineProfile.defaultProfile()
            self.setWindowTitle("Daniella Browser")
        
        self.setMinimumSize(QSize(1024, 768))
        self.setWindowIcon(QIcon.fromTheme("web-browser"))

        QApplication.setStyle(QStyleFactory.create("Fusion"))

        self.tabs = CustomTabWidget()
        self.tabs.tabCloseRequested.connect(self.close_tab)
        self.tabs.currentChanged.connect(self.update_ui)
        self.setCentralWidget(self.tabs)

        self.toolbar = QToolBar("Навигация")
        self.toolbar.setIconSize(QSize(24, 24))
        self.addToolBar(self.toolbar)

        self.back_btn = QAction("Назад", self)
        self.back_btn.triggered.connect(lambda: self.tabs.currentWidget().back() if self.tabs.currentWidget() else None)
        self.toolbar.addAction(self.back_btn)

        self.forward_btn = QAction("Вперед", self)
        self.forward_btn.triggered.connect(lambda: self.tabs.currentWidget().forward() if self.tabs.currentWidget() else None)
        self.toolbar.addAction(self.forward_btn)

        self.reload_btn = QAction("Обновить", self)
        self.reload_btn.triggered.connect(lambda: self.tabs.currentWidget().reload() if self.tabs.currentWidget() else None)
        self.toolbar.addAction(self.reload_btn)

        self.home_btn = QAction("Домой", self)
        self.home_btn.triggered.connect(self.navigate_home)
        self.toolbar.addAction(self.home_btn)

        self.toolbar.addSeparator()

        self.url_bar = UrlBarWithIcon()
        self.url_bar.returnPressed.connect(self.navigate_to_url)
        self.toolbar.addWidget(self.url_bar)

        self.toolbar.addSeparator()

        self.add_tab_action = QAction("Новая вкладка", self)
        self.add_tab_action.triggered.connect(lambda: self.add_new_tab(QUrl(self.homepage_url)))
        self.toolbar.addAction(self.add_tab_action)
        
        self.settings_btn = QAction("Настройки", self)
        self.settings_btn.triggered.connect(self.open_settings)
        self.toolbar.addAction(self.settings_btn)

        self.incognito_btn = QAction("Новое окно инкогнито", self)
        self.incognito_btn.triggered.connect(self.open_incognito_window)
        self.toolbar.addAction(self.incognito_btn)

        self.progress_bar = QProgressBar(self)
        self.progress_bar.setMinimum(0)
        self.progress_bar.setMaximum(100)
        self.progress_bar.setFixedHeight(2)
        self.progress_bar.setTextVisible(False)
        self.toolbar.addWidget(self.progress_bar)
        self.progress_bar.hide()

        self.setStatusBar(QStatusBar(self))
        self.statusBar().setFont(QFont("Manrope", 10))

        self.update_stylesheet()

        self.add_new_tab(QUrl(self.homepage_url), "Домашняя")

    def open_settings(self):
        dialog = SettingsDialog(self)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            self.homepage_url = self.settings.value("homepage", "https://www.google.com")
            self.update_stylesheet()
            
    def update_stylesheet(self):
        current_theme = self.settings.value("theme", "Светлая")
        light_icon_color = "#3a3a3a"
        dark_icon_color = "#eeeeee"

        if current_theme == "Светлая":
            icon_color = light_icon_color
            stylesheet = """
                QWidget {
                    background-color: #f7f7f7;
                    color: #2a2a2a;
                    font-family: "Manrope", sans-serif;
                }
                QTabWidget::pane {
                    border-top: 1px solid #dcdcdc;
                }
                QTabBar::tab {
                    background: #e9e9e9;
                    border: 1px solid #dcdcdc;
                    border-bottom-color: #e9e9e9;
                    border-top-left-radius: 12px;
                    border-top-right-radius: 12px;
                    padding: 8px 15px;
                    margin-right: 2px;
                    font-size: 14px;
                }
                QTabBar::tab:selected {
                    background: #ffffff;
                    border-bottom: none;
                    font-weight: bold;
                }
                QTabBar::tab:hover {
                    background: #f0f0f0;
                }
                QLineEdit {
                    padding: 0 15px;
                    border: 1px solid #dcdcdc;
                    background-color: #ffffff;
                    border-radius: 20px;
                    font-size: 14px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                }
                QToolBar {
                    background-color: #ffffff;
                    border-bottom: 1px solid #dcdcdc;
                    padding: 5px;
                    spacing: 5px;
                }
                QToolButton {
                    border: 1px solid transparent;
                    border-radius: 12px;
                    background-color: transparent;
                    padding: 8px;
                }
                QToolButton:hover {
                    background-color: #f0f0f0;
                    border: 1px solid #dcdcdc;
                }
                QStatusBar {
                    background-color: #e9e9e9;
                    border-top: 1px solid #dcdcdc;
                }
                QPushButton {
                    background-color: #ffffff;
                    border: 1px solid #dcdcdc;
                    border-radius: 12px;
                    padding: 8px 15px;
                    font-size: 14px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
                }
                QPushButton:hover {
                    background-color: #f0f0f0;
                }
                QProgressBar {
                    border: 1px solid #dcdcdc;
                    border-radius: 2px;
                    background-color: #e0e0e0;
                    text-align: center;
                }
                QProgressBar::chunk {
                    background-color: #3498db;
                    width: 1px;
                }
            """
        else:
            icon_color = dark_icon_color
            stylesheet = """
                QWidget {
                    background-color: #2b2b2b;
                    color: #dcdcdc;
                    font-family: "Manrope", sans-serif;
                }
                QTabWidget::pane {
                    border-top: 1px solid #4a4a4a;
                }
                QTabBar::tab {
                    background: #3c3c3c;
                    border: 1px solid #4a4a4a;
                    border-bottom-color: #3c3c3c;
                    border-top-left-radius: 12px;
                    border-top-right-radius: 12px;
                    padding: 8px 15px;
                    margin-right: 2px;
                    font-size: 14px;
                }
                QTabBar::tab:selected {
                    background: #2b2b2b;
                    border-bottom: none;
                    font-weight: bold;
                }
                QTabBar::tab:hover {
                    background: #4a4a4a;
                }
                QLineEdit {
                    padding: 0 15px;
                    border: 1px solid #4a4a4a;
                    background-color: #3c3c3c;
                    border-radius: 20px;
                    color: #ffffff;
                    font-size: 14px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                }
                QToolBar {
                    background-color: #3c3c3c;
                    border-bottom: 1px solid #4a4a4a;
                    padding: 5px;
                    spacing: 5px;
                }
                QToolButton {
                    border: 1px solid transparent;
                    border-radius: 12px;
                    background-color: transparent;
                    padding: 8px;
                }
                QToolButton:hover {
                    background-color: #4a4a4a;
                    border: 1px solid #5a5a5a;
                }
                QStatusBar {
                    background-color: #3c3c3c;
                    border-top: 1px solid #4a4a4a;
                }
                QPushButton {
                    background-color: #3c3c3c;
                    border: 1px solid #4a4a4a;
                    color: #ffffff;
                    border-radius: 12px;
                    padding: 8px 15px;
                    font-size: 14px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                }
                QPushButton:hover {
                    background-color: #4a4a4a;
                }
                QProgressBar {
                    border: 1px solid #4a4a4a;
                    border-radius: 2px;
                    background-color: #3c3c3c;
                    text-align: center;
                }
                QProgressBar::chunk {
                    background-color: #3498db;
                    width: 1px;
                }
            """
        self.setStyleSheet(stylesheet)
        
        self.back_btn.setIcon(create_svg_icon("M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z", icon_color, 24))
        self.forward_btn.setIcon(create_svg_icon("M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z", icon_color, 24))
        self.reload_btn.setIcon(create_svg_icon("M12 5V2L7 7l5 5V9c3.31 0 6 2.69 6 6s-2.69 6-6 6-6-2.69-6-6H4c0 4.42 3.58 8 8 8s8-3.58 8-8-3.58-8-8-8z", icon_color, 24))
        self.home_btn.setIcon(create_svg_icon("M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z", icon_color, 24))
        self.add_tab_action.setIcon(create_svg_icon("M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z", icon_color, 24))
        self.settings_btn.setIcon(QIcon.fromTheme("preferences-system"))
        self.incognito_btn.setIcon(QIcon.fromTheme("user-desktop"))

    def open_incognito_window(self):
        incognito_window = Browser(is_incognito=True)
        incognito_window.show()

    def add_new_tab(self, qurl=None, label="Новая вкладка"):
        """Добавляет новую вкладку в браузер."""
        if qurl is None:
            qurl = QUrl(self.homepage_url)
        
        browser = QWebEngineView(self.profile)
        browser.setUrl(qurl)
        
        browser.urlChanged.connect(lambda url: self.update_url_bar(url, browser))
        browser.titleChanged.connect(lambda title: self.tabs.setTabText(self.tabs.indexOf(browser), title))
        browser.iconChanged.connect(lambda icon: self.tabs.setTabIcon(self.tabs.indexOf(browser), icon))
        browser.loadProgress.connect(lambda progress: self.update_progress(progress, browser))
        browser.loadStarted.connect(lambda: self.update_tab_loading_state(browser, is_loading=True))
        browser.loadFinished.connect(lambda ok: self.update_tab_loading_state(browser, is_loading=False))
        
        i = self.tabs.addTab(browser, QIcon.fromTheme("text-html"), label)
        self.tabs.setCurrentIndex(i)

    def close_tab(self, i):
        """Закрывает вкладку, если она не последняя."""
        if self.tabs.count() <= 1:
            return
        self.tabs.removeTab(i)

    def update_ui(self):
        """Обновляет URL-адрес и другие элементы интерфейса при смене вкладки."""
        current_tab = self.tabs.currentWidget()
        if current_tab:
            self.url_bar.setText(current_tab.url().toString())
            self.url_bar.setCursorPosition(0)

    def update_url_bar(self, url, browser):
        """
        Обновляет адресную строку, если это активная вкладка.
        """
        if browser == self.tabs.currentWidget():
            color = "#3a3a3a" if self.settings.value("theme") == "Светлая" else "#eeeeee"
            
            if url.scheme() == "https":
                self.url_bar.set_icon(create_svg_icon("M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h-1V9h2v2c0 1.1-.9 2-2 2s-2-.9-2-2v-3.5c0-.83-.67-1.5-1.5-1.5S6 4.67 6 5.5v3.5h-1V5.5c0-1.93 1.57-3.5 3.5-3.5s3.5 1.57 3.5 3.5v3.5c0 .83.67 1.5 1.5 1.5s1.5-.67 1.5-1.5V9h-1v2.5c0 1.1-.9 2-2 2s-2-.9-2-2V9h-1v2.99z", color, 16))
            else:
                self.url_bar.set_icon(create_svg_icon("M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 17c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z", color, 16))
            
            self.url_bar.setText(url.toString())
            self.url_bar.setCursorPosition(0)

    def update_progress(self, progress, browser):
        """
        Обновляет строку состояния и прогресс-бар.
        """
        if browser == self.tabs.currentWidget():
            self.progress_bar.setValue(progress)
            if progress > 0 and progress < 100:
                self.progress_bar.show()
                self.statusBar().showMessage(f"Загрузка... {progress}%")
            else:
                self.progress_bar.hide()
                self.statusBar().clearMessage()

    def update_tab_loading_state(self, browser, is_loading):
        """
        Управляет индикатором загрузки на вкладке.
        """
        tab_index = self.tabs.indexOf(browser)
        if tab_index != -1:
            if is_loading:
                color = "#555" if self.settings.value("theme") == "Светлая" else "#ccc"
                self.tabs.setTabIcon(tab_index, create_loading_icon(color))
                self.tabs.setTabToolTip(tab_index, "Загрузка...")
            else:
                self.tabs.setTabIcon(tab_index, browser.icon())
                self.tabs.setTabToolTip(tab_index, "")
                self.statusBar().showMessage("Готово.", 3000)

    def navigate_to_url(self):
        """Переходит по URL-адресу из адресной строки, выполняя базовую проверку."""
        current_tab = self.tabs.currentWidget()
        if not current_tab:
            return
        
        text = self.url_bar.text().strip()
        if not text:
            return

        q = QUrl(text)

        # Проверяем, если адрес не имеет схемы (http, https и т.д.)
        if not q.scheme():
            # Если адрес похож на домен, добавляем https://
            if "." in text:
                q = QUrl(f"https://{text}")
            else:
                # Иначе - это поисковый запрос
                q = QUrl(f"https://www.google.com/search?q={text}")
        
        # Если схема явно указана как http, показываем предупреждение
        if q.scheme() == "http":
            reply = QMessageBox.warning(
                self,
                "Предупреждение безопасности",
                "Эй, бро, этот сайт не использует безопасное соединение (HTTPS). Это может быть опасно! Хочешь перейти, несмотря ни на что?",
                QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
            )
            if reply == QMessageBox.StandardButton.No:
                return

        current_tab.setUrl(q)

    def navigate_home(self):
        """Переходит на домашнюю страницу."""
        current_tab = self.tabs.currentWidget()
        if current_tab:
            current_tab.setUrl(QUrl(self.homepage_url))

    def closeEvent(self, a0: QCloseEvent):
        """Обрабатывает закрытие приложения."""
        if not self.is_incognito:
            QWebEngineProfile.defaultProfile().clearHttpCache()
            QWebEngineProfile.defaultProfile().clearAllVisitedLinks()
            QWebEngineProfile.defaultProfile().cookieStore().deleteAllCookies()
        a0.accept()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = Browser()
    window.show()
    sys.exit(app.exec())
