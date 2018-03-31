import math
import psutil
import os
import webbrowser
from ftplib import FTP
import sys
import subprocess

from PyQt5 import QtCore, QtGui, QtWidgets
if os.name == 'nt':
    from PyQt5.QtWebEngineWidgets import QWebEngineView
else:
    from PyQt5.QtWebKitWidgets import QWebView


from core import OpenLeecher
from settings import Ui_Settings

# Core class (QThread)
# Handles the core, can be threaded by Qt
# Args : None
class Core(QtCore.QThread):
    def __init__(self):
        QtCore.QThread.__init__(self)
        self.core = OpenLeecher()

    def run(self):
        self.core.run()


# Main Window UI class
# QT class of the main window
class Ui_MainWindow(object):
    # Setup UI
    # UI creation
    # Args : MainWindow=QT root window
    def setupUi(self, MainWindow):
        self.ol = Core()
        self.mw = MainWindow
        MainWindow.setObjectName("MainWindow")
        MainWindow.setFixedSize(800, 580)
        if os.name == 'nt':
            MainWindow.setWindowIcon(QtGui.QIcon(os.path.join(self.ol.core.application_path, 'openleecher.png')))
        else:
            MainWindow.setWindowIcon(QtGui.QIcon('/etc/openleecher/openleecher.png'))
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 30))
        self.menubar.setObjectName("menubar")
        self.menuFile = QtWidgets.QMenu(self.menubar)
        self.menuFile.setObjectName("menuFile")
        self.menuSession = QtWidgets.QMenu(self.menubar)
        self.menuSession.setObjectName("menuSession")
        self.menuResults = QtWidgets.QMenu(self.menubar)
        self.menuResults.setObjectName("menuResults")
        self.menuLog = QtWidgets.QMenu(self.menubar)
        self.menuLog.setObjectName("menuLog")
        self.menu = QtWidgets.QMenu(self.menubar)
        self.menu.setObjectName("menu")
        MainWindow.setMenuBar(self.menubar)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.horizontalLayoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(0, 0, MainWindow.width(), 40))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setSizeConstraint(QtWidgets.QLayout.SetNoConstraint)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.Button_SessStartStop = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.Button_SessStartStop.setObjectName("Button_SessStartStop")
        self.Button_Pause = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.Button_Pause.setObjectName("Button_Pause")
        self.Button_Pause.setCheckable(True)
        self.Button_Pause.hide()
        self.horizontalLayout.addWidget(self.Button_SessStartStop)
        self.horizontalLayout.addWidget(self.Button_Pause)
        self.Label_Loader = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.Label_Loader.setEnabled(True)
        self.Label_Loader.setText("")
        self.Label_Loader.setScaledContents(False)
        self.Label_Loader.setObjectName("Label_Loader")
        self.horizontalLayout.addWidget(self.Label_Loader)
        spacerItem = QtWidgets.QSpacerItem(100, 20, QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.Checkbox_OpenResults = QtWidgets.QCheckBox(self.horizontalLayoutWidget)
        self.Checkbox_OpenResults.setObjectName("Checkbox_OpenResults")
        self.horizontalLayout.addWidget(self.Checkbox_OpenResults)
        spacerItem1 = QtWidgets.QSpacerItem(100, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.Label_CPU = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.Label_CPU.setObjectName("Label_CPU")
        self.horizontalLayout.addWidget(self.Label_CPU)
        self.Label_RAM = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.Label_RAM.setObjectName("Label_RAM")
        self.Label_RAM.setMargin(10)
        self.horizontalLayout.addWidget(self.Label_RAM)
        self.Label_Threads = QtWidgets.QLabel(self.horizontalLayoutWidget)
        self.Label_Threads.setObjectName("Label_Threads")
        self.horizontalLayout.addWidget(self.Label_Threads)
        self.SpinBox_Threads = QtWidgets.QSpinBox(self.horizontalLayoutWidget)
        self.SpinBox_Threads.setButtonSymbols(QtWidgets.QAbstractSpinBox.PlusMinus)
        self.SpinBox_Threads.setAccelerated(True)
        self.SpinBox_Threads.setCorrectionMode(QtWidgets.QAbstractSpinBox.CorrectToNearestValue)
        self.SpinBox_Threads.setMinimum(1)
        self.SpinBox_Threads.setMaximum(9999)
        self.SpinBox_Threads.setProperty("value", 8)
        self.SpinBox_Threads.setObjectName("SpinBox_Threads")
        self.horizontalLayout.addWidget(self.SpinBox_Threads)
        self.gridLayoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.gridLayoutWidget.setGeometry(QtCore.QRect(0, 40, MainWindow.width(), MainWindow.height()-self.horizontalLayoutWidget.height() - self.menubar.height()))
        self.gridLayoutWidget.setObjectName("gridLayoutWidget")
        self.gridLayout = QtWidgets.QGridLayout(self.gridLayoutWidget)
        self.gridLayout.setContentsMargins(0, 0, 0, 0)
        self.gridLayout.setObjectName("gridLayout")
        self.tabWidget = QtWidgets.QTabWidget(self.gridLayoutWidget)
        self.tabWidget.setTabShape(QtWidgets.QTabWidget.Rounded)
        self.tabWidget.setUsesScrollButtons(True)
        self.tabWidget.setDocumentMode(False)
        self.tabWidget.setTabsClosable(False)
        self.tabWidget.setObjectName("tabWidget")
        self.tab_S = QtWidgets.QWidget()
        self.tab_S.setObjectName("tab_S")
        self.tab_S.setGeometry(QtCore.QRect(0, 0, self.gridLayoutWidget.width() - 7, self.gridLayoutWidget.height() - self.tabWidget.height() - 4))
        self.groupBox_G = QtWidgets.QGroupBox(self.tab_S)
        self.groupBox_G.setGeometry(QtCore.QRect(0, 0, self.tab_S.width()/3, self.tab_S.height()))
        self.groupBox_G.setObjectName("groupBox_G")
        self.List_Generators = QtWidgets.QListWidget(self.groupBox_G)
        self.List_Generators.setGeometry(QtCore.QRect(5, 35, self.groupBox_G.width() - 10, self.groupBox_G.height() - 40))
        self.List_Generators.setObjectName("List_Generators")
        self.Label_X = QtWidgets.QLabel(self.tab_S)
        self.Label_X.setGeometry(QtCore.QRect(self.tab_S.width()/3, 0, self.tab_S.width()/3, self.tab_S.height()))
        self.Label_X.show()
        self.groupBox_S = QtWidgets.QGroupBox(self.tab_S)
        self.groupBox_S.setGeometry(QtCore.QRect((self.tab_S.width()/3)*2, 0, self.tab_S.width()/3, self.tab_S.height()))
        self.groupBox_S.setObjectName("groupBox_S")
        self.List_Scanners = QtWidgets.QListWidget(self.groupBox_S)
        self.List_Scanners.setGeometry(QtCore.QRect(5, 35, self.groupBox_S.width() - 10, self.groupBox_S.height() - 40))
        self.List_Scanners.setObjectName("List_Scanners")
        self.tabWidget.addTab(self.tab_S, "")
        self.tab_R = QtWidgets.QWidget()
        self.tab_R.setObjectName("tab_R")
        self.tab_R.setGeometry(QtCore.QRect(0, 0, self.gridLayoutWidget.width() - 7, self.gridLayoutWidget.height() - self.tabWidget.height() - 4))
        self.groupBox_R = QtWidgets.QGroupBox(self.tab_R)
        self.groupBox_R.setGeometry(QtCore.QRect(0, 0, self.tab_R.width() / 3, self.tab_R.height()))
        self.groupBox_R.setObjectName("groupBox_R")
        self.List_Result = QtWidgets.QListWidget(self.groupBox_R)
        self.List_Result.setGeometry(QtCore.QRect(5, 35, self.groupBox_R.width() - 10, self.groupBox_R.height() - 65))
        self.List_Result.setObjectName("List_Result")
        self.Button_Open = QtWidgets.QPushButton(self.groupBox_R)
        self.Button_Open.setObjectName("Button_Open")
        self.Button_Open.setGeometry(5, self.List_Result.y()+self.List_Result.height(), self.groupBox_R.width() - 10, 30)
        if os.name == 'nt':
            self.Webview_Result = QWebEngineView(self.tab_R)
        else:
            self.Webview_Result = QWebView(self.tab_R)
        self.Webview_Result.setGeometry(QtCore.QRect(self.groupBox_R.width(), 0, self.tab_R.width()-self.groupBox_R.width(), self.tab_R.height() - 4))
        self.Webview_Result.setUrl(QtCore.QUrl("about:blank"))
        self.Webview_Result.setObjectName("Webview_Result")
        self.tabWidget.addTab(self.tab_R, "")
        self.tab_L = QtWidgets.QWidget()
        self.tab_L.setObjectName("tab_L")
        self.Text_Log = QtWidgets.QTextBrowser(self.tab_L)
        self.Text_Log.setGeometry(QtCore.QRect(5, 1, 781, 471))
        self.Text_Log.setObjectName("Text_Log")
        self.tabWidget.addTab(self.tab_L, "")
        self.tab_St = QtWidgets.QWidget()
        self.tab_St.setObjectName("tab_St")
        self.tab_St.setGeometry(QtCore.QRect(0, 0, self.gridLayoutWidget.width() - 7, self.gridLayoutWidget.height() - self.tabWidget.height() - 4))
        self.groupBox_St = QtWidgets.QGroupBox(self.tab_St)
        self.groupBox_St.setGeometry(QtCore.QRect(0, 0, self.tab_St.width(), self.tab_St.height()))
        self.groupBox_St.setObjectName("groupBox_St")
        self.Label_BL_Count = QtWidgets.QLabel(self.groupBox_St)
        self.Label_BL_Count.setText(u"0 addresses scanned.")
        self.Label_BL_Count.setGeometry(10, 20, self.groupBox_St.width(), self.Label_BL_Count.height())
        self.Label_AddLeft = QtWidgets.QLabel(self.groupBox_St)
        self.Label_AddLeft.setText(u"0 addresses left to scan.")
        self.Label_AddLeft.setGeometry(10, self.Label_BL_Count.y() + 20, self.groupBox_St.width(), self.Label_AddLeft.height())
        self.Label_PercentScanned = QtWidgets.QLabel(self.groupBox_St)
        self.Label_PercentScanned.setText(u"0% of the internet scanned.")
        self.Label_PercentScanned.setGeometry(10, self.Label_AddLeft.y() + 20, self.groupBox_St.width(), self.Label_PercentScanned.height())
        self.tabWidget.addTab(self.tab_St, "")
        self.gridLayout.addWidget(self.tabWidget, 0, 0, 1, 1)
        MainWindow.setCentralWidget(self.centralwidget)
        self.actionStart_session = QtWidgets.QAction(MainWindow)
        self.actionStart_session.setObjectName("actionStart_session")
        self.actionQuit = QtWidgets.QAction(MainWindow)
        self.actionQuit.setObjectName("actionQuit")
        self.actionClear_results = QtWidgets.QAction(MainWindow)
        self.actionClear_results.setObjectName("actionClear_results")
        self.actionClear_logs = QtWidgets.QAction(MainWindow)
        self.actionClear_logs.setObjectName("actionClear_logs")
        self.actionGo_to_project_s_website = QtWidgets.QAction(MainWindow)
        self.actionGo_to_project_s_website.setObjectName("actionGo_to_project_s_website")
        self.actionStop_session = QtWidgets.QAction(MainWindow)
        self.actionStop_session.setObjectName("actionStop_session")
        self.actionSettings = QtWidgets.QAction(MainWindow)
        self.actionSettings.setObjectName("actionSettings")
        self.actionSettings.triggered.connect(self.onactionSettings)
        self.actionClear_logs.triggered.connect(self.onactionClearL)
        self.actionClear_results.triggered.connect(self.onactionClearR)
        self.actionGo_to_project_s_website.triggered.connect(self.onactionWww)
        self.actionQuit.triggered.connect(sys.exit)
        self.actionStop_session.triggered.connect(self.actionStartStop)
        self.actionStart_session.triggered.connect(self.actionStartStop)
        self.menuFile.addAction(self.actionSettings)
        self.menuFile.addAction(self.actionQuit)
        self.menuSession.addAction(self.actionStart_session)
        self.menuSession.addAction(self.actionStop_session)
        self.menuResults.addAction(self.actionClear_results)
        self.menuLog.addAction(self.actionClear_logs)
        self.menu.addAction(self.actionGo_to_project_s_website)
        self.menubar.addAction(self.menuFile.menuAction())
        self.menubar.addAction(self.menuSession.menuAction())
        self.menubar.addAction(self.menuResults.menuAction())
        self.menubar.addAction(self.menuLog.menuAction())
        self.menubar.addAction(self.menu.menuAction())

        icon = QtGui.QIcon()
        if os.name == 'nt':
            i = QtGui.QPixmap(os.path.join(self.ol.core.application_path, "x.png"))
            icon.addPixmap(QtGui.QPixmap(os.path.join(self.ol.core.application_path, "pause.png")))
            self.spin = QtGui.QMovie(os.path.join(self.ol.core.application_path, "slider.gif"))
            self.Label_Loader.setPixmap(QtGui.QPixmap(os.path.join(self.ol.core.application_path, "slider.gif")))
        else:
            i = QtGui.QPixmap("/etc/openleecher/x.png")
            icon.addPixmap(QtGui.QPixmap("/etc/openleecher/pause.png"))
            self.spin = QtGui.QMovie("/etc/openleecher/slider.gif")
            self.Label_Loader.setPixmap(QtGui.QPixmap("/etc/openleecher/slider.gif"))

        i = i.scaled(self.tab_S.width() / 3, self.tab_S.height(), QtCore.Qt.KeepAspectRatio)
        self.Label_X.setPixmap(i)
        self.Button_Pause.setIcon(icon)
        self.Label_Loader.setMovie(self.spin)

        self.spin.start()
        self.spin.stop()
        self.u_timer = QtCore.QTimer()
        self.u_timer.timeout.connect(self.updateContent)
        self.u_timer.start(1000)
        self.actionStart_session.setEnabled(not self.ol.core.running)
        self.actionStop_session.setEnabled(self.ol.core.running)
        self.retranslateUi(MainWindow)
        self.handleEvents()
        self.loadContent()
        self.tabWidget.setCurrentIndex(0)
        self.dialog = None

        QtCore.QMetaObject.connectSlotsByName(MainWindow)

        qtRectangle = MainWindow.frameGeometry()
        centerPoint = QtWidgets.QDesktopWidget().availableGeometry().center()
        qtRectangle.moveCenter(centerPoint)
        MainWindow.move(qtRectangle.topLeft())

    # Retranslate UI
    # Apply language on UI
    # Args : MainWindow=QT root window
    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "OpenLeecher"))
        self.Button_SessStartStop.setText(_translate("MainWindow", "Start session"))
        self.Checkbox_OpenResults.setText(_translate("MainWindow", "Open results"))
        self.Label_CPU.setText(_translate("MainWindow", "<b>CPU</b> : -%"))
        self.Label_RAM.setText(_translate("MainWindow", "<b>RAM</b> : -%"))
        self.Label_Threads.setText(_translate("MainWindow", "Threads : "))
        self.Button_Open.setText(_translate("MainWindow", "Open in external program"))
        self.groupBox_S.setTitle(_translate("MainWindow", "Scanners"))
        self.groupBox_G.setTitle(_translate("MainWindow", "Generators"))
        self.groupBox_R.setTitle(_translate("MainWindow", "Results"))
        self.groupBox_St.setTitle(_translate("MainWindow", "Stats"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_S), _translate("MainWindow", "Setup"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_R), _translate("MainWindow", "Results"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_L), _translate("MainWindow", "Log"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_St), _translate("MainWindow", "Stats"))
        self.menuFile.setTitle(_translate("MainWindow", "&File"))
        self.menuSession.setTitle(_translate("MainWindow", "&Session"))
        self.menuResults.setTitle(_translate("MainWindow", "&Results"))
        self.menuLog.setTitle(_translate("MainWindow", "&Log"))
        self.menu.setTitle(_translate("MainWindow", "?"))
        self.actionStart_session.setText(_translate("MainWindow", "&Start session"))
        self.actionQuit.setText(_translate("MainWindow", "&Quit"))
        self.actionClear_logs.setText(_translate("MainWindow", "&Clear logs"))
        self.actionClear_results.setText(_translate("MainWindow", "&Clear results"))
        self.actionGo_to_project_s_website.setText(_translate("MainWindow", "&Go to project\'s website"))
        self.actionStop_session.setText(_translate("MainWindow", "&Stop session"))
        self.actionSettings.setText(_translate("MainWindow", "&Settings..."))


    # Handle events
    # Link UI events to functions.
    # Args : None
    def handleEvents(self):
        self.Button_SessStartStop.clicked.connect(self.actionStartStop)
        self.Button_Pause.clicked.connect(self.actionPause)
        self.SpinBox_Threads.valueChanged.connect(self.setmaxThreads)
        self.Checkbox_OpenResults.stateChanged.connect(self.setautoopen)
        self.List_Result.itemSelectionChanged.connect(self.preview)
        self.Button_Open.clicked.connect(self.actionOpen)


    # Load content
    # Fill UI with values from the core.
    # Args : None
    def loadContent(self):
        for g in self.ol.core.generator.g:
            i = QtWidgets.QListWidgetItem()
            i.setText(str(g.__class__.__name__))
            i.setCheckState(False)
            self.List_Generators.addItem(i)
        for s in self.ol.core.scanner.s:
            i = QtWidgets.QListWidgetItem()
            i.setText(str(s.__class__.__name__))
            i.setCheckState(False)
            self.List_Scanners.addItem(i)
        self.SpinBox_Threads.setValue(self.ol.core.maxthreads)
        self.refreshLog()

    # Update content
    # Refresh UI with values from the core.
    # Args : None
    def updateContent(self):
        self.refreshResults()
        self.refreshLog()
        self.refreshCaptors()
        self.refreshStats()

    # Refresh results
    # Refresh results UI with values from the core (called by updateContent()).
    # Args : None
    def refreshResults(self):
        if len(self.ol.core.scanner.results) > 0:
            x = self.ol.core.scanner.results.pop(0)
            i = QtWidgets.QListWidgetItem()
            i.setText(x.p + ' : ' + x.rv)
            i.setData(50, x.v)
            i.setData(51, x.rv)
            self.List_Result.addItem(i)


    # Refresh log
    # Refresh log UI with values from the core (called by updateContent()).
    # Args : None
    def refreshLog(self):
        f = open(self.ol.core.logfile, 'r')
        self.Text_Log.clear()
        self.Text_Log.setText(f.read())
        self.Text_Log.moveCursor(QtGui.QTextCursor.End)
        f.close()

    # Refresh captors
    # Refresh CPU and RAM sensors (called by updateContent()).
    # Args : None
    def refreshCaptors(self):
        cpu = int(math.trunc(psutil.cpu_percent()))
        ram = int(math.trunc(psutil.virtual_memory().percent))
        if cpu > 90:
            self.Label_CPU.setText('<b>CPU</b> : ' + '<b style=\"color:#C52233;\">' + str(cpu) + '</b>%')
        else:
            self.Label_CPU.setText('<b>CPU</b> : ' + str(cpu) + '%')

        if ram > 90:
            self.Label_RAM.setText('<b>RAM</b> : ' + '<b style=\"color:#C52233;\">' + str(ram) + '</b>%')
        else:
            self.Label_RAM.setText('<b>RAM</b> : ' + str(ram) + '%')

        self.Label_Threads.setText("Threads : " + str(len(self.ol.core.threads)) + " / ")


    # Refresh Stats
    # Refresh stats values
    # Args : None
    def refreshStats(self):
        self.Label_BL_Count.setText(str(len(self.ol.core.scanner.bl)) + " addresses scanned.")
        m = 0
        for g in self.ol.core.generator.get_actives():
            m += g.max
        if m == 0:
            self.Label_AddLeft.setText(u"0 addresses left to scan.")
            self.Label_PercentScanned.setText(u"0% of the internet scanned.")
        else:
            self.Label_AddLeft.setText(str(m - len(self.ol.core.scanner.bl)) + u" addresses left to scan.")
            self.Label_PercentScanned.setText(str((100 * len(self.ol.core.scanner.bl)) / m) + "% of the internet scanned.")


    # Action start/stop
    # Call to start/stop the core.
    # Args : None
    def actionStartStop(self):
        if self.ol.core.running is True:
            self.ol.core.stop()
            self.Button_SessStartStop.setText('Start session')
            self.spin.stop()
            self.actionStart_session.setEnabled(True)
            self.actionStop_session.setEnabled(False)
            self.Button_Pause.setChecked(False)
            self.Button_Pause.hide()
            self.List_Scanners.setEnabled(True)
            self.List_Generators.setEnabled(True)
        else:
            #Generators
            for index in range(self.List_Generators.count()):
                if self.List_Generators.item(index).checkState():
                    self.ol.core.generator.activate(self.List_Generators.item(index).text())

            #Scanners
            for index in range(self.List_Scanners.count()):
                if self.List_Scanners.item(index).checkState():
                    self.ol.core.scanner.activate(self.List_Scanners.item(index).text())

            if self.ol.core.can_run() is True:
                self.List_Scanners.setEnabled(False)
                self.List_Generators.setEnabled(False)
                self.List_Result.clear()
                self.ol.start()
                self.Button_SessStartStop.setText('Stop session')
                self.spin.start()
                self.actionStart_session.setEnabled(False)
                self.actionStop_session.setEnabled(True)
                self.Button_Pause.show()
            else:
                msg = QtWidgets.QMessageBox()
                msg.setIcon(QtWidgets.QMessageBox.Warning)
                msg.setText("Error : session cannot start!")
                msg.setInformativeText("Check if at least one generator and one scanner is selected.")
                msg.setWindowTitle("Error")
                msg.setStandardButtons(QtWidgets.QMessageBox.Ok)
                msg.exec_()

    # On action pause
    # Called when pause button is pressed.
    # Args : None
    def actionPause(self):
        self.ol.core.paused = not self.ol.core.paused
        if self.ol.core.paused:
            self.spin.stop()
        else:
            self.spin.start()

    # On action open
    # Called when open button is pressed.
    # Args : None
    def actionOpen(self):
        if self.List_Result.currentIndex().data(50) is not None:
            url = self.List_Result.currentItem().data(50)
            rawurl = self.List_Result.currentItem().data(51)
            if url.startswith('http'):
                subprocess.run([self.ol.core.s.get("AutoOpen", "browser"), url])
            elif url.startswith('ftp'):
                subprocess.run([self.ol.core.s.get("AutoOpen", "ftp"),url])


    # On action settings
    # Called when "Settings" menu is selected.
    # Args : None
    def onactionSettings(self):
        sd = Ui_Settings(self.ol.core.s, parent=self)
        sd.show()

    # On action clear results
    # Called when "Clear results" menu is selected.
    # Args : None
    def onactionClearR(self):
        self.List_Result.clear()

    # On action clear log
    # Called when "Clear log" menu is selected.
    # Args : None
    def onactionClearL(self):
        f = open(self.ol.core.logfile, 'w')
        f.write('')
        f.close()
        self.Text_Log.clear()

    # On action www
    # Called when "Go to project's website" menu is selected.
    # Args : None
    def onactionWww(self):
        webbrowser.open_new_tab('https://lwsk.tk/?openleecher')

    # Set maximum threads
    # Called when the thread count spinbox's value is modified.
    # Args : None
    def setmaxThreads(self):
        self.ol.core.maxthreads = int(self.SpinBox_Threads.value())

    # Set auto-open
    # Toggle auto-open
    # Args : None
    def setautoopen(self):
        self.ol.core.scanner.autoopen = not self.ol.core.scanner.autoopen

    # Preview
    # Load the selected item's URL in an embedded web browser
    # Args : None
    def preview(self):
        url = self.List_Result.currentItem().data(50)
        rawurl = self.List_Result.currentItem().data(51)
        self.Webview_Result.setHtml('<br/><center>Loading ' + str(url) + '/...</center>')
        if url.startswith('http'):
            self.Webview_Result.load(QtCore.QUrl(url))
        elif url.startswith('ftp'):
            self.Webview_Result.setHtml(self.preview_ftp(rawurl))

    # Preview ftp
    # Read ftp server and preview it as html
    # Args : url=server's address
    def preview_ftp(self, url):
        print("opening ", url, " in html converted mode")
        ftp = FTP(url)
        ftp.login()
        filenames = ftp.nlst()
        print("filenames : ", filenames)
        r = "<html><body style=\"background:white;\">" \
            "<h2>FTP server content</h2>" \
            "<h6>"+url+"</h6>" \
            "<hr/>"
        r += str(len(filenames)) + " files found."
        r += "<ul>"
        for f in filenames:
            r += "<li>" + str(f) + "</li>"
        r += "</ul></body></html>"
        return r

    def quit(self):
        self.ol.core.stop()
        sys.exit(0)


# Launch
# Launch GUI
# Args : None
def launch():
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())