#! /bin/python
import sys
import os
import shutil
import subprocess
from PyQt5.QtWidgets import QApplication, QSystemTrayIcon, QMenu, QAction
from PyQt5.QtGui import QIcon

class CustomTrayIcon(QSystemTrayIcon):
    def __init__(self, parent=None):
        super(CustomTrayIcon, self).__init__(parent)
        self.setIcon(QIcon("/usr/lib/aDrive/aDrive.png"))  # 替换为你的图标文件路径

        # 创建菜单项
        self.menu = QMenu()
        self.action_open = QAction("打开主页面", self)
        self.action_quit = QAction("最小化页面", self)
        self.action_exit = QAction("彻底退出程序", self)

        # 将菜单项添加到菜单
        self.menu.addAction(self.action_open)
        self.menu.addAction(self.action_quit)
        self.menu.addAction(self.action_exit)

        # 将菜单设置为托盘图标的上下文菜单trash:/Readme.html
        self.setContextMenu(self.menu)

        # 设置点击事件
        self.action_open.triggered.connect(self.open_action_triggered)
        self.action_quit.triggered.connect(self.quit_action_triggered)
        self.action_exit.triggered.connect(self.exit_action_triggered)
# 各项菜单功能
    def open_action_triggered(self):
        # 处理打开主页面操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            open_command = "nohup /usr/lib/aDrive/aDrive.sh > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        
        except Exception as e:
            print(f"Error: {e}")
            
    def quit_action_triggered(self):
        # 处理最小化操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            quit_command = "nohup xdotool search --name '阿里云盘' windowminimize > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(quit_command, shell=True)
        
        except Exception as e:
            print(f"Error: {e}")


    def exit_action_triggered(self):
        # 处理彻底退出程序操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            exit_command = "PID=$(xdotool search --name '^阿里云盘$' getwindowpid);kill $PID"  # 根据实际情况修改重启命令
            subprocess.run(exit_command, shell=True)
        
        except Exception as e:
            print(f"Error: {e}")
            
        QApplication.quit()

if __name__ == "__main__":
# Run nohup aDrive > /dev/null 2>&1 & command
    try:
        open_command = "nohup /usr/lib/aDrive/aDrive.sh > /dev/null 2>&1 &"
        subprocess.run(open_command, shell=True)

    except Exception as e:
        print(f"Error running clash-meta: {e}")

    app = QApplication(sys.argv)
    
    # 创建托盘图标
    tray_icon = CustomTrayIcon()
    tray_icon.show()

    sys.exit(app.exec_())
