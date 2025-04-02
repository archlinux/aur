#!/usr/bin/env python3


import sys
import os
import socket
from PyQt5.QtWidgets import (
    QApplication, QMainWindow, QVBoxLayout, QPushButton, QLineEdit, QWidget,
    QTabWidget, QFileDialog, QMessageBox, QProgressDialog, QHBoxLayout
)
from PyQt5.QtWebEngineWidgets import QWebEngineView, QWebEngineDownloadItem
from PyQt5.QtCore import QUrl


class Browser(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Hemu GenVE Browser")
        self.setGeometry(100, 100, 1200, 800)

        # ** Tabs Widget **
        self.tabs = QTabWidget()
        self.tabs.setTabsClosable(True)
        self.tabs.tabCloseRequested.connect(self.close_tab)
        self.tabs.currentChanged.connect(self.update_url_bar)
        self.setCentralWidget(self.tabs)

        # ** Top Navigation Bar **
        self.nav_bar = QWidget()
        layout = QHBoxLayout()

        self.url_bar = QLineEdit()
        self.url_bar.setPlaceholderText("Search or enter URL...")
        self.url_bar.returnPressed.connect(self.load_url)

        back_btn = QPushButton("◀")
        back_btn.clicked.connect(self.go_back)

        forward_btn = QPushButton("▶")
        forward_btn.clicked.connect(self.go_forward)

        refresh_btn = QPushButton("⟳")
        refresh_btn.clicked.connect(self.refresh_page)

        self.new_tab_btn = QPushButton("+")
        self.new_tab_btn.clicked.connect(lambda: self.create_new_tab("https://www.google.com"))

        layout.addWidget(back_btn)
        layout.addWidget(forward_btn)
        layout.addWidget(refresh_btn)
        layout.addWidget(self.url_bar)
        layout.addWidget(self.new_tab_btn)
        self.nav_bar.setLayout(layout)

        self.addToolBarBreak()
        self.addToolBar("Navigation").addWidget(self.nav_bar)

        # ** Open First Tab **
        self.create_new_tab("https://wwwhemeshwebbrowser.w3spaces.com")

    def create_new_tab(self, url="https://wwwhemeshwebbrowser.w3spaces.com"):
        """Creates a new tab with a web view."""
        if not isinstance(url, str) or not url.strip():
            url = "https://wwwhemeshwebbrowser.w3spaces.com"  # Default to Hemesh search engine if invalid

        web_view = QWebEngineView()
        web_view.load(QUrl(url))  # ✅ Fixed issue by ensuring it's always a valid URL

        index = self.tabs.addTab(web_view, "New Tab")
        self.tabs.setCurrentIndex(index)

        web_view.urlChanged.connect(lambda url, idx=index: self.update_tab_title(url, idx))
        web_view.page().profile().downloadRequested.connect(self.download_file)

    def update_tab_title(self, url, index):
        """Updates tab title when page loads."""
        self.tabs.setTabText(index, url.toString())

    def update_url_bar(self, index):
        """Updates URL bar when switching tabs."""
        if index >= 0:
            web_view = self.tabs.widget(index)
            if web_view:
                self.url_bar.setText(web_view.url().toString())

    def load_url(self):
        """Loads URL from search bar or searches Google if not a valid URL."""
        url = self.url_bar.text().strip()

        if "." not in url or " " in url:
            url = f"https://cse.google.com/cse?cx=87f7bb4b355274bcf&q={url.replace(' ', '+')}"
        elif not url.startswith("http"):
            url = "http://" + url

        current_tab = self.tabs.currentWidget()
        if current_tab:
            current_tab.load(QUrl(url))

    def go_back(self):
        """Goes back in the current tab's history."""
        current_tab = self.tabs.currentWidget()
        if current_tab:
            current_tab.back()

    def go_forward(self):
        """Goes forward in the current tab's history."""
        current_tab = self.tabs.currentWidget()
        if current_tab:
            current_tab.forward()

    def refresh_page(self):
        """Reloads the current page."""
        current_tab = self.tabs.currentWidget()
        if current_tab:
            current_tab.reload()

    def close_tab(self, index):
        """Closes a tab safely."""
        if self.tabs.count() > 1:
            self.tabs.removeTab(index)
        else:
            self.close()

    def download_file(self, download_item: QWebEngineDownloadItem):
        """Handles file downloads with progress dialog."""
        default_path = os.path.expanduser("~/Downloads")
        if not os.path.exists(default_path):
            os.makedirs(default_path)

        file_path, _ = QFileDialog.getSaveFileName(self, "Save File", os.path.join(default_path, download_item.suggestedFileName()))

        if file_path:
            download_item.setDownloadFileName(file_path)
            download_item.accept()
            self.show_download_progress(download_item, file_path)

    def show_download_progress(self, download_item: QWebEngineDownloadItem, file_path):
        """Displays a progress dialog for downloads."""
        progress_dialog = QProgressDialog("Downloading file...", "Cancel", 0, 100, self)
        progress_dialog.setWindowTitle("Download Progress")
        progress_dialog.setAutoClose(True)
        progress_dialog.show()

        def update_progress(received, total):
            if total > 0:
                percent = int((received / total) * 100)
                progress_dialog.setValue(percent)

            if progress_dialog.wasCanceled():
                download_item.cancel()
                QMessageBox.warning(self, "Download Canceled", f"Download of {file_path} was canceled.")

        download_item.downloadProgress.connect(update_progress)

    def check_internet(self):
        """Checks internet connectivity."""
        try:
            socket.create_connection(("8.8.8.8", 53), timeout=2)
            return True
        except OSError:
            return False


if __name__ == "__main__":
    app = QApplication(sys.argv)
    browser = Browser()

    if not browser.check_internet():
        QMessageBox.critical(None, "No Internet", "Error: No Internet Connection. Closing in 1 minute.")
        sys.exit(app.exec_())

    browser.show()
    sys.exit(app.exec_())
