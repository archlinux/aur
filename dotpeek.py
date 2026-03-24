#!/usr/bin/env python

import os
import sys
import signal
from typing import override
from subprocess import run
from PySide6.QtGui import QIcon
from PySide6.QtCore import QThread, Signal
from PySide6.QtWidgets import QApplication, QMessageBox, QProgressDialog

os.environ["WINEPREFIX"]      = os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')) + "/dotpeek"
# without renderer=gdi, the context menus and license agreement will be blacked-out
os.environ["WINE_D3D_CONFIG"] = "renderer=gdi"
PREFIX     = os.environ["WINEPREFIX"]
# it's better to check if a file is there than run winetricks to check if deps are installed
WINETRICKS_LOG = PREFIX + "/winetricks.log"
EXECUTABLE = "/opt/dotpeek/dotpeek.exe"
DEPS = [
  "dotnet472",
  "d3dx9",
  "corefonts"
]

# TODO: add a -f option to reinstall dependencies
class Worker(QThread):
  stage:   Signal = Signal(str)
  success: Signal = Signal()
  error:   Signal = Signal()
  # install_deps
  @override
  def run(self):
    try:
      _ = run(["wine", "init"])
      installed = open(WINETRICKS_LOG).read() if os.path.isfile(WINETRICKS_LOG) else ""
      for dep in DEPS:
        if dep not in installed:
          if dep == "dotnet472":
            self.stage.emit(f"Installing {dep} (it's gonna take a while)...")
          else:
            self.stage.emit(f"Installing {dep}...")
          print("Launching winetricks")
          _ = run(["wineserver", "-k"]) # kill anything that can hang winetricks
          if run(["winetricks", "-q", dep]).returncode != 0:
            app.exit(2)

      app.exit(0)
    except Exception:
      app.exit(1)

if not os.path.isfile(WINETRICKS_LOG) or not all(dep in open(WINETRICKS_LOG).read() for dep in DEPS):
  _ = signal.signal(signal.SIGINT, signal.SIG_DFL) # Fix Ctrl+C
  app = QApplication(sys.argv)
  app.setWindowIcon(QIcon.fromTheme("dotpeek"))
  app.setDesktopFileName("dotpeek.exe")
  app.setApplicationDisplayName("dotPeek")
  dialog = QProgressDialog(labelText="Installing dependencies...", minimum=0, maximum=0)
  dialog.setWindowTitle("Setup")
  _ = dialog.canceled.connect(lambda: app.exit(3))
  _ = dialog.finished.connect(lambda: app.exit(3))
  dialog.show()

  worker = Worker()
  _ = worker.stage.connect(dialog.setLabelText)
  worker.start()

  exit_code = app.exec()
  worker.terminate() # winetricks is tricky to SIGSTOP, so gotta exterminate it
  _ = worker.wait()
  del worker
  if exit_code != 0 and exit_code != 3:
    _ = QMessageBox.critical(
      None,
      "dotPeek Setup",
      f"Failed to install required dependencies in prefix {PREFIX}"
    )
    sys.exit(exit_code)

os.execvp("wine", ["wine", EXECUTABLE] + sys.argv[1:])
