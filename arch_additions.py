import sys
import os
import psutil
import subprocess
from threading import Thread
from PyQt5 import QtCore, QtGui, QtWidgets

def checkRunning():
    for proc in psutil.process_iter():
        try:
            if "pgadmin4.py" in " ".join(proc.cmdline()).lower() and os.getpid() != proc.pid:
                print("pgAdmin4 server is already running...")
                sys.exit()
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass

class SystemTrayIcon(QtWidgets.QSystemTrayIcon):

    def __init__(self, icon, parent=None):
        QtWidgets.QSystemTrayIcon.__init__(self, icon, parent)
        self.menu = QtWidgets.QMenu(parent)
        self.setContextMenu(self.menu)

class TrayIconInitializer(Thread):
    def __init__(self, url):
        super().__init__()
        self.url = url
        self.app = None

    def run(self):
        self.app = QtWidgets.QApplication(sys.argv)
        w = QtWidgets.QWidget()
        trayIcon = SystemTrayIcon(QtGui.QIcon("/usr/share/icons/hicolor/256x256/apps/pgAdmin4.png"), w)
        trayIcon.menu.addAction("New pgAdmin4 window", lambda: subprocess.run(["xdg-open", self.url]))
        trayIcon.menu.addAction("Exit server process", self.stop)
        trayIcon.show()
        print("Setup tray icon service...")
        self.app.exec()

    def stop(self):
        print("Stop all...")
        sys.exit()
