from pathlib import Path
import sys

def patch(path, old, new):
    f = Path(path)
    src = f.read_text()
    if new in src:
        return  # already patched
    if old not in src:
        print(f"error: expected string not found in {path}", file=sys.stderr)
        sys.exit(1)
    f.write_text(src.replace(old, new, 1))

patch(
    'python/crucible/__main__.py',
    'app.setApplicationName("crucible")',
    'app.setApplicationName("crucible")\n    app.setDesktopFileName("crucible")',
)

patch(
    'python/crucible/ui/main_window.py',
    'from PyQt6.QtGui import QColor',
    'from PyQt6.QtGui import QColor, QIcon',
)

patch(
    'python/crucible/ui/main_window.py',
    'self.setWindowFlags(Qt.WindowType.FramelessWindowHint)',
    'self.setWindowFlags(Qt.WindowType.FramelessWindowHint)\n'
    "        self.setWindowIcon(QIcon(str(Path(__file__).parent / 'assets' / 'images' / 'icon.jpg')))",
)
