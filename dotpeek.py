#!/usr/bin/env python

import os
import sys
import signal
from typing import override
from subprocess import check_output, run
from PySide6.QtGui import QIcon
from PySide6.QtCore import QThread, Signal
from PySide6.QtWidgets import QApplication, QMessageBox, QProgressDialog

os.environ["WINEPREFIX"]      = os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')) + "/dotpeek"
# without renderer=gdi, the context menus and license agreement will be blacked-out
os.environ["WINE_D3D_CONFIG"] = "renderer=gdi"
PREFIX     = os.environ["WINEPREFIX"]
# it's better to check if a file is there than run winetricks to check if deps are installed
READY_FILE = PREFIX + "/.ready"
EXECUTABLE = "/opt/dotpeek/dotpeek.exe"

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
      output = check_output(["winetricks", "list-installed"], text=True)
      deps = [
        "dotnet472",
        "d3dx9",
        "corefonts"
      ]
      for dep in deps:
        if dep not in output:
          if dep == "dotnet472":
            self.stage.emit(f"Installing {dep} (it's gonna take a while)...")
          else:
            self.stage.emit(f"Installing {dep}...")
          print("Launching winetricks")
          _ = run(["wineserver", "-k"]) # kill anything that can hang winetricks
          if run(["winetricks", "-q", dep]).returncode != 0:
            app.exit(2)

      # Touch $WINEPREFIX/.ready
      open(READY_FILE, 'w').close()
      app.exit(0)
    except Exception:
      return

if not os.path.isfile(READY_FILE):
  _ = signal.signal(signal.SIGINT, signal.SIG_DFL) # Fix Ctrl+C
  app = QApplication(sys.argv)
  app.setWindowIcon(QIcon.fromTheme("dotpeek"))
  app.setDesktopFileName("dotpeek.exe")
  app.setApplicationDisplayName("dotPeek")
  dialog = QProgressDialog(labelText="Installing dependencies...", minimum=0, maximum=0)
  dialog.setWindowTitle("Setup")
  _ = dialog.canceled.connect(lambda: app.exit(1))
  _ = dialog.finished.connect(lambda: app.exit(1))
  dialog.show()

  worker = Worker()
  _ = worker.stage.connect(dialog.setLabelText)
  worker.start()

  exit_code = app.exec()
  if exit_code == 2:
    _ = QMessageBox.critical(
      None,
      "dotPeek Setup",
      f"Failed to install required dependencies in prefix {PREFIX}"
    )
  worker.terminate() # winetricks is tricky to SIGSTOP, so gotta exterminate it
  _ = worker.wait()
  del worker
  if exit_code != 0:
    sys.exit(exit_code)

os.execvp("wine", ["wine", EXECUTABLE] + sys.argv[1:])
