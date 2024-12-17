import sys
from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QPushButton, QWidget
from PyQt5.QtWebEngineWidgets import QWebEngineView, QWebEngineProfile


class FlippenBrowser(QMainWindow):
    def __init__(self):
        super().__init__()
        
        # Настройка интерфейса
        self.setWindowTitle("Flippen Browser")
        self.setGeometry(100, 100, 1280, 720)
        
        # Создаем WebView
        self.browser = QWebEngineView()
        self.browser.setUrl(QUrl("https://www.google.com"))
        
        # Создаем кнопку для обновления страницы
        self.refresh_button = QPushButton("Refresh")
        self.refresh_button.clicked.connect(self.refresh_page)

        # Создаем основное окно
        layout = QVBoxLayout()
        layout.addWidget(self.browser)
        layout.addWidget(self.refresh_button)

        container = QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)

    def refresh_page(self):
        self.browser.reload()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = FlippenBrowser()
    window.show()
    sys.exit(app.exec_())
