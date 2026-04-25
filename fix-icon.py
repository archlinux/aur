from pathlib import Path

# patch __main__.py — add setDesktopFileName
f = Path('python/crucible/__main__.py')
src = f.read_text()
src = src.replace(
    'app.setApplicationName("crucible")',
    'app.setApplicationName("crucible")\n    app.setDesktopFileName("crucible")',
)
f.write_text(src)

# patch main_window.py — add QIcon import and setWindowIcon
f = Path('python/crucible/ui/main_window.py')
src = f.read_text()
src = src.replace(
    'from PyQt6.QtGui import QColor',
    'from PyQt6.QtGui import QColor, QIcon',
)
src = src.replace(
    'self.setWindowFlags(Qt.WindowType.FramelessWindowHint)',
    'self.setWindowFlags(Qt.WindowType.FramelessWindowHint)\n'
    "        self.setWindowIcon(QIcon(str(Path(__file__).parent / 'assets' / 'images' / 'icon.jpg')))",
)
f.write_text(src)
