import sys
import os
import shutil
import subprocess
from PyQt5.QtWidgets import QApplication, QSystemTrayIcon, QMenu, QAction
from PyQt5.QtGui import QIcon

class CustomTrayIcon(QSystemTrayIcon):
    def __init__(self, parent=None):
        super(CustomTrayIcon, self).__init__(parent)
        self.setIcon(QIcon("/usr/share/icons/hicolor/512x512/apps/clash-console-tray-script.png"))

        # 创建菜单项
        self.menu = QMenu()
        self.action_open = QAction("开启clash", self)
        self.action_quit = QAction("关闭clash", self)
        # 创建子菜单
        submenu_button1 = self.menu.addMenu("选择配置文件")

        action_button1_a = QAction("综合机场", self)
        action_button1_b = QAction("WARP+", self)
        submenu_button1.addAction(action_button1_a)
        submenu_button1.addAction(action_button1_b)

        self.action_webui = QAction("开启WebUI", self)
        self.action_about = QAction("关于", self)
        self.action_exit = QAction("Exit", self)

        # 将菜单项和子菜单添加到菜单
        self.menu.addAction(self.action_open)
        self.menu.addAction(self.action_quit)
        self.menu.addMenu(submenu_button1)
        self.menu.addAction(self.action_webui)
        self.menu.addAction(self.action_about)
        self.menu.addAction(self.action_exit)

        # 将菜单设置为托盘图标的上下文菜单
        self.setContextMenu(self.menu)

        # 设置点击事件
        self.action_open.triggered.connect(self.open_action_triggered)
        self.action_quit.triggered.connect(self.quit_action_triggered)
        action_button1_a.triggered.connect(self.button1_a_action_triggered)
        action_button1_b.triggered.connect(self.button1_b_action_triggered)
        self.action_webui.triggered.connect(self.webui_action_triggered)
        self.action_about.triggered.connect(self.about_action_triggered)
        self.action_exit.triggered.connect(self.exit_action_triggered)

    # 各项菜单功能
    def open_action_triggered(self):
        user_home = os.path.expanduser("~")
        try:
            open_command = "nohup clash-meta > /dev/null 2>&1 &"
            subprocess.run(open_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")

    def quit_action_triggered(self):
        user_home = os.path.expanduser("~")
        try:
            quit_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(quit_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")

    def button1_a_action_triggered(self):
        # 处理Button1_a操作，切换到配置1，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")

        source_file = os.path.join(user_home, ".config", "clash", "profiles", "config-1.yaml")
        target_file = os.path.join(user_home, ".config", "clash", "config.yaml")

        try:
            shutil.copyfile(source_file, target_file)
            print(f"File copied from {source_file} to {target_file}")

            kill_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(kill_command, shell=True)

            restart_command = "nohup clash-meta > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(restart_command, shell=True)
            print("clash-meta restarted")

        except Exception as e:
            print(f"Error: {e}")

    def button1_b_action_triggered(self):
        # 处理Button1_b操作，切换到配置2，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")

        source_file = os.path.join(user_home, ".config", "clash", "profiles", "config-2.yaml")
        target_file = os.path.join(user_home, ".config", "clash", "config.yaml")

        try:
            shutil.copyfile(source_file, target_file)
            print(f"File copied from {source_file} to {target_file}")

            kill_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(kill_command, shell=True)

            restart_command = "nohup clash-meta > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(restart_command, shell=True)
            print("clash-meta restarted")

        except Exception as e:
            print(f"Error: {e}")

    def webui_action_triggered(self):
        user_home = os.path.expanduser("~")
        try:
            open_command = "xdg-open https://yacd.haishan.me/"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")

    def about_action_triggered(self):
        user_home = os.path.expanduser("~")
        try:
            open_command = "xdg-open /opt/clash-console-tray-script/Readme.md"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")

    def exit_action_triggered(self):
        QApplication.quit()

if __name__ == "__main__":
    try:
        open_command = "nohup clash-meta > /dev/null 2>&1 &"
        subprocess.run(open_command, shell=True)
    except Exception as e:
        print(f"Error running clash-meta: {e}")

    app = QApplication(sys.argv)
    tray_icon = CustomTrayIcon()
    tray_icon.show()
    sys.exit(app.exec_())
