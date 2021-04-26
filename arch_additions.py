import sys
import os
import psutil
import subprocess
from PyQt5 import QtCore, QtGui, QtWidgets

class SystemTrayIcon(QtWidgets.QSystemTrayIcon):

    def __init__(self, icon, parent=None):
        QtWidgets.QSystemTrayIcon.__init__(self, icon, parent)
        self.menu = QtWidgets.QMenu(parent)
        self.setContextMenu(self.menu)

def setupTrayIcon(url):
    qApp = QtWidgets.QApplication(sys.argv)
    w = QtWidgets.QWidget()
    trayIcon = SystemTrayIcon(QtGui.QIcon("/usr/lib/pgadmin4/web/pgAdmin4.png"), w)
    trayIcon.menu.addAction("New pgAdmin4 window", lambda: subprocess.run(["xdg-open", url]))
    trayIcon.menu.addAction("Exit server process", qApp.exit)
    trayIcon.show()
    print("Setup tray icon...")
    qApp.exec()

def checkRunning():
    for proc in psutil.process_iter():
        try:
            if "pgadmin4.py" in " ".join(proc.cmdline()).lower() and os.getpid() != proc.pid:
                print("pgAdmin4 server is already running...")
                sys.exit()
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
