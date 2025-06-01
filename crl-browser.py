import os
import sys
import pwd
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QVBoxLayout, QWidget, QLabel,
    QPushButton, QMessageBox, QCheckBox, QHBoxLayout
)
from PyQt6.QtGui import QPixmap
from PyQt6.QtCore import QUrl, Qt
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebEngineCore import QWebEngineSettings,QWebEnginePage

def setup_tor_proxy(enable: bool):
    if enable:
        os.environ["ALL_PROXY"] = "socks5://127.0.0.1:9050"
        os.environ["HTTP_PROXY"] = "socks5://127.0.0.1:9050"
        os.environ["HTTPS_PROXY"] = "socks5://127.0.0.1:9050"
    else:
        os.environ.pop("ALL_PROXY", None)
        os.environ.pop("HTTP_PROXY", None)
        os.environ.pop("HTTPS_PROXY", None)

# Custom QWebEnginePage to handle link clicks inside the same view
class CustomWebEnginePage(QWebEnginePage):
    def acceptNavigationRequest(self, url, _type, isMainFrame):
        if _type == QWebEnginePage.NavigationType.NavigationTypeLinkClicked:
            # Linke tıklanınca sayfayı aynı view'da aç
            self.setUrl(url)
            return False  # Varsayılan davranışı engelle
        return super().acceptNavigationRequest(url, _type, isMainFrame)

class BrowserWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("crl-browser - Developer Tools & TOR Option")
        self.setGeometry(100, 100, 1000, 700)

        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.layout = QVBoxLayout()
        self.central_widget.setLayout(self.layout)

        self.setup_styles()
        self.load_logo()

        self.controls_layout = QHBoxLayout()
        self.layout.addLayout(self.controls_layout)

        self.tor_checkbox = QCheckBox("Use TOR proxy")
        self.controls_layout.addWidget(self.tor_checkbox)
        self.tor_checkbox.stateChanged.connect(self.toggle_tor)

        self.view_source_btn = QPushButton("View Source")
        self.view_source_btn.clicked.connect(self.view_source)
        self.controls_layout.addWidget(self.view_source_btn)

        self.devtools_btn = QPushButton("Web Inspect (DevTools)")
        self.devtools_btn.clicked.connect(self.open_dev_tools)
        self.controls_layout.addWidget(self.devtools_btn)

        self.web_view = QWebEngineView()
        self.layout.addWidget(self.web_view)

        # Use our custom page to override navigation handling
        self.web_view.setPage(CustomWebEnginePage(self.web_view))

        settings = self.web_view.settings()
        settings.setAttribute(QWebEngineSettings.WebAttribute.JavascriptEnabled, True)
        settings.setAttribute(QWebEngineSettings.WebAttribute.PluginsEnabled, True)
        settings.setAttribute(QWebEngineSettings.WebAttribute.LocalContentCanAccessRemoteUrls, True)
        settings.setAttribute(QWebEngineSettings.WebAttribute.LocalContentCanAccessFileUrls, True)
        settings.setAttribute(QWebEngineSettings.WebAttribute.AllowRunningInsecureContent, True)
        settings.setAttribute(QWebEngineSettings.WebAttribute.ErrorPageEnabled, True)

        self.load_search_page()

        self.devtools = None

    def setup_styles(self):
        self.setStyleSheet("""
            QWidget {
                background-color: #0a0a1a;
                color: #00c8ff;
                font-family: Courier, monospace;
                font-size: 13pt;
            }
            QPushButton {
                background-color: #001122;
                color: #00c8ff;
                border: 1.5px solid #00e0ff;
                padding: 6px 12px;
                border-radius: 6px;
            }
            QPushButton:hover {
                background-color: #00e0ff;
                color: #001122;
            }
            QLabel {
                margin: 10px;
            }
            QCheckBox {
                margin-right: 15px;
            }
        """)

    def load_logo(self):
        logo_url = "https://azccriminal.space/CRL/logo.png"
        self.crlnet_directory = os.path.join(pwd.getpwuid(os.getuid()).pw_dir, "crlnet")
        os.makedirs(self.crlnet_directory, exist_ok=True)
        logo_path = os.path.join(self.crlnet_directory, "logo.png")
        try:
            import requests
            response = requests.get(logo_url)
            if response.status_code == 200:
                with open(logo_path, "wb") as f:
                    f.write(response.content)
                pixmap = QPixmap(logo_path)
                self.logo_label = QLabel()
                self.logo_label.setPixmap(pixmap)
                self.layout.insertWidget(0, self.logo_label)
        except Exception as e:
            print(f"Error loading logo: {e}")

    def load_search_page(self):
      if self.tor_checkbox.isChecked():
        duckduckgo_url = "http://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion/"
        self.web_view.load(QUrl(duckduckgo_url))
      else:
        html = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <title>CRL Browser Search</title>
            <style>
                body {
                    background-color: #0a0a1a;
                    color: #00c8ff;
                    font-family: Courier, monospace;
                    margin: 20px;
                }
                input[type="text"] {
                    width: 60%;
                    padding: 10px;
                    font-size: 16pt;
                    background-color: #050526;
                    color: #00c8ff;
                    border: 2px solid #00e0ff;
                    border-radius: 6px;
                }
                button {
                    padding: 10px 20px;
                    font-size: 16pt;
                    background-color: #001122;
                    color: #00c8ff;
                    border: 2px solid #00e0ff;
                    border-radius: 6px;
                    cursor: pointer;
                }
                button:hover {
                    background-color: #00e0ff;
                    color: #001122;
                }
                #results {
                    margin-top: 20px;
                }
                a {
                    color: #00ffff;
                    text-decoration: none;
                    font-size: 14pt;
                    cursor: pointer;
                }
                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <h1>CRL Browser Search</h1>
            <input id="searchInput" type="text" placeholder="Search DuckDuckGo..." />
            <button onclick="doSearch()">Search</button>
            <div id="results"></div>
            <script>
                function doSearch() {
                    const query = document.getElementById('searchInput').value.trim();
                    if (!query) return;

                    // Eğer URL ise direkt aç
                    if (query.startsWith('http://') || query.startsWith('https://') || query.endsWith('.onion') || query.includes('.onion/')) {
                        window.location.href = query;
                        return;
                    }

                    const url = `https://api.duckduckgo.com/?q=${encodeURIComponent(query)}&format=json&no_redirect=1&no_html=1`;
                    fetch(url)
                    .then(response => response.json())
                    .then(data => {
                        const resultsDiv = document.getElementById('results');
                        resultsDiv.innerHTML = '';
                        let results = [];
                        if (data.RelatedTopics && data.RelatedTopics.length > 0) {
                            data.RelatedTopics.forEach(topic => {
                                if (topic.Text && topic.FirstURL) {
                                    results.push({text: topic.Text, url: topic.FirstURL});
                                } else if (topic.Topics) {
                                    topic.Topics.forEach(sub => {
                                        if (sub.Text && sub.FirstURL) {
                                            results.push({text: sub.Text, url: sub.FirstURL});
                                        }
                                    });
                                }
                            });
                        }
                        if (results.length === 0) {
                            resultsDiv.innerHTML = '<p>No results found.</p>';
                            return;
                        }
                        results.forEach(item => {
                            const a = document.createElement('a');
                            a.href = item.url;
                            a.textContent = item.text;
                            a.onclick = function(event) {
                                event.preventDefault();
                                window.location.href = this.href;
                            };
                            resultsDiv.appendChild(a);
                            resultsDiv.appendChild(document.createElement('br'));
                        });
                    })
                    .catch(err => {
                        document.getElementById('results').innerHTML = `<p style="color:red">Error: ${err}</p>`;
                    });
                }
                document.getElementById('searchInput').addEventListener('keydown', function(e){
                    if(e.key === 'Enter') {
                        doSearch();
                    }
                });
            </script>
        </body>
        </html>
        """
        self.web_view.setHtml(html, QUrl("https://duckduckgo.com/"))


    def toggle_tor(self, state):
        enable = state == 2
        setup_tor_proxy(enable)
        msg = QMessageBox()
        msg.setWindowTitle("TOR Proxy")
        msg.setText(f"TOR proxy has been {'enabled' if enable else 'disabled'}.\nThe page will now be reloaded.")
        msg.exec()
        self.load_search_page()

    def view_source(self):
        if self.devtools is None:
            self.devtools = QWebEngineView()
            self.web_view.page().setDevToolsPage(self.devtools.page())
            self.devtools.setWindowTitle("View Source (DevTools)")
            self.devtools.resize(900, 700)
        self.devtools.show()
        self.devtools.raise_()
        self.devtools.activateWindow()

    def open_dev_tools(self):
        if self.devtools is None:
            self.devtools = QWebEngineView()
            self.web_view.page().setDevToolsPage(self.devtools.page())
            self.devtools.setWindowTitle("Web Inspect (DevTools)")
            self.devtools.resize(900, 700)
        self.devtools.show()
        self.devtools.raise_()
        self.devtools.activateWindow()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = BrowserWindow()
    window.show()
    sys.exit(app.exec())
