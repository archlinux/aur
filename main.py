# coding=utf-8
import sys
import json
import os
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QLineEdit, QVBoxLayout, QWidget,
    QToolBar, QStatusBar, QTabWidget, QStyleFactory, QDialog,
    QLabel, QPushButton, QHBoxLayout, QGroupBox, QComboBox, QProgressBar,
    QTabBar, QToolButton, QMessageBox, QListWidget, QListWidgetItem, QInputDialog
)
from PyQt6.QtCore import QUrl, QSize, Qt, QSettings, QCoreApplication, QTimer, QDir, QUrlQuery
from PyQt6.QtGui import QAction, QIcon, QFont, QCloseEvent, QPixmap, QImage, QPainter
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineProfile, QWebEngineUrlRequestInterceptor
import uuid

# ВАЖНО: Тебе нужно установить эту библиотеку, иначе будет ошибка `ModuleNotFoundError`.
# Запусти в терминале: `yay -S python-pycryptodomex`
from Cryptodome.Cipher import AES
from Cryptodome.Random import get_random_bytes
from Cryptodome.Util.Padding import pad, unpad

# === ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ ===
__version__ = "2.0.1"  # Версия обновлена
__author__ = "Kolhoz" # Персонализация

# ВАЖНО: В реальном приложении этот ключ не должен быть захардкожен!
# Его нужно получать из защищенного хранилища или пароля пользователя.
ENCRYPTION_KEY = b'1234567890123456' # 16-байтный ключ для AES-128

def encrypt_data(data):
    """Шифрует данные с помощью AES."""
    cipher = AES.new(ENCRYPTION_KEY, AES.MODE_CBC)
    ct_bytes = cipher.encrypt(pad(data.encode('utf-8'), AES.block_size))
    return cipher.iv + ct_bytes

def decrypt_data(data):
    """Дешифрует данные с помощью AES."""
    iv = data[:16]
    ct = data[16:]
    cipher = AES.new(ENCRYPTION_KEY, AES.MODE_CBC, iv)
    pt = unpad(cipher.decrypt(ct), AES.block_size)
    return pt.decode('utf-8')


# === КЛАССЫ И ФУНКЦИИ ===

class AdBlocker(QWebEngineUrlRequestInterceptor):
    """
    Класс-перехватчик для блокировки рекламы.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.ad_domains = [
            "googleadservices.com",
            "doubleclick.net",
            "adservice.google.com",
            "ads.youtube.com",
            "yandex.ru/ads",
        ]

    def interceptRequest(self, request):
        """
        Перехватывает каждый запрос и проверяет, не является ли он рекламой.
        """
        url = request.requestUrl().toString()
        for domain in self.ad_domains:
            if domain in url:
                request.block(True)
                return


class BookmarksDialog(QDialog):
    """
    Класс для окна управления закладками.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Закладки")
        self.setMinimumSize(400, 300)
        self.settings = self.parent().settings
        self.parent = parent
        
        main_layout = QVBoxLayout()
        self.setLayout(main_layout)
        
        self.bookmarks_list = QListWidget()
        self.bookmarks_list.itemDoubleClicked.connect(self.open_bookmark)
        main_layout.addWidget(self.bookmarks_list)
        
        button_layout = QHBoxLayout()
        open_button = QPushButton("Перейти")
        open_button.clicked.connect(self.open_bookmark)
        remove_button = QPushButton("Удалить")
        remove_button.clicked.connect(self.remove_bookmark)
        button_layout.addWidget(open_button)
        button_layout.addWidget(remove_button)
        main_layout.addLayout(button_layout)
        
        self.load_bookmarks()

    def load_bookmarks(self):
        """Загружает закладки из настроек и отображает их в списке."""
        self.bookmarks_list.clear()
        bookmarks_dict = self.settings.value("bookmarks", {})
        if bookmarks_dict:
            for title, url in bookmarks_dict.items():
                item = QListWidgetItem(f"{title} - {url}")
                item.setData(Qt.ItemDataRole.UserRole, url)
                self.bookmarks_list.addItem(item)
    
    def open_bookmark(self):
        """Открывает выбранную закладку в новой вкладке."""
        selected_item = self.bookmarks_list.currentItem()
        if selected_item:
            url = QUrl(selected_item.data(Qt.ItemDataRole.UserRole))
            if self.parent:
                self.parent.add_new_tab(url)
            self.accept()

    def remove_bookmark(self):
        """Удаляет выбранную закладку."""
        selected_item = self.bookmarks_list.currentItem()
        if selected_item:
            title = selected_item.text().split(" - ")[0]
            bookmarks_dict = self.settings.value("bookmarks", {})
            if title in bookmarks_dict:
                del bookmarks_dict[title]
                self.settings.setValue("bookmarks", bookmarks_dict)
                self.load_bookmarks()
                self.parent.statusBar().showMessage("Закладка удалена!", 3000)

class PasswordManagerDialog(QDialog):
    """
    Диалог для управления сохраненными паролями.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Менеджер паролей")
        self.setMinimumSize(400, 300)
        self.settings = self.parent().settings
        
        main_layout = QVBoxLayout()
        self.setLayout(main_layout)
        
        self.passwords_list = QListWidget()
        main_layout.addWidget(self.passwords_list)
        
        button_layout = QHBoxLayout()
        remove_button = QPushButton("Удалить")
        remove_button.clicked.connect(self.remove_password)
        button_layout.addWidget(remove_button)
        main_layout.addLayout(button_layout)
        
        self.load_passwords()

    def load_passwords(self):
        """Загружает и дешифрует пароли из настроек."""
        self.passwords_list.clear()
        encrypted_data = self.settings.value("encrypted_passwords")
        if encrypted_data:
            try:
                decrypted_data = decrypt_data(encrypted_data)
                passwords_dict = json.loads(decrypted_data)
                for site, login_info in passwords_dict.items():
                    item = QListWidgetItem(f"{site}: {login_info['login']}")
                    self.passwords_list.addItem(item)
            except Exception as e:
                print(f"Ошибка при дешифровке паролей: {e}")

    def remove_password(self):
        """Удаляет выбранный пароль."""
        selected_item = self.passwords_list.currentItem()
        if selected_item:
            site = selected_item.text().split(":")[0]
            encrypted_data = self.settings.value("encrypted_passwords")
            if encrypted_data:
                try:
                    decrypted_data = decrypt_data(encrypted_data)
                    passwords_dict = json.loads(decrypted_data)
                    if site in passwords_dict:
                        del passwords_dict[site]
                        encrypted_new_data = encrypt_data(json.dumps(passwords_dict))
                        self.settings.setValue("encrypted_passwords", encrypted_new_data)
                        self.load_passwords()
                        self.parent().statusBar().showMessage("Пароль удален!", 3000)
                except Exception as e:
                    print(f"Ошибка при удалении пароля: {e}")


class SettingsDialog(QDialog):
    """
    Класс для окна настроек браузера.
    """
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Настройки Daniella Browser")
        self.setMinimumSize(400, 200)

        self.settings = self.parent().settings
        
        main_layout = QVBoxLayout()
        self.setLayout(main_layout)

        homepage_group = QGroupBox("Домашняя страница")
        homepage_layout = QVBoxLayout()
        self.homepage_edit = QLineEdit(self.settings.value("homepage", "https://www.google.com"))
        homepage_layout.addWidget(self.homepage_edit)
        homepage_group.setLayout(homepage_layout)
        main_layout.addWidget(homepage_group)

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

        privacy_group = QGroupBox("Конфиденциальность и безопасность")
        privacy_layout = QVBoxLayout()
        
        clear_data_btn = QPushButton("Очистить все данные браузера")
        clear_data_btn.clicked.connect(self.clear_all_data)
        
        reset_btn = QPushButton("Сбросить до заводских настроек")
        reset_btn.clicked.connect(self.reset_to_factory_settings)
        reset_btn.setStyleSheet("background-color: #e74c3c; color: white;")
        
        self.dnt_checkbox = QComboBox()
        self.dnt_checkbox.addItems(["Не отслеживать", "Разрешить отслеживание"])
        if self.settings.value("do_not_track", True):
            self.dnt_checkbox.setCurrentIndex(0)
        else:
            self.dnt_checkbox.setCurrentIndex(1)

        privacy_layout.addWidget(clear_data_btn)
        privacy_layout.addWidget(reset_btn)
        privacy_layout.addWidget(self.dnt_checkbox)
        privacy_group.setLayout(privacy_layout)
        main_layout.addWidget(privacy_group)

        official_site_group = QGroupBox("Официальный сайт")
        official_site_layout = QVBoxLayout()
        official_site_label = QLabel("<a href='https://include-digital.org/browser/'>https://include-digital.org/browser/</a>")
        official_site_label.setOpenExternalLinks(True)
        official_site_label.setStyleSheet("color: #3498db;")
        official_site_layout.addWidget(official_site_label)
        official_site_group.setLayout(official_site_layout)
        main_layout.addWidget(official_site_group)

        version_group = QGroupBox("Версия")
        version_layout = QVBoxLayout()
        version_label = QLabel(f"Версия браузера: {__version__}")
        author_label = QLabel(f"Разработан: {__author__}")
        version_layout.addWidget(version_label)
        version_layout.addWidget(author_label)
        version_group.setLayout(version_layout)
        main_layout.addWidget(version_group)

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
        """Сохраняет все настройки."""
        self.settings.setValue("homepage", self.homepage_edit.text())
        self.settings.setValue("theme", self.theme_combo.currentText())
        self.settings.setValue("do_not_track", self.dnt_checkbox.currentIndex() == 0)
        self.parent().update_stylesheet() # Обновляем стили, так как они зависят от темы
        self.parent().homepage_url = self.homepage_edit.text()
        self.accept()

    def clear_all_data(self):
        """Очищает кэш, куки и историю."""
        QWebEngineProfile.defaultProfile().clearHttpCache()
        QWebEngineProfile.defaultProfile().clearAllVisitedLinks()
        QWebEngineProfile.defaultProfile().cookieStore().deleteAllCookies()
        self.parent().statusBar().showMessage("Кэш, история и куки очищены!", 3000)
        
    def reset_to_factory_settings(self):
        """Сбрасывает все настройки браузера до заводских и перезапускает его."""
        reply = QMessageBox.warning(
            self,
            "Сброс настроек",
            "Ты точно хочешь сбросить все настройки браузера? Это удалит все закладки, пароли и другие данные. Ты точно уверен?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if reply == QMessageBox.StandardButton.Yes:
            self.settings.clear()
            self.parent().statusBar().showMessage("Браузер будет перезапущен с заводскими настройками!", 5000)
            self.parent().close()
            # Можно сделать рестарт приложения
            os.execl(sys.executable, sys.executable, *sys.argv)


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

def create_loading_icon(angle, color):
    """Создает анимированный SVG-кружок для индикатора загрузки."""
    loading_color = "#3498db"
    if color == "#cccccc":
        loading_color = "#3498db"
    
    loading_svg = f"""<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
        <g transform="rotate({angle}, 12, 12)">
            <circle cx="12" cy="12" r="10" stroke="{loading_color}" stroke-width="2" fill="none" stroke-dasharray="15 50" stroke-linecap="round" />
        </g>
    </svg>"""
    return QIcon(QPixmap.fromImage(QImage.fromData(loading_svg.encode())))


def create_app_icon(color):
    """Создает иконку приложения."""
    svg_data = f"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="256" height="256">
      <path fill="{color}" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 17c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"/>
      <path fill="#ffffff" d="M12 12c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
    </svg>
    """
    return QIcon(QPixmap.fromImage(QImage.fromData(svg_data.encode())))


class CustomTabBar(QTabBar):
    """Кастомный класс QTabBar для ручной настройки кнопок закрытия."""
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setTabsClosable(True)
        self.setMovable(True)
        self.close_buttons = {}
        self.tabBarClicked.connect(self._handle_tab_bar_clicked)
        self.is_loading = {}
        self.animation_timer = QTimer(self)
        self.animation_timer.setInterval(50)
        self.animation_timer.timeout.connect(self.animate_loading_icons)
        self.animation_angle = 0

    def _handle_tab_bar_clicked(self, index):
        """Обрабатывает клики по вкладке и передает их в основное окно."""
        pass

    def animate_loading_icons(self):
        """
        Анимирует иконки загрузки для всех вкладок, которые загружаются.
        """
        self.animation_angle = (self.animation_angle + 10) % 360
        for i in range(self.count()):
            if self.is_loading.get(i, False):
                main_window = self.parent().parent() 
                color = "#555" if main_window.settings.value("theme") == "Светлая" else "#ccc"
                self.setTabIcon(i, create_loading_icon(self.animation_angle, color))
    
    def set_loading_state(self, index, state):
        """Устанавливает состояние загрузки для вкладки."""
        self.is_loading[index] = state
        if state:
            if not any(self.is_loading.values()):
                self.animation_timer.start()
        else:
            if not any(self.is_loading.values()):
                self.animation_timer.stop()


    def tabInserted(self, index):
        """
        Метод, который вызывается при вставке новой вкладки.
        Здесь мы создаем кастомную кнопку закрытия.
        """
        super().tabInserted(index)
        close_button = QToolButton(self)
        close_button.setIcon(create_svg_icon("M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z", "#777", 16))
        close_button.setStyleSheet("""
            QToolButton {
                border: none;
                background-color: transparent;
                border-radius: 5px;
                padding: 0px;
            }
            QToolButton:hover {
                background-color: #ffcccc;
                border-radius: 5px;
            }
        """)
        close_button.setFixedSize(20, 20)
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


def generate_welcome_page(theme):
    """Генерирует HTML-страницу приветствия."""
    bg_color = "#f7f7f7" if theme == "Светлая" else "#2b2b2b"
    text_color = "#2a2a2a" if theme == "Светлая" else "#dcdcdc"

    return f"""
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Приветствие</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&display=swap');
            body {{
                background-color: {bg_color};
                color: {text_color};
                font-family: 'Manrope', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                text-align: center;
            }}
            .container {{
                padding: 40px;
                border-radius: 20px;
                background-color: {'#ffffff' if theme == 'Светлая' else '#3c3c3c'};
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                max-width: 600px;
                animation: fadeIn 1s ease-in-out;
            }}
            h1 {{
                font-size: 2.5em;
                margin-bottom: 0.5em;
                font-weight: 700;
                color: #3498db;
            }}
            p {{
                font-size: 1.2em;
                line-height: 1.6;
            }}
            .logo {{
                width: 100px;
                height: 100px;
                margin-bottom: 20px;
            }}
            @keyframes fadeIn {{
                from {{ opacity: 0; transform: translateY(20px); }}
                to {{ opacity: 1; transform: translateY(0); }}
            }}
        </style>
    </head>
    <body>
        <div class="container">
            <svg class="logo" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="100" height="100">
                <path fill="#3498db" d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 17c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"/>
                <path fill="#ffffff" d="M12 12c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/>
            </svg>
            <h1>Привет!</h1>
            <p>Добро пожаловать в daniella, созданный для безопасности.</p>
            <p>Удачи в серфинге! Просто введи что-нибудь в адресную строку.</p>
        </div>
    </body>
    </html>
    """

def generate_error_page(theme, error_message):
    """Генерирует HTML-страницу ошибки."""
    bg_color = "#f7f7f7" if theme == "Светлая" else "#2b2b2b"
    text_color = "#2a2a2a" if theme == "Светлая" else "#dcdcdc"

    return f"""
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ошибка</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&display=swap');
            body {{
                background-color: {bg_color};
                color: {text_color};
                font-family: 'Manrope', sans-serif;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                text-align: center;
            }}
            .container {{
                padding: 40px;
                border-radius: 20px;
                background-color: {'#ffffff' if theme == 'Светлая' else '#3c3c3c'};
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                max-width: 600px;
            }}
            h1 {{
                font-size: 2.5em;
                margin-bottom: 0.5em;
                font-weight: 700;
                color: #e74c3c;
            }}
            p {{
                font-size: 1.2em;
                line-height: 1.6;
            }}
            .icon {{
                font-size: 4em;
                color: #e74c3c;
                margin-bottom: 20px;
            }}
        </style>
    </head>
    <body>
        <div class="container">
            <div class="icon">😭</div>
            <h1>Упс! Что-то пошло не так!</h1>
            <p>Не удалось загрузить страницу. Возможно, проблема с подключением или адрес введен неверно.</p>
            <p><b>We3:</b> Сообщение об ошибке: <b>{error_message}</b></p>
        </div>
    </body>
    </html>
    """


class Browser(QMainWindow):
    """
    Основной класс браузера, который управляет окном, вкладками и навигацией.
    """
    def __init__(self, is_incognito=False):
        super().__init__()

        self.settings = QSettings("Daniella Browser", "Browser")
        QCoreApplication.setOrganizationName("Daniella Browser")
        QCoreApplication.setApplicationName("Browser")

        # --- ГЕНЕРАЦИЯ ИДЕНТИФИКАТОРА ПОЛЬЗОВАТЕЛЯ ---
        self.user_id = str(uuid.uuid4())
        
        # --- ПУТЬ ДЛЯ СОХРАНЕНИЯ КУКИ ---
        self.data_path = os.path.join(QDir.homePath(), '.config', 'Daniella Browser')
        if not os.path.exists(self.data_path):
            os.makedirs(self.data_path)
        
        self.browser_name = self.settings.value("browser_name", "Daniella Browser")
        self.homepage_url = self.settings.value("homepage", "https://www.google.com")
        self.is_incognito = is_incognito

        if self.is_incognito:
            # Для инкогнито-режима создаем временный профиль в памяти
            self.profile = QWebEngineProfile()
            self.setWindowTitle(f"{self.browser_name} (Инкогнито)")
        else:
            # Для обычного режима используем профиль по умолчанию и задаем постоянный путь
            self.profile = QWebEngineProfile.defaultProfile()
            self.profile.setPersistentStoragePath(os.path.join(self.data_path, 'data'))
            self.setWindowTitle(self.browser_name)
        
        self.setMinimumSize(QSize(1024, 768))
        self.setWindowIcon(create_app_icon("#3498db"))

        QApplication.setStyle(QStyleFactory.create("Fusion"))
        
        if self.settings.value("do_not_track", True):
            self.profile.setHttpAcceptLanguage("ru-RU,en-US,en;q=0.9")
            self.profile.setHttpUserAgent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36")
        
        if not self.is_incognito:
            self.ad_blocker = AdBlocker()
            self.profile.setUrlRequestInterceptor(self.ad_blocker)

        self.tabs = CustomTabWidget(self)
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

        self.bookmark_btn = QAction("Добавить закладку", self)
        self.bookmark_btn.triggered.connect(self.add_bookmark)
        self.toolbar.addAction(self.bookmark_btn)
        
        self.show_bookmarks_btn = QAction("Показать закладки", self)
        self.show_bookmarks_btn.triggered.connect(self.show_bookmarks)
        self.toolbar.addAction(self.show_bookmarks_btn)

        self.passwords_btn = QAction("Пароли", self)
        self.passwords_btn.triggered.connect(self.show_password_manager)
        self.toolbar.addAction(self.passwords_btn)

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

        if self.settings.value("first_run", True):
            self.settings.setValue("first_run", False)
            self.add_new_tab(QUrl("about:welcome"))
        else:
            self.add_new_tab(QUrl(self.homepage_url), "Домашняя")

    def open_settings(self):
        """Открывает диалог настроек."""
        dialog = SettingsDialog(self)
        if dialog.exec() == QDialog.DialogCode.Accepted:
            self.homepage_url = self.settings.value("homepage", "https://www.google.com")
            self.update_stylesheet()

    def update_stylesheet(self):
        """Обновляет стили в зависимости от темы."""
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
                QListWidget {
                    border: 1px solid #dcdcdc;
                    background-color: #ffffff;
                    border-radius: 12px;
                }
                QListWidget::item {
                    padding: 8px;
                    border-bottom: 1px solid #dcdcdc;
                }
                QListWidget::item:selected {
                    background-color: #e0e0e0;
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
                QListWidget {
                    border: 1px solid #4a4a4a;
                    background-color: #3c3c3c;
                    color: #ffffff;
                    border-radius: 12px;
                }
                QListWidget::item {
                    padding: 8px;
                    border-bottom: 1px solid #4a4a4a;
                }
                QListWidget::item:selected {
                    background-color: #4a4a4a;
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
        self.bookmark_btn.setIcon(create_svg_icon("M17 3H7c-1.1 0-2 .9-2 2v16l7-3 7 3V5c0-1.1-.9-2-2-2z", icon_color, 24))
        self.show_bookmarks_btn.setIcon(create_svg_icon("M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z", icon_color, 24))
        self.passwords_btn.setIcon(create_svg_icon("M18 10h-1V7c0-2.76-2.24-5-5-5S7 4.24 7 7h1.5c0-1.93 1.57-3.5 3.5-3.5s3.5 1.57 3.5 3.5v3H6c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2v-8c0-1.1-.9-2-2-2zm-1 9H7v-8h10v8zm-5-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z", icon_color, 24))

        self.url_bar.setStyleSheet(f"""
            QLineEdit {{
                padding: 0 15px;
                border: 1px solid #dcdcdc;
                background-color: #ffffff;
                border-radius: 20px;
                font-size: 14px;
                color: {light_icon_color if current_theme == "Светлая" else dark_icon_color};
            }}
            QLineEdit:focus {{
                border: 1px solid #3498db;
                background-color: #f7f7f7;
            }}
        """) if current_theme == "Светлая" else self.url_bar.setStyleSheet(f"""
            QLineEdit {{
                padding: 0 15px;
                border: 1px solid #4a4a4a;
                background-color: #3c3c3c;
                border-radius: 20px;
                color: {dark_icon_color};
                font-size: 14px;
            }}
            QLineEdit:focus {{
                border: 1px solid #3498db;
                background-color: #2b2b2b;
            }}
        """)

    def open_incognito_window(self):
        """Открывает новое окно в режиме инкогнито."""
        incognito_window = Browser(is_incognito=True)
        incognito_window.show()

    def add_new_tab(self, qurl=None, label="Новая вкладка"):
        """Добавляет новую вкладку в браузер."""
        if qurl is None:
            qurl = QUrl(self.homepage_url)
        
        browser = QWebEngineView(self.profile)

        if qurl.scheme() == "about":
            if qurl.path() == "welcome":
                browser.setHtml(generate_welcome_page(self.settings.value("theme", "Светлая")))
                label = "Приветствие"
            else:
                browser.setUrl(qurl)
        else:
            browser.setUrl(qurl)
        
        browser.loadFinished.connect(lambda ok: self.handle_load_finished(ok, browser))

        browser.urlChanged.connect(lambda url: self.update_url_bar(url, browser))
        browser.titleChanged.connect(lambda title: self.tabs.setTabText(self.tabs.indexOf(browser), title))
        browser.iconChanged.connect(lambda icon: self.tabs.setTabIcon(self.tabs.indexOf(browser), icon))
        browser.loadProgress.connect(lambda progress: self.update_progress(progress, browser))
        browser.loadStarted.connect(lambda: self.update_tab_loading_state(browser, is_loading=True))
        
        i = self.tabs.addTab(browser, QIcon.fromTheme("text-html"), label)
        self.tabs.setCurrentIndex(i)
        
    def handle_load_finished(self, ok, browser):
        """Обрабатывает завершение загрузки страницы, включая ошибки."""
        self.update_tab_loading_state(browser, is_loading=False)
        if not ok:
            error_message = f"Не удалось загрузить страницу: {browser.url().toString()}"
            browser.setHtml(generate_error_page(self.settings.value("theme", "Светлая"), error_message))

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
                self.url_bar.set_icon(create_svg_icon("M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 17c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7zm-1-11v-2h2v2h-2zm0 4v-2h2v2h-2z", "red", 16))
            
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
            self.tabs.tabBar().set_loading_state(tab_index, is_loading)
            if not is_loading:
                self.tabs.setTabIcon(tab_index, browser.icon())
                self.tabs.setTabToolTip(tab_index, "")
                self.statusBar().showMessage("Готово.", 3000)

    def navigate_to_url(self):
        """Переходит по URL-адресу из адресной строки, выполняя строгую проверку."""
        current_tab = self.tabs.currentWidget()
        if not current_tab:
            return
        
        text = self.url_bar.text().strip()
        if not text:
            return

        q = QUrl(text)

        if not q.scheme():
            if '.' in text:
                q = QUrl(f"https://{text}")
            else:
                query = QUrlQuery()
                query.addQueryItem("q", text)
                q.setScheme("https")
                q.setHost("www.google.com")
                q.setPath("/search")
                q.setQuery(query.toString())
        
        if q.scheme() == "http":
            reply = QMessageBox.critical(
                self,
                "⚠️ Опасность! We3 предупреждает!",
                f"Чувак, ты серьёзно? Сайт <font color='red'>{q.host()}</font> использует устаревший и незащищенный протокол HTTP. Твои данные могут быть перехвачены! Не советую туда ходить. Всё равно хочешь?",
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
    
    def add_bookmark(self):
        """Добавляет текущую страницу в закладки."""
        current_tab = self.tabs.currentWidget()
        if not current_tab:
            return
        
        url = current_tab.url().toString()
        title = current_tab.title()
        
        bookmarks_dict = self.settings.value("bookmarks", {})
        if not isinstance(bookmarks_dict, dict):
            bookmarks_dict = {}
            
        if title in bookmarks_dict and bookmarks_dict[title] == url:
            self.statusBar().showMessage("Эта страница уже в закладках!", 3000)
            return

        bookmarks_dict[title] = url
        self.settings.setValue("bookmarks", bookmarks_dict)
        self.statusBar().showMessage("Страница добавлена в закладки!", 3000)

    def show_bookmarks(self):
        """Открывает диалог для управления закладками."""
        dialog = BookmarksDialog(self)
        dialog.exec()

    def show_password_manager(self):
        """Открывает диалог для управления паролями."""
        dialog = PasswordManagerDialog(self)
        dialog.exec()

    def save_password(self, site, login, password):
        """Сохраняет зашифрованный пароль."""
        encrypted_data = self.settings.value("encrypted_passwords")
        passwords_dict = {}
        if encrypted_data:
            try:
                passwords_dict = json.loads(decrypt_data(encrypted_data))
            except Exception as e:
                print(f"Ошибка при дешифровке для сохранения: {e}")
        
        passwords_dict[site] = {"login": login, "password": password}
        encrypted_new_data = encrypt_data(json.dumps(passwords_dict))
        self.settings.setValue("encrypted_passwords", encrypted_new_data)
        self.statusBar().showMessage("Пароль сохранен!", 3000)

    def closeEvent(self, a0: QCloseEvent):
        """Обрабатывает закрытие приложения и стирает закладки."""
        # Закладки удаляем, как ты и просил
        self.settings.remove("bookmarks")
        self.settings.sync()
        a0.accept()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = Browser()
    window.show()
    sys.exit(app.exec())
